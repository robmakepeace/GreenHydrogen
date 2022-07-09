%Green Hydrogen Physical constants
%Robert Makepeace
%First written 19/06/2022
%Last updated 09/07/2022

Physical.AmbientPressure = 101.325; %Units: kPa
Physical.AmbientTemp_C = 20; %Units: Celcius
Physical.AmbientTemp_K = Physical.AmbientTemp_C + 273.15; %Units: Kelvin
Physical.GasConstant = 8.31446261815324; %Units: J/Kmol
Physical.Gas_Density = 0.08988;%Units: g/L or kg/m3 (at STP)
Physical.Liquid_Density = 0.07;%Units: g/cm3 (at STP)
Physical.H2_MM = 1.00784*2;%Units: g/mol

%Save variables
filename = "constants_physical.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Physical");