Regions.citylat(1) = -23;
Regions.citylon(1) = 133;
Regions.citylat(2) = 0;
Regions.citylon(2) = 28;
Regions.citylat(3) = 49;
Regions.citylon(3) = 10;
Regions.citylat(4) = 42;
Regions.citylon(4) = 104;
Regions.citylat(5) = 38;
Regions.citylon(5) = -100;
Regions.citylat(6) = -14;
Regions.citylon(6) = -58;
Regions.locations = {'Oceania', 'Africa','Europe','Asia','North America','South America'}

Regions.NumberOfRegions = 6;
Regions.NumberOfRoutes = 15;

Regions.dist=zeros(Regions.NumberOfRegions,Regions.NumberOfRegions);
for x = 1:Regions.NumberOfRegions;
    for y = (x+1):Regions.NumberOfRegions;
        Regions.dist(x,y)=calcs_distance(Regions.citylat(x),Regions.citylon(x),Regions.citylat(y),Regions.citylon(y));
        Regions.dist(y,x)=Regions.dist(x,y);
        disp(strcat(Regions.locations(x)," - ",Regions.locations(y),": ",string(Regions.dist(x,y))," km"))
    end
end
Regions.dist

%Linear Programming Constraints
Regions.LocalMax = 40;
Regions.TransportMax = 40;
%Region Demand Constraints
Regions.Demand = [50 50 50 50 50 50];
%Region Supply Constraints
Regions.Supply = [100 100 100 100 100 100];


%Region Production green hydrogen ($/tonne)
Production = [1.5 1.8 4.0 3.5 3.0 2.8];
for x = 1:6
    for y =1:6
        %Total cost production plus transport
        Regions.cost(x,y) = Production(x) + calcs_casestudy(Regions.dist(x,y));
    end
end
Regions.cost

%Save variables
filename = "constants_regions.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Regions");
