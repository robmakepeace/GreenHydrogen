%Green Hydrogen Hydrogen Production Analysis
%Robert Makepeace
%First written 10/07/2022
%Last updated 10/07/2022

function unit_cost = calcs_production(parameters)
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),"Physical");

    %Placeholder calcuclation to be developed further

    utilisation = 0.8; %Units: %
    lifetime = 30; %Units: Years
    duration = lifetime * 365 * 24 * utilisation; 

    %electricity_kilo_GH2 = 50; %Units: kWhr/kgGH2
    %electricity_cost1 = parameters.Electricity * electricity_kilo_GH2;
    
    Electrosyler_Output = 200;%Units: m3/hr/1MW
    H2_Weight = Electrosyler_Output * Physical.Gas_Density;%Units: kg/hr
    H2_Weight_Lifetime = H2_Weight * duration;%Units: kg/lifetime
    electricity_cost = parameters.Electricity/parameters.Electroysler_Effeciency;%Units: $AUD/hr
    electricity_cost_Lifetime = electricity_cost * duration;%Units: $AUD/lifetime

    opex_lifetime = parameters.OPEX_Electroysler * lifetime;
    total_cost = electricity_cost_Lifetime + parameters.CAPEX_Electroysler + opex_lifetime;
    unit_cost = total_cost/H2_Weight_Lifetime;
end