%Green Hydrogen Region Analsis constants
%Robert Makepeace
%First written 24/05/2022
%Last updated 09/07/2022

filename = "results_production.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "results_transportcosts.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

%Define region parameters

Regions.NumberOfRegions = 6;
Regions.NumberOfRoutes = 15;

%Define region simple single locations in lat/lon

%Oceania
Regions.citylat(1) = -23;
Regions.citylon(1) = 133;
%Africa
Regions.citylat(2) = 0;
Regions.citylon(2) = 28;
%Europe
Regions.citylat(3) = 49;
Regions.citylon(3) = 10;
%Asia
Regions.citylat(4) = 42;
Regions.citylon(4) = 104;
%North America
Regions.citylat(5) = 38;
Regions.citylon(5) = -100;
%South America
Regions.citylat(6) = -14;
Regions.citylon(6) = -58;

%Define region labels
Regions.locations = {'Oceania', 'Africa','Europe','Asia','North America','South America'};
Regions.locs = {'OCE', 'AFR','EUR','ASA','NAM','SAM'};

%Determine region distances between simplified points
Regions.dist=zeros(Regions.NumberOfRegions,Regions.NumberOfRegions);
main_print("\nRegion Route Constants",'a');
for x = 1:Regions.NumberOfRegions
    for y = (x+1):Regions.NumberOfRegions
        Regions.dist(x,y)=calcs_distance(Regions.citylat(x),Regions.citylon(x),Regions.citylat(y),Regions.citylon(y));
        Regions.dist(y,x)=Regions.dist(x,y);
        main_print(strcat(Regions.locations(x)," - ",Regions.locations(y),": ",string(Regions.dist(x,y))," km"),'a')
    end
end
Regions.dist;

%Linear Programming Constraints (placeholder values to be updated)
Regions.LocalMax = 40;
Regions.TransportMax = 40;

%Region Demand Constraints
Regions.Demand = [50 50 50 50 50 50];

%Region Supply Constraints
Regions.Supply = [100 100 100 100 100 100];

%Region Production green hydrogen ($/tonne) 
RegionProduction(1) = LCOE.Oceania;
RegionProduction(2) = LCOE.Africa;
RegionProduction(3) = LCOE.Europe;
RegionProduction(4) = LCOE.Asia;
RegionProduction(5) = LCOE.NorthAmerica;
RegionProduction(6) = LCOE.SouthAmerica;

%Using the cheapest transportation mode
index_transport = 2;%Ship
index_medium = 8;%Porous carbon
index_fuel = 1;%Diesel
vehicleCosts = TransportCosts.Batch(index_transport,index_medium).Unit_Cost;
fuelCosts = TransportCosts.Batch(index_transport,index_medium).UnitFuel_Cost(index_fuel);
TransportCosts = 1000*(vehicleCosts + fuelCosts); %Units: $/(km*tonnes)

for x = 1:Regions.NumberOfRegions
    for y =1:Regions.NumberOfRegions
        var = TransportCosts * Regions.dist(x,y);
        Regions.Transport((x-1)*Regions.NumberOfRegions+y) = variable(var,0.1,0.0,'$/Mt','Amount ($/Mt)',strcat('Transport Region', string(x),'-',string(y),' Transport Cost'));
        future = zeros(Regions.Transport((x-1)*Regions.NumberOfRegions+y).Future_size,1) + var;
        Regions.Transport((x-1)*Regions.NumberOfRegions+y).init(future);
        Regions.Transport((x-1)*Regions.NumberOfRegions+y).montecarlo_samples();

        Regions.cost((x-1)*Regions.NumberOfRegions+y) = variable(0,0.1,0.0,'$/Mt','Amount ($/Mt)',strcat('Cost Region', string(x),'-',string(y),' Total Cost'));
        Regions.cost((x-1)*Regions.NumberOfRegions+y).mc_x = RegionProduction(1).mc_x;
        Regions.cost((x-1)*Regions.NumberOfRegions+y).mc_r = RegionProduction(1).mc_r;
        for sample = 1: RegionProduction(1).Future_size*RegionProduction(1).mc_N
            %Total cost production plus transport
            Regions.cost((x-1)*Regions.NumberOfRegions+y).mc_r(sample) = RegionProduction(x).mc_r(sample) + Regions.Transport((x-1)*Regions.NumberOfRegions+y).mc_r(sample);
        end

        Regions.cost((x-1)*Regions.NumberOfRegions+y).montecarlo_fit();
        %Regions.cost((x-1)*Regions.NumberOfRegions+y).plot_montecarlo();
    end
end
Regions.cost;

%Save variables
filename = "constants_regions.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Regions");
%Close files
fclose('all');