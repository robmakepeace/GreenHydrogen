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

variablecost_test = 0.00015;
VariableCost = variable(variablecost_test,0.1,0.0,'$AUD/Mt*km','Cost ($AUD/Mt*km)','Green Hydrogen Unit Transport Cost');
future = zeros(VariableCost.Future_size,1) + variablecost_test;
VariableCost.init(future);
VariableCost.montecarlo_samples();
VariableCost.plot_montecarlo();

var_in = VariableCost;

for x = 1:CaseStudies.NumberOfRoutes
    CaseStudy_Cost(x) = var_in;
end

%Calculcate costs for each route
for x = 1:CaseStudies.NumberOfRoutes
    cost = zeros(var_in.Future_size*var_in.mc_N,1);
    for sample = 1:var_in.Future_size*var_in.mc_N
        parameters.Production = Production(CaseStudies.Routes(x,1)).mc_r(sample);
        parameters.distance = CaseStudies.dist(x);
        parameters.variablecost = VariableCost.mc_r(sample);
        cost(sample) = calcs_casestudy(parameters);
    end
    CaseStudy_Cost(x) = variable(0.0,0.0,0.0,'$AUD/Mt','Cost ($AUD/kg)',strcat('Case Study -',{' '},CaseStudies.locations(CaseStudies.Routes(x,1)),{' '},'-',{' '},CaseStudies.locations(CaseStudies.Routes(x,2)),{' '},'Cost'));
    CaseStudy_Cost(x).mc_x = var_in.mc_x;
    CaseStudy_Cost(x).mc_r = cost;
    CaseStudy_Cost(x).montecarlo_fit();
    CaseStudy_Cost(x).plot_montecarlo();   
    main_print(strcat(CaseStudies.locations(CaseStudies.Routes(x,1))," - ",CaseStudies.locations(CaseStudies.Routes(x,2)),": $",string(CaseStudy_Cost(x).CurrentValue),"/tonne"),'a');
end

