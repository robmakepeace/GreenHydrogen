%Transport Fuel of Fuelled by Green Hydrogen
Fuel.Hydrogen.EnergyDensity = 120;%Units: MJ/kg
Fuel.Hydrogen.EnergyEffiency = .50; %Units: %
Fuel.Hydrogen.Density = 0.0899; %Units: kg/L
Fuel.Hydrogen.CO2 = 0.0; %Units: kg/L

%Transport Fuel of Fuelled by Green Ammonia
Fuel.Ammonia.EnergyDensity = 22.5;%Units: MJ/kg
Fuel.Ammonia.EnergyEffiency = .40; %Units: %
Fuel.Ammonia.Density = 0.89; %Units: kg/L
Fuel.Ammonia.CO2 = 0.0; %Units: kg/L

%Transport Fuel of Diesel
Fuel.Diesel.EnergyDensity = 45.5;%Units: MJ/kg
Fuel.Diesel.EnergyEffiency = .44; %Units: %
Fuel.Diesel.Density = 0.85; %Units: kg/L
Fuel.Diesel.CO2 = 2.7; %Units: kg/L

%Save variables
filename = "constants_fuel.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Fuel");