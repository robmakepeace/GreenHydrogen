filename = "constants_physical.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

Conversion.GasConstant = 8.31446261815324;%Unit J/Kmol

%Unpressured Hydrogen 
Conversion.H2.Labels = 'H2';
Conversion.H2.Pressure = Physical.AmbientPressure;%Units: kPa
Conversion.H2.Density = 0.08375; % Units kg/m3
Conversion.H2.Temperature = Physical.AmbientTemp_K; %Units Kelvin
Conversion.H2.MM = 1.00784*2;%Units: g/mol
Conversion.H2.Weight = 1;%Units: kg
Conversion.H2.Amount = Conversion.H2.Weight*1000/Conversion.H2.MM; %Units moles

%Compressed Hydrogen
Conversion.CH2.Labels = 'CH2';
Conversion.CH2.Pressure = 50000;%Units: kPa
Conversion.CH2.Efficiency = 0.7;%Units: %

%Liquified Hydrogen 
Conversion.LH2.Labels = 'LH2';
Conversion.LH2.Energy = 10;%Units kWhr/kg

%Cryo-Compressed Hydrogen
Conversion.CCH2.Labels = 'CCH2';
Conversion.CCH2.Pressure = 70000;%Units: kPa
Conversion.CCH2.Temperature = 20;%Units: Kelvin
Conversion.CCH2.Efficiency = 0.7;%Units: %

%Save variables
filename = "constants_conversion.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Conversion");