%Green Hydrogen Fuel constants
%Robert Makepeace
%First written 30/05/2022
%Last updated 14/08/2022

%Load Physical variables
filename = "constants_physical.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

%Transport Fuel of Fuelled by Green Hydrogen
Fuel.Hydrogen.EnergyEffiency = .50; %Units: %
Fuel.Hydrogen.CO2 = 0.0; %Units: kg/L
Fuel.Hydrogen.Cost = 2.0; %Units: $/kg

%Transport Fuel of Fuelled by Green Ammonia
Fuel.Ammonia.EnergyEffiency = .40; %Units: %
Fuel.Ammonia.CO2 = 0.0; %Units: kg/L
Fuel.Ammonia.Cost = 0.53; %Units: $/kg

%Transport Fuel of Diesel
Fuel.Diesel.EnergyEffiency = .44; %Units: %
Fuel.Diesel.CO2 = 2.7; %Units: kg/L
Fuel.Diesel.Barrel = 100.0; %Units: $/barrel
Fuel.Diesel.BarrelVolume = 159.0; %Units: L
Fuel.Diesel.Cost = Fuel.Diesel.Barrel/((Fuel.Diesel.BarrelVolume/1000)*Physical.Diesel_WeightDensity);%Units: $/kg

%Save variables
filename = "constants_fuel.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Fuel");
%Close variable files
fclose('all');