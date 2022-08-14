%Green Hydrogen Fuel constants
%Robert Makepeace
%First written 30/05/2022
%Last updated 14/08/2022

%Transport Fuel of Fuelled by Green Hydrogen
Fuel.Hydrogen.EnergyEffiency = .50; %Units: %
Fuel.Hydrogen.CO2 = 0.0; %Units: kg/L

%Transport Fuel of Fuelled by Green Ammonia
Fuel.Ammonia.EnergyEffiency = .40; %Units: %
Fuel.Ammonia.CO2 = 0.0; %Units: kg/L

%Transport Fuel of Diesel
Fuel.Diesel.EnergyEffiency = .44; %Units: %
Fuel.Diesel.CO2 = 2.7; %Units: kg/L

%Save variables
filename = "constants_fuel.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Fuel");