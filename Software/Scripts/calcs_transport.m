function [Unit_Cost, Medium] = calcs_transport(Medium)
    %Hydrogen Gas

    %Determine if weight or volume constraint of the transport
    P_bar = Medium.Pressure; %bar
    P_PA = P_bar * 100000; %Pa
    V1 = Medium.VolumeLimit;%m3
    R = 8.31446261815324; %J/(K.mol)
    T = 20 + 273.15; %Kelvin
    n1 = (P_PA*V1)/(R*T);%mol
    MM = 2.016; %g/mol
    m_g = n1 * MM; %g
    m_kg1 = m_g / 1000; %kg
    
    m_kg2 = Medium.WeightLimit;
    m_g2 = m_kg2 * 1000;
    n2 = m_g2 / MM; 
    V2 = n2 * R * T / P_PA;
    
    if V1 < V2
        Medium.ActualWeight = m_kg1;
        Medium.ActualVolume = V1;
    else
        Medium.ActualWeight = m_kg2;
        Medium.ActualVolume = V2;
    end
    Duration_days = Medium.Lifetime * Medium.Utilisation * 365; % Units: days
    Duration_hrs = Duration_days * 24; % Units: hours

    intensity = 1;
    [weight, volume, CO2] = calcs_fuel(intensity, 'hydrogen');
    [weight, volume, CO2] = calcs_fuel(intensity, 'Diesel');

    Total_Cost = Medium.CapitalCost + Duration_days * Medium.VariableCost; % Units: $
    Total_Transport = Medium.ActualWeight * Duration_hrs * Medium.Speed; % Units: kg*km
    Unit_Cost = Total_Cost / Total_Transport; % Units: $ / (kg*km)
end