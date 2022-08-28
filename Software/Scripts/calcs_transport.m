%Calculcation transportation 
%Robert Makepeace
%First written 19/06/2022
%Last updated 09/07/2022

function Output = calcs_transport(Medium, Payload, Description)
    %Load physical variables
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),'Physical');

        %Determine if weight or volume constraint of the transport
    if (Payload.Type == 0)
        %Hydrogen Gas

        %Convert units    
        P_PA = Medium.Pressure * 100000; %kPa
        V1 = Medium.VolumeLimit;
    
        %Calcuclate mass of payload from the volume limit
        [n1, m_kg1, density1] = calcs_gaslaw (P_PA, V1, Physical.AmbientTemp_K, Physical.GasConstant, Payload.MM);

        %Calcuclate volume of payload from the mass limit
        m_kg2 = Medium.WeightLimit;
        V2 = m_kg2 / density1;

        Output.WeightDensity = density1;
    else
        %For non gas types, calculcate the mass from the volume limit based on the weight density 
        V1 = Medium.VolumeLimit;
        m_kg1 = V1 * Payload.WeightDensity;
        %For non gas types, calculcate the volume from the mass limit based on the weight density 
        m_kg2 = Medium.WeightLimit;
        V2 = m_kg2 / Payload.WeightDensity;

        Output.WeightDensity = Payload.WeightDensity;
    end

    if V1 < V2
        Output.ActualWeight = m_kg1;
        Output.ActualVolume = V1;
    else
        Output.ActualWeight = m_kg2;
        Output.ActualVolume = V2;
    end
    Output.EnergyPerLoad = Output.ActualWeight * Payload.WeightDensity;

    [m_kg1, V1, m_kg2, V2];
    %Calculcate the 
    Output.Duration_days = Medium.Lifetime * Medium.Utilisation * 365; % Units: days
    Output.Duration_hrs = Output.Duration_days * 24; % Units: hours

    %Trasport Fuel Costs
    [Output.Diesel.weight_km, Output.Diesel.volume_km, Output.Diesel.CO2_km, Output.Diesel.FuelCost_km] = calcs_fuel(Medium.Energy, 'Diesel');
    [Output.H2.weight_km, Output.H2.volume_km, Output.H2.CO2_km, Output.H2.FuelCost_km] = calcs_fuel(Medium.Energy, 'Hydrogen');
    [Output.NH3.weight_km, Output.NH3.volume_km, Output.NH3.CO2_km, Output.NH3.FuelCost_km] = calcs_fuel(Medium.Energy, 'Ammonia');

    % Graphing (per transport unit)
    y = [Output.Diesel.weight_km Output.H2.weight_km Output.NH3.weight_km;...
        Output.Diesel.volume_km Output.H2.volume_km Output.NH3.volume_km;...
        Output.Diesel.CO2_km Output.H2.CO2_km Output.NH3.CO2_km];
    %visualise_transport(y, strcat(Description,'(per Transport Unit)'));

    % Graphing (per tonne of compressed Green Hydrogen)
    z = 1000 * y / Output.ActualWeight;
    %visualise_transport(z, strcat(Description,'(per tGH2)'));

    %Calcuclate Total Cost of Transport
    Output.Total_Cost = Medium.CapitalCost + Output.Duration_days * Medium.VariableCost; % Units: $
    Output.Total_Transport = Output.ActualWeight * Output.Duration_hrs * Medium.Speed; % Units: kg*km
    Output.Unit_Cost = Output.Total_Cost / Output.Total_Transport; % Units: $ / (kg*km)
    Output.UnitFuel_Cost(1) = Output.Diesel.FuelCost_km / Output.ActualWeight; % Units: $ / (kg*km)
    Output.UnitFuel_Cost(2) = Output.H2.FuelCost_km / Output.ActualWeight; % Units: $ / (kg*km)
    Output.UnitFuel_Cost(3) = Output.NH3.FuelCost_km / Output.ActualWeight; % Units: $ / (kg*km)

    %Close files
    fclose('all');
end