function [weight, volume, CO2] = calcs_fuel(intensity, type);
filename = "constants_fuel.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

if (strcmp(type,'Hydrogen'))
    weight = intensity / (Fuel.Hydrogen.EnergyDensity/Fuel.Hydrogen.EnergyEffiency);
    volume = weight / Fuel.Hydrogen.Density;
    CO2 = Fuel.Hydrogen.CO2 * volume;
elseif (strcmp(type,'Diesel'))
    weight = intensity / (Fuel.Diesel.EnergyDensity/Fuel.Diesel.EnergyEffiency);
    volume = weight / Fuel.Diesel.Density;
    CO2 = Fuel.Diesel.CO2 * volume;
else
    weight = 0;
    volume = 0;
    CO2 = 0;
end