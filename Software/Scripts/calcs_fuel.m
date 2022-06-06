function [weight_km, volume_km, CO2_km] = calcs_fuel(intensity, type);
filename = "constants_fuel.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

if (strcmp(type,'Hydrogen'))
    weight_km = intensity / (Fuel.Hydrogen.EnergyDensity/Fuel.Hydrogen.EnergyEffiency);% Units: kg/km
    volume_km = weight_km / Fuel.Hydrogen.Density;% Units: L/km
    CO2_km = Fuel.Hydrogen.CO2 * volume_km;% Units: kg/km
elseif (strcmp(type,'Ammonia'))
    weight_km = intensity / (Fuel.Ammonia.EnergyDensity/Fuel.Ammonia.EnergyEffiency);% Units: kg/km
    volume_km = weight_km / Fuel.Ammonia.Density;% Units: L/km
    CO2_km = Fuel.Ammonia.CO2 * volume_km;% Units: kg/km
elseif (strcmp(type,'Diesel'))
    weight_km = intensity / (Fuel.Diesel.EnergyDensity/Fuel.Diesel.EnergyEffiency);% Units: kg/km
    volume_km = weight_km / Fuel.Diesel.Density;% Units: L/km
    CO2_km = Fuel.Diesel.CO2 * volume_km;% Units: kg/km
else
    weight_km = 0;
    volume_km = 0;
    CO2_km = 0;
end