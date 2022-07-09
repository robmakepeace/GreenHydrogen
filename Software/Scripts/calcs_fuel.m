%Calculcation transport fuel costs and C02 emissions
%Robert Makepeace
%First written 30/05/2022
%Last updated 09/07/2022

function [weight_km, volume_km, CO2_km] = calcs_fuel(intensity, type)

%Load fuel variables
filename = "constants_fuel.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename), "Fuel");

% Hydrogen Fuel
if (strcmp(type,'Hydrogen'))
    weight_km = intensity / (Fuel.Hydrogen.EnergyDensity/Fuel.Hydrogen.EnergyEffiency);% Units: kg/km
    volume_km = weight_km / Fuel.Hydrogen.Density;% Units: L/km
    CO2_km = Fuel.Hydrogen.CO2 * volume_km;% Units: kg/km

%Ammonia Fuel
elseif (strcmp(type,'Ammonia'))
    weight_km = intensity / (Fuel.Ammonia.EnergyDensity/Fuel.Ammonia.EnergyEffiency);% Units: kg/km
    volume_km = weight_km / Fuel.Ammonia.Density;% Units: L/km
    CO2_km = Fuel.Ammonia.CO2 * volume_km;% Units: kg/km

%Diesel Fuel
elseif (strcmp(type,'Diesel'))
    weight_km = intensity / (Fuel.Diesel.EnergyDensity/Fuel.Diesel.EnergyEffiency);% Units: kg/km
    volume_km = weight_km / Fuel.Diesel.Density;% Units: L/km
    CO2_km = Fuel.Diesel.CO2 * volume_km;% Units: kg/km

%Fuel not defined
else
    weight_km = 0;
    volume_km = 0;
    CO2_km = 0;
    disp('Fuel not valid');
end