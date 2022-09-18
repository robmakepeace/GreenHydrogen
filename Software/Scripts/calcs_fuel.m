%Calculcation transport fuel costs and C02 emissions
%Robert Makepeace
%First written 30/05/2022
%Last updated 28/08/2022

function [weight_km, volume_km, CO2_km, FuelCost_km] = calcs_fuel(intensity, type)

    %Load fuel variables
    filename = "constants_fuel.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename));
    
    %Load Physical variables
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename));
    
    %Input 'intensity' energy intensity Units: MJ/km
    %Input 'type' fuel type: 'Hydrogen', 'Ammonia', 'Diesel'

    % Hydrogen Fuel
    if (strcmp(type,'Hydrogen'))
        weight_km = intensity / (Physical.H2_EnergyDensity/Fuel.Hydrogen.EnergyEffiency);% Units: kg/km
        volume_km = 1000 * weight_km / Physical.H2Gas300_WeightDensity;% Units: L/km
        CO2_km = Fuel.Hydrogen.CO2 * volume_km;% Units: kg/km
        FuelCost_km = weight_km * Fuel.Hydrogen.Cost;

    %Ammonia Fuel
    elseif (strcmp(type,'Ammonia'))
        weight_km = intensity / (Physical.NH3_EnergyDensity/Fuel.Ammonia.EnergyEffiency);% Units: kg/km
        volume_km = 1000 * weight_km / Physical.NH3_WeightDensity;% Units: L/km
        CO2_km = Fuel.Ammonia.CO2 * volume_km;% Units: kg/km
        FuelCost_km = weight_km * Fuel.Ammonia.Cost;

    %Diesel Fuel
    elseif (strcmp(type,'Diesel'))
        weight_km = intensity / (Physical.Diesel_EnergyDensity/Fuel.Diesel.EnergyEffiency);% Units: kg/km
        volume_km = 1000 * weight_km / Physical.Diesel_WeightDensity;% Units: L/km
        CO2_km = Fuel.Diesel.CO2 * volume_km;% Units: kg/km
        FuelCost_km = weight_km * Fuel.Diesel.Cost;
            
    %Fuel not defined
    else
        weight_km = 0;
        volume_km = 0;
        CO2_km = 0;
        FuelCost_km = 0;
        disp('Fuel not valid');
    end
    %Close files
    fclose('all');    
end