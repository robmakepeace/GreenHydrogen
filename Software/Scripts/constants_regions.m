%Green Hydrogen Region Analsis constants
%Robert Makepeace
%First written 24/05/2022
%Last updated 09/07/2022

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


%Region Production green hydrogen ($/tonne) (placeholder values to be updated)
Production = [1.5 1.8 4.0 3.5 3.0 2.8];
for x = 1:Regions.NumberOfRegions
    for y =1:Regions.NumberOfRegions
        %Total cost production plus transport
        Regions.cost(x,y) = Production(x) + calcs_casestudy(Regions.dist(x,y));
    end
end
Regions.cost;

%Save variables
filename = "constants_regions.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Regions");
