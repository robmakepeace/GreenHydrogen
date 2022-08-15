%Green Hydrogen Physical constants
%Robert Makepeace
%First written 19/06/2022
%Last updated 09/07/2022

%Environmental Conditions
Physical.AmbientPressure = 101.325; %Units: kPa
Physical.AmbientTemp_C = 20; %Units: Celcius
Physical.AmbientTemp_K = Physical.AmbientTemp_C + 273.15; %Units: Kelvin
Physical.GasConstant = 8.31446261815324; %Units: J/Kmol

%Molceular Weight 
Physical.H_MM = 1.00784;%Units: g/mol
Physical.C_MM = 12.011;%Units: g/mol
Physical.N_MM = 14.0067;%Units: g/mol
Physical.O_MM = 15.999;%Units: g/mol 
%Natural Gas Molecular Weight
Physical.H2_MM = Physical.H_MM * 2;%Units: g/mol
Physical.CH3OH_MM = 4 * Physical.H_MM + Physical.C_MM + Physical.O_MM;
Physical.NH3_MM = 3 * Physical.H_MM + Physical.N_MM;
Physical.MCH_MM = 14 * Physical.H_MM + 7 * Physical.C_MM;

Physical.CH4_MM = Physical.C_MM * 1 + Physical.H_MM * 4;%Units: g/mol
Physical.C2H6_MM = Physical.C_MM * 2 + Physical.H_MM * 6;%Units: g/mol
Physical.C3H8_MM = Physical.C_MM * 3 + Physical.H_MM * 8;%Units: g/mol
Physical.C4H10_MM = Physical.C_MM * 4 + Physical.H_MM * 10;%Units: g/mol
Physical.CH4_prop = 0.87;
Physical.C2H6_prop = 0.1;
Physical.C3H8_prop = 0.02;
Physical.C4H10_prop = 0.01;
Physical.NG_MM = Physical.CH4_prop * Physical.CH4_MM + ...
    Physical.C2H6_prop * Physical.C2H6_MM + ...
    Physical.C3H8_prop * Physical.C3H8_MM + ...
    Physical.C4H10_prop * Physical.C4H10_MM;

%Hydrogen Gas
Physical.H2_EnergyDensity = 120;%Units: MJ/kg
Physical.H2Gas_WeightDensity = 0.08988;%Units: kg/m3 (at STP)
Physical.H2Gas_VolumeEnergyDensity = Physical.H2_EnergyDensity * Physical.H2Gas_WeightDensity;

%Hydrogen Liquid
Physical.H2Liquid_WeightDensity = 70.0;%Units: g/L or kg/m3 (at ST)
Physical.H2Liquid_VolumeEnergyDensity = Physical.H2_EnergyDensity * Physical.H2Liquid_WeightDensity;

%Hydrogen Cryocompressed
Physical.H2Cryocompressed_WeightDensity = 81.0;%Units: g/L or kg/m3 (at ST)
Physical.H2Cryocompressed_VolumeEnergyDensity = Physical.H2_EnergyDensity * Physical.H2Cryocompressed_WeightDensity;

%Ammonia
Physical.NH3_EnergyDensity = 22.5;%Units: MJ/kg
Physical.NH3_WeightDensity = 730; %Units: kg/m3
Physical.NH3_H2_Prop = 3 * Physical.H_MM / Physical.NH3_MM;
Physical.NH3_VolumeEnergyDensity = Physical.NH3_EnergyDensity * Physical.NH3_WeightDensity;

%Methanol
Physical.CH3OH_EnergyDensity = 22.0;%Units: MJ/kg
Physical.CH3OH_WeightDensity = 792; %Units: kg/m3
Physical.CH3OH_H2_Prop = 4 * Physical.H_MM / Physical.CH3OH_MM;
Physical.CH3OH_VolumeEnergyDensity = Physical.CH3OH_EnergyDensity * Physical.CH3OH_WeightDensity;

%Methylcyclohexane (LOHC)
Physical.MCH_WeightDensity = 770; %Units: kg/m3
Physical.MCH_H2_Prop = 14 * Physical.H_MM / Physical.MCH_MM ;
Physical.MCH_EnergyDensity = Physical.MCH_H2_Prop * Physical.H2_EnergyDensity;%Units: MJ/kg
Physical.MCH_VolumeEnergyDensity = Physical.MCH_EnergyDensity * Physical.MCH_WeightDensity;

%Metal Hydrdide (MOF74)
Physical.Metal_WeightDensity = 1240; %Units: kg/m3
Physical.Metal_H2_Prop = 0.075;
Physical.Metal_EnergyDensity = Physical.Carbon_H2_Prop * Physical.H2_EnergyDensity;%Units: MJ/kg
Physical.Metal_VolumeEnergyDensity = Physical.Metal_EnergyDensity * Physical.Metal_WeightDensity;

%Poruous Carbon
Physical.Carbon_WeightDensity = 2270; %Units: kg/m3
Physical.Carbon_H2_Prop = 0.03;
Physical.Carbon_EnergyDensity = Physical.Carbon_H2_Prop * Physical.H2_EnergyDensity;%Units: MJ/kg
Physical.Carbon_VolumeEnergyDensity = Physical.Carbon_EnergyDensity * Physical.Carbon_WeightDensity;

%Diesel
Physical.Diesel_EnergyDensity = 45.5;%Units: MJ/kg
Physical.Diesel_WeightDensity = 850; %Units: kg/m3
Physical.Diesel_VolumeEnergyDensity = Physical.Diesel_EnergyDensity * Physical.Diesel_WeightDensity;

%NaturalGas
Physical.NaturalGas_EnergyDensity = 50.0;%Units: MJ/kg
Physical.NaturalGas_WeightDensity = 0.717; %Units: kg/m3
Physical.NaturalGas_VolumeEnergyDensity = Physical.NaturalGas_EnergyDensity * Physical.NaturalGas_WeightDensity;

%Liquified NaturalGas
Physical.LNG_EnergyDensity = 50.0;%Units: MJ/kg
Physical.LNG_WeightDensity = 450; %Units: kg/m3
Physical.LNG_VolumeEnergyDensity = Physical.LNG_EnergyDensity * Physical.LNG_WeightDensity;

%Coal
Physical.Coal_EnergyDensity = 23.9;%Units: MJ/kg
Physical.Coal_WeightDensity = 900.0; %Units: kg/m3
Physical.Coal_VolumeEnergyDensity = Physical.Coal_EnergyDensity * Physical.Coal_WeightDensity;

%Save variables
filename = "constants_physical.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Physical");