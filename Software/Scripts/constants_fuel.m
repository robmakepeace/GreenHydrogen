Fuel.Hydrogen.EnergyDensity = 120;%Units: MJ/kg
Fuel.Hydrogen.EnergyEffiency = .50; %Units: %
Fuel.Hydrogen.Density = 0.02; %Units: kg/m3
Fuel.Hydrogen.CO2 = 0.0; %Units: kg/L
Fuel.Diesel.EnergyDensity = 45.5;%Units: MJ/kg
Fuel.Diesel.EnergyEffiency = .44; %Units: %
Fuel.Diesel.Density = 0.85; %Units: kg/L
Fuel.Diesel.CO2 = 2.7; %Units: kg/L
filename = "constants_fuel.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Fuel");