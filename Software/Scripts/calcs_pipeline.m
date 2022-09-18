%Calculcation pipeline
%Robert Makepeace
%First written 14/08/2022
%Last updated 14/08/2022

function Output = calcs_pipeline(Medium, Description, Distance)
    %Load physical variables
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),'Physical');

    %Calculate pipe volume
    Radius_m = (Medium.Diameter/2) / 1000;
    CrossSection = pi*((Radius_m)^2);
    Length = 1; %Units: m 
    Volume = CrossSection * Length; % Units m^3

    H2_Volume = Volume * Medium.NaturalGasBlendProp;
    NG_Volume  = Volume * (1-Medium.NaturalGasBlendProp);


    %Calcuclate mass of Hydrogen in section of the pipe
    [H2_n, H2_mass, H2_density] = calcs_gaslaw (Medium.Pressure, H2_Volume, Physical.AmbientTemp_K, Physical.GasConstant, Physical.H2_MM);

    %Calcuclate mass of Natural Gas in section of the pipe
    [NG_n, NG_mass,NG_density] = calcs_gaslaw (Medium.Pressure, NG_Volume, Physical.AmbientTemp_K, Physical.GasConstant, Physical.NG_MM);
    
    [H2_n, H2_mass, H2_density];
    [NG_n, NG_mass,NG_density];

    Throughput = H2_mass / (Length / Medium.Velocity) ; %Units: kg/s;

    Duration_years = Medium.Lifetime * Medium.Utilisation; %Units: years
    Duration_seconds = Duration_years * 365 * 24 * 3600; %Units: seconds

    Output.Total_Cost = Medium.CapitalCost * Distance + Duration_years * Medium.VariableCost * Distance; % Units: $/km
    Output.Total_Transport = Throughput * Duration_seconds ; % Units: kg
    Output.Unit_Cost = Output.Total_Cost / Output.Total_Transport; % Units: $ / (kg*km)
    %Close files
    fclose('all');
end
