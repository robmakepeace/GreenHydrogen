%Green Hydrogen Case Studies Analysis Script
%Robert Makepeace
%First written 25/05/2022
%Last updated 09/07/2022

%Load Case Study Variables
filename = "constants_casestudies.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "results_production.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "results_transportcosts.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "constants.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

main_print("\nCase Study Analysis",'a');

%Display Case Study Constants
CaseStudies;

%Placeholder costs
Production(1) = LCOE.Australia;
Production(2) = LCOE.Brazil;%LCOE.Chile;
Production(3) = LCOE.Morocco;
Production(4) = LCOE.Namibia;
Production(5) = LCOE.SaudiArabia;
Production(6) = LCOE.Japan;
Production(7) = LCOE.Korea;
Production(8) = LCOE.Belgium;%LCOE.Germany;
Production(9) = LCOE.Japan;%LCOE.Singapore;
Production(10) = LCOE.China;
Production(11) = LCOE.China;%LCOE.India;
Production(12) = LCOE.USA;

for index_transport = 1:3
    for index_medium = 1:13
        for index_fuel = 1:3
            vehicleCosts = TransportCosts.Batch(index_transport,index_medium).Unit_Cost;
            fuelCosts = TransportCosts.Batch(index_transport,index_medium).UnitFuel_Cost(index_fuel);
            variablecost_test = vehicleCosts + fuelCosts;
            index = (index_transport-1)*39+(index_medium-1)*3+index_fuel;
            Description = strcat('Vehicle: ',TransportCosts.Medium_Description(index_transport), '; Payload: ',TransportCosts.Payloads_Description(index_medium), '; Vehicle Fuel: ',TransportCosts.Fuel_Description(index_fuel),'; Transport Unit Costs ($/(kg*km)');
            VariableCost(index) = variable(variablecost_test,0.1,0.0,'$AUD/Mt*km','Cost ($AUD/Mt*km)',Description);
            future = zeros(VariableCost(index).Future_size,1) + variablecost_test;
            VariableCost(index).init(future);
            VariableCost(index).montecarlo_samples();
            %VariableCost(index).plot_montecarlo();
        end
    end
end
PipeDescription(1) = {'Vehicle: Pipeline H2 100pc'};
PipeDescription(2) = {'Vehicle: Pipeline H2 20pc Blend'};
PipeDescription(3) = {'Vehicle: Pipeline Natural Gas 100pc'};
for index_pipeline = 1:2%3
    variablecost_test = TransportCosts.Pipe(index_pipeline).Unit_Cost;
    VariableCost(index_pipeline+117) = variable(variablecost_test,0.1,0.0,'$AUD/Mt*km','Cost ($AUD/Mt*km)',PipeDescription(index_pipeline));
    future = zeros(VariableCost(index_pipeline+117).Future_size,1) + variablecost_test;
    VariableCost(index_pipeline+117).init(future);
    VariableCost(index_pipeline+117).montecarlo_samples();
    %VariableCost(index).plot_montecarlo();
end

var_in = VariableCost(1);

for x = 1:CaseStudies.NumberOfRoutes
    for index = 1:119%120
        CaseStudy_Cost(x).Cost(index) = var_in;
    end
end

%Calculcate costs for each route
for x = 1:CaseStudies.NumberOfRoutes
    for index = 1:119%120
        cost = zeros(var_in.Future_size*var_in.mc_N,1);
        for sample = 1:var_in.Future_size*var_in.mc_N
            parameters.Production = Production(CaseStudies.Routes(x,1)).mc_r(sample);
            parameters.distance = CaseStudies.dist(x);
            parameters.variablecost = VariableCost(index).mc_r(sample);
            parameters.C = VariableCost(index).mc_r(sample);
            cost(sample) = calcs_casestudy(parameters);
        end
        casestudymin(x,index) = median(cost);
        CaseStudy_Cost(x).Cost(index) = variable(0.0,0.0,0.0,'$AUD/Mt','Cost ($AUD/kg)',strcat('Case Study -',{' '},CaseStudies.locations(CaseStudies.Routes(x,1)),{' '},'-',{' '},CaseStudies.locations(CaseStudies.Routes(x,2)),{' '},'Cost'));
        CaseStudy_Cost(x).Cost(index).mc_x = var_in.mc_x;
        CaseStudy_Cost(x).Cost(index).mc_r = cost;
        CaseStudy_Cost(x).Cost(index).montecarlo_fit();
        %CaseStudy_Cost(x).plot_montecarlo();   
        %main_print(strcat(CaseStudies.locations(CaseStudies.Routes(x,1))," - ",CaseStudies.locations(CaseStudies.Routes(x,2)),VariableCost(index).Name,": $",string(CaseStudy_Cost(x).Cost(index).CurrentValue),"/kg"),'a');
    end
end
for x = 1:CaseStudies.NumberOfRoutes
    [M, I] = min(casestudymin(x,:));
    main_print(strcat(CaseStudies.locations(CaseStudies.Routes(x,1))," - ",CaseStudies.locations(CaseStudies.Routes(x,2)),"; Distance: ",string(CaseStudies.dist(x)),"km;",VariableCost(I).Name,": $",string(CaseStudy_Cost(x).Cost(I).CurrentValue),"/kg"),'a');
end


%Visualisation
for r = 1:CaseStudies.NumberOfRoutes
    x = 1:Transport.NumberOfPayloads-2;
    y = zeros(5,Transport.NumberOfPayloads-2);
    y(1,:) = Production(CaseStudies.Routes(r,1)).CurrentValue;
    for i=1:Transport.NumberOfPayloads-4
        vehicleCosts = TransportCosts.Batch(1,i).Unit_Cost;
        fuelCosts = TransportCosts.Batch(1,i).UnitFuel_Cost(1);
        y(3,i) = CaseStudies.dist(r)*(vehicleCosts + fuelCosts);
        y(2,i) = 0.2;
        y(4,i) = 0.2;
        y(5,i) = (TransportCosts.Batch(1,i).Diesel.CO2_km / TransportCosts.Batch(1,i ).EnergyPerLoad) *  Hydrogen.Economic.Carbon_Price.value_at_year(2035);
    end
    y(1,Transport.NumberOfPayloads-3) = Production(CaseStudies.Routes(r,1)).CurrentValue;
    y(2,Transport.NumberOfPayloads-3) = 0;
    y(3,Transport.NumberOfPayloads-3) = CaseStudies.dist(r)*TransportCosts.Pipe(1).Unit_Cost;
    y(4,Transport.NumberOfPayloads-3) = 0;
    y(5,Transport.NumberOfPayloads-3) = 0;    
    y(1,Transport.NumberOfPayloads-2) = Production(CaseStudies.Routes(r,2)).CurrentValue;
    y(2,Transport.NumberOfPayloads-2) = 0;
    y(3,Transport.NumberOfPayloads-2) = 0;
    y(4,Transport.NumberOfPayloads-2) = 0;
    y(5,Transport.NumberOfPayloads-2) = 0;
    y(2,1) = 0.1;
    y(4,1) = 0;
    y(2,2) = 1.0;
    y(4,2) = 0.3;
    y(2,3) = 1.5;
    y(4,3) = 1.2;
    y(2,4) = 1.5;
    y(4,4) = 1.2;
    y(2,5) = 0.4;
    y(4,5) = 0.6;
    y(2,6) = 0.7;
    y(4,6) = 0.6;
    y(2,7) = 1.2;
    y(4,7) = 0.9;
    y(2,8) = 0.5;
    y(4,8) = 0.4;
    y(2,9) = 1.1;
    y(4,9) = 0.6;
    y(2,10) = 1.3;
    y(4,10) = 1.0;
    x_cats = Payloads.Description(1:Transport.NumberOfPayloads-4);
    x_cats(size(Payloads.Description,2)-4+1) = {'Pipeline'};
    x_cats(size(Payloads.Description,2)-4+2) = {'Destination Local Production'};
    y_cats = {'Proudction', 'Conversion', 'Transport', 'Reconverison', 'CO2'};
    desc = strcat("CaseStudy - ",CaseStudies.locations(CaseStudies.Routes(r,1))," - ",CaseStudies.locations(CaseStudies.Routes(r,2)));
    xlabel_desc = 'Levelised Cost of Hydrogen (LCOH) ($AUD/kgGH2)';
    visualise_breakdown(x, y, x_cats, y_cats,desc,xlabel_desc)
end

%Close files
fclose('all');
