%Green Hydrogen Regions Analysis Script
%Robert Makepeace
%First written 15/05/2022
%Last updated 09/07/2022

%Load Region Variables
filename = "constants_regions.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Regions");

main_print("\nRegions Analysis",'a');

%Display Regions Constants
Regions;

%Generate Monte Carlo variables
var = Regions.LocalMax;
Regions_LocalMax = variable(var,0.1,0.0,'Mt','Amount (Mt)','Local Production Constraint');
future = zeros(Regions_LocalMax.Future_size,1) + var;
Regions_LocalMax.init(future);
Regions_LocalMax.montecarlo_samples();
%Regions_LocalMax.plot_montecarlo();

%Generate Monte Carlo variables
var = Regions.TransportMax;
Regions_TransportMax = variable(var,0.1,0.0,'Mt','Amount (Mt)','Transport Production Constraint');
future = zeros(Regions_TransportMax.Future_size,1) + var;
Regions_TransportMax.init(future);
Regions_TransportMax.montecarlo_samples();
%Regions_TransportMax.plot_montecarlo();

%Generate Monte Carlo variables
for x=1:Regions.NumberOfRegions
    var = Regions.Supply(x);
    Regions_Supply(x) = variable(var,0.1,0.0,'Mt','Amount (Mt)',strcat('Supply Region', string(x),' Production Constraint'));
    future = zeros(Regions_Supply(x).Future_size,1) + var;
    Regions_Supply(x).init(future);
    Regions_Supply(x).montecarlo_samples();
    %Regions_Supply(x).plot_montecarlo();
end

%Generate Monte Carlo variables
for x=1:Regions.NumberOfRegions
    var = Regions.Demand(x);
    Regions_Demand(x) = variable(var,0.1,0.0,'Mt','Amount (Mt)',strcat('Demand Region', string(x),' Production Constraint'));
    future = zeros(Regions_Demand(x).Future_size,1) + var;
    Regions_Demand(x).init(future);
    Regions_Demand(x).montecarlo_samples();
    %Regions_Demand(x).plot_montecarlo();
end

%Generate Monte Carlo variables
Total = zeros(Regions_LocalMax.Future_size,Regions_LocalMax.mc_N,Regions.NumberOfRegions,Regions.NumberOfRegions);
for year = 1:1%Regions_LocalMax.Future_size
    for sample = 1:Regions_LocalMax.mc_N
        parameters.LocalMax = Regions_LocalMax.mc_r((year-1)*Regions_LocalMax.mc_N+sample);
        parameters.TransportMax = Regions_TransportMax.mc_r((year-1)*Regions_LocalMax.mc_N+sample);
        for x = 1:Regions.NumberOfRegions
            for y = 1:Regions.NumberOfRegions
                parameters.cost(x,y) = Regions.cost((x-1)*Regions.NumberOfRegions+y).mc_r((year-1)*Regions_LocalMax.mc_N+sample);
            end
        end
        for x=1:Regions.NumberOfRegions
            parameters.Supply(x) = Regions_Supply(x).mc_r((year-1)*Regions_LocalMax.mc_N+sample);
            parameters.Demand(x) = Regions_Demand(x).mc_r((year-1)*Regions_LocalMax.mc_N+sample);
        end
        Total(year,sample,:,:) = reshape(calcs_regions(parameters),1,1,6,6);
    end
    Optimal = zeros(Regions.NumberOfRegions,Regions.NumberOfRegions);
    for x = 1:Regions.NumberOfRegions
        for y = 1:Regions.NumberOfRegions
            Optimal(x,y) = sum(Total(year,:,x,y))/Regions_LocalMax.mc_N;
        end
    end
    Optimal;
    main_print(strcat("Optimal Solution",{' '},string(year+Regions_LocalMax.Year-1)),'a')
    for x=1:6
        main_print(strcat(string(Optimal(x,1)),"\t",string(Optimal(x,2)),"\t",string(Optimal(x,3)),"\t",string(Optimal(x,4)),"\t",string(Optimal(x,5)),"\t",string(Optimal(x,6)),"\t"),'a')
    end
    
    %Visualisation
    %https://au.mathworks.com/matlabcentral/fileexchange/66746-alluvial-flow-diagram
    %Reference: Alexander Carmeli (2022). Alluvial flow diagram (https://www.mathworks.com/matlabcentral/fileexchange/66746-alluvial-flow-diagram), MATLAB Central File Exchange. Retrieved May 25, 2022.
    global Self
    if Self.run_graphics == 1
        fig=figure;
        graph_title = strcat(string(year+Regions_LocalMax.Year-1),"Green Hydrogen World Region Flows (LHS Supply to RHS Demand)");
        alluvialflow(Optimal,Regions.locations,Regions.locations,graph_title);
        fig.WindowState = 'maximized';
        filename = strcat(string(year+Regions_LocalMax.Year-1),"_worldregions_alluvialflow.png");
        foldername = pwd + "\Graphs\";
        saveas(fig,fullfile(foldername, filename));
    end
end