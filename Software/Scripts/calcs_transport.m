%Calculcation transportation 
%Robert Makepeace
%First written 19/06/2022
%Last updated 09/07/2022

function Output = calcs_transport(Medium,Description)
    %Load physical variables
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),'Physical');

    %Hydrogen Gas

    %Determine if weight or volume constraint of the transport
    P_bar = Medium.Pressure; %bar
    P_PA = P_bar * 100000; %Pa
    V1 = Medium.VolumeLimit;%m3
    R = Physical.GasConstant; %J/(K.mol)
    T = Physical.AmbientTemp_K; %Kelvin
    n1 = (P_PA*V1)/(R*T);%mol
    MM = Physical.H2_MM; %g/mol
    m_g = n1 * MM; %g
    m_kg1 = m_g / 1000; %kg
    

    m_kg2 = Medium.WeightLimit;
    m_g2 = m_kg2 * 1000;
    n2 = m_g2 / MM; 
    V2 = n2 * R * T / P_PA;
    
    if V1 < V2
        Output.ActualWeight = m_kg1;
        Output.ActualVolume = V1;
    else
        Output.ActualWeight = m_kg2;
        Output.ActualVolume = V2;
    end
    %Calculcate the 
    Output.Duration_days = Medium.Lifetime * Medium.Utilisation * 365; % Units: days
    Output.Duration_hrs = Output.Duration_days * 24; % Units: hours

    %Trasport Fuel Costs
    [Output.Diesel.weight_km, Output.Diesel.volume_km, Output.Diesel.CO2_km] = calcs_fuel(Medium.Energy, 'Diesel');
    [Output.H2.weight_km, Output.H2.volume_km, Output.H2.CO2_km] = calcs_fuel(Medium.Energy, 'Hydrogen');
    [Output.NH3.weight_km, Output.NH3.volume_km, Output.NH3.CO2_km] = calcs_fuel(Medium.Energy, 'Ammonia');

    % Graphing (per transport unit)
    y = [Output.Diesel.weight_km Output.H2.weight_km Output.NH3.weight_km;...
        Output.Diesel.volume_km Output.H2.volume_km Output.NH3.volume_km;...
        Output.Diesel.CO2_km Output.H2.CO2_km Output.NH3.CO2_km];
    visualise_transport(y, strcat(Description,'(per Transport Unit)'));

    % Graphing (per tonne of compressed Green Hydrogen)
    z = 1000 * y / Output.ActualWeight;
    visualise_transport(z, strcat(Description,'(per tGH2)'));

    %Calcuclate Total Cost of Transport
    Output.Total_Cost = Medium.CapitalCost + Output.Duration_days * Medium.VariableCost; % Units: $
    Output.Total_Transport = Output.ActualWeight * Output.Duration_hrs * Medium.Speed; % Units: kg*km
    Output.Unit_Cost = Output.Total_Cost /Output.Total_Transport; % Units: $ / (kg*km)
end