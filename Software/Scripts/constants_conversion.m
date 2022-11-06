%Green Hydrogen Conversion constants
%Robert Makepeace
%First written 19/05/2022
%Last updated 09/07/2022

%Load Physical variables
filename = "constants_physical.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Physical");

%Unpressured Hydrogen 
% Conversion.H2.Labels = 'H2';
% Conversion.H2.Pressure = Physical.AmbientPressure;%Units: kPa
% Conversion.H2.Density = Physical.H2Gas_WeightDensity; % Units kg/m3
% Conversion.H2.Temperature = Physical.AmbientTemp_K; %Units Kelvin
% Conversion.H2.MM = Physical.H2_MM;%Units: g/mol
% Conversion.H2.Weight = 1;%Units: kg
% Conversion.H2.Amount = Conversion.H2.Weight*1000/Conversion.H2.MM; %Units moles
% 
% %Compressed Hydrogen
% Conversion.CH2.Labels = 'CH2';
% Conversion.CH2.Pressure = 50000;%Units: kPa
% Conversion.CH2.Efficiency = 0.7;%Units: %
% 
% %Liquified Hydrogen 
% Conversion.LH2.Labels = 'LH2';
% Conversion.LH2.Energy = 36;%Units MJ/kg
% 
% %Cryo-Compressed Hydrogen
% Conversion.CCH2.Labels = 'CCH2';
% Conversion.CCH2.Energy = 36;%Units MJ/kg
% 
% %Slush Hydrogen
% Conversion.SH2.Labels = 'SH2';
% Conversion.SH2.Temperature = 13.8;%Units: Kelvin
% Conversion.SH2.Pressure = 70000;%Units: kPa
% Conversion.SH2.Efficiency = 0.7;%Units: %

Conversion.CAPEX = [25000 1400000 800000 900000 116000 79000 900000 130000000 1150000 800000];
Conversion.OPEX = [500 56000 12000 14000 1740 2185 36000 1000000 100000 70000];
Conversion.CAPACITY = [100 260 100 100 100 100 100 4200 100 100];
Conversion.ENERGY = [1.2 6.1 7.3 7.6 5.5 7.1 10.0 1.5 5.0 5.0];
Conversion.Lifespan = 30;
Conversion.Proportion = [0.9 0.7 0.7 0.7 0.5 0.5 0.5 0.5 0.5 0.5 0.5];


%Save variables
filename = "constants_conversion.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Conversion");
%Close files
fclose('all');