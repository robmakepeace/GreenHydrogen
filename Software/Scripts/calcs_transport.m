function Output = calcs_transport(Medium,Description)
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
        Output.ActualWeight = m_kg1;
        Output.ActualVolume = V1;
    else
        Output.ActualWeight = m_kg2;
        Output.ActualVolume = V2;
    end
    Output.Duration_days = Medium.Lifetime * Medium.Utilisation * 365; % Units: days
    Output.Duration_hrs = Output.Duration_days * 24; % Units: hours

    [Output.Diesel.weight_km, Output.Diesel.volume_km, Output.Diesel.CO2_km] = calcs_fuel(Medium.Energy, 'Diesel');
    [Output.H2.weight_km, Output.H2.volume_km, Output.H2.CO2_km] = calcs_fuel(Medium.Energy, 'Hydrogen');
    [Output.NH3.weight_km, Output.NH3.volume_km, Output.NH3.CO2_km] = calcs_fuel(Medium.Energy, 'Ammonia');

    % Graphing 
    y = [Output.Diesel.weight_km Output.H2.weight_km Output.NH3.weight_km;...
        Output.Diesel.volume_km Output.H2.volume_km Output.NH3.volume_km;...
        Output.Diesel.CO2_km Output.H2.CO2_km Output.NH3.CO2_km];
    visualise_transport(y, strcat(Description,'(per Transport Unit)'));

    % Graphing 
    
    y = [Output.Diesel.weight_km Output.H2.weight_km Output.NH3.weight_km;...
        Output.Diesel.volume_km Output.H2.volume_km Output.NH3.volume_km;...
        Output.Diesel.CO2_km Output.H2.CO2_km Output.NH3.CO2_km];
    z = 1000 * y / Output.ActualWeight;
    visualise_transport(z, strcat(Description,'(per tGH2)'));


    Output.Total_Cost = Medium.CapitalCost + Output.Duration_days * Medium.VariableCost; % Units: $
    Output.Total_Transport = Output.ActualWeight * Output.Duration_hrs * Medium.Speed; % Units: kg*km
    Output.Unit_Cost = Output.Total_Cost /Output.Total_Transport; % Units: $ / (kg*km)
end