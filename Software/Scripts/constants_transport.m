%Green Hydrogen Transport constants
%Robert Makepeace
%First written 30/05/2022
%Last updated 14/08/2022

%Load Physical variables
filename = "constants_physical.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Physical");

%Truck Transport
Transport.Truck.Description = "Truck";
Transport.Truck.WeightLimit = 24000;% Units: kg
Transport.Truck.VolumeLimit = 44 ;% Units: m3
Transport.Truck.ActualWeight = 0 ;% Units: kg
Transport.Truck.ActualVolume = 0 ;% Units: m3
Transport.Truck.Speed = 60; % Units: km/hr
Transport.Truck.CapitalCost = 400000; % Units: $
Transport.Truck.VariableCost = 500;% Units: $/day (excludes fuel)
Transport.Truck.Lifetime = 10; % Units: years
Transport.Truck.Utilisation = 0.4;% Units: %
Transport.Truck.Pressure = 300;% Units: bar
Transport.Truck.Energy = 33.5;% Units: MJ/km
Transport.Truck.TermCAPEX = 1000000; % Units: $
Transport.Truck.TermOPEX = 40000; % Units: $/yr

%Ship Transport
Transport.Ship.Description = "Ship";
Transport.Ship.WeightLimit = 104000000;% Units: kg
Transport.Ship.VolumeLimit = 120000;% Units: m3
Transport.Ship.ActualWeight = 0 ;% Units: kg
Transport.Ship.ActualVolume = 0 ;% Units: m3
Transport.Ship.Speed = 45; % Units: km/hr
Transport.Ship.CapitalCost = 50000000; % Units: $
Transport.Ship.VariableCost = 20000;% Units: $/day (excludes fuel)
Transport.Ship.Lifetime = 30; % Units: years
Transport.Ship.Utilisation = 0.4;% Units: %
Transport.Ship.Pressure = 250;% Units: bar
Transport.Ship.Energy = 9464.0;% Units: MJ/km
Transport.Ship.TermCAPEX = 290000000; % Units: $
Transport.Ship.TermOPEX = 11600000; % Units: $/yr

%Train Transport
Transport.Train.Description = "Train";
Transport.Train.WeightLimit = 4400000;% Units: kg
Transport.Train.VolumeLimit = 3000;% Units: m3
Transport.Train.ActualWeight = 0 ;% Units: kg
Transport.Train.ActualVolume = 0 ;% Units: m3
Transport.Train.Speed = 40; % Units: km/hr
Transport.Train.CapitalCost = 10000000; % Units: $
Transport.Train.VariableCost = 10000;% Units: $/day (excludes fuel)
Transport.Train.Lifetime = 30; % Units: years
Transport.Train.Utilisation = 0.4;% Units: %
Transport.Train.Pressure = 250;% Units: bar
Transport.Train.Energy = 671.0;% Units: MJ/km
Transport.Train.TermCAPEX = 12000000; % Units: $
Transport.Train.TermOPEX = 480000; % Units: $/yr

%Pipeline Transport
Transport.Pipeline.Description = "Pipeline";
Transport.Pipeline.Pressure = 10000; %Units: kPa
Transport.Pipeline.Velocity = 10.0; %Units: m/s
Transport.Pipeline.Diameter = 300.0; %Units: mm 
Transport.Pipeline.Utilisation = 0.9; %Units: %
Transport.Pipeline.NaturalGasBlendProp = 0.2; %Units: %
Transport.Pipeline.Lifetime = 30; % Units: years
Transport.Pipeline.CapitalCost = 5000; % Units: $AUD/km
Transport.Pipeline.VariableCost = 200; % Units: $AUD/km*yr

%Mediums
Transport.NumberOfMediums=3;
Medium.Description(1) = Transport.Truck.Description; 
Medium.Medium(1) = Transport.Truck;

Medium.Description(2) = string(Transport.Ship.Description);
Medium.Medium(2) = Transport.Ship;

Medium.Description(3) = string(Transport.Train.Description); 
Medium.Medium(3) = Transport.Train;

%Payloads
Payload_Type_Gas = 0;
Payload_Type_Other = 1;

Transport.NumberOfPayloads=14;
Payloads.Description(1) = {'Hydrogen Gas'};
Payloads.WeightDensity(1) = Physical.H2Gas_WeightDensity;
Payloads.EnergyDensity(1) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(1) = Physical.H2Gas_VolumeEnergyDensity;
Payloads.H2Prop(1) = Physical.H2Gas_H2_Prop;
Payloads.Type(1) = Payload_Type_Gas;
Payloads.MM(1) = Physical.H2_MM;

Payloads.Description(2) = {'Hydrogen Liquified'};
Payloads.WeightDensity(2) = Physical.H2Liquid_WeightDensity;
Payloads.EnergyDensity(2) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(2) = Physical.H2Liquid_VolumeEnergyDensity;
Payloads.H2Prop(2) = Physical.H2Liquid_H2_Prop;
Payloads.Type(2) = Payload_Type_Other;
Payloads.MM(2) = Physical.H2_MM;

Payloads.Description(3) = {'Hydrogen Cryocompressed'};
Payloads.WeightDensity(3) = Physical.H2Cryocompressed_WeightDensity;
Payloads.EnergyDensity(3) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(3) = Physical.H2Cryocompressed_VolumeEnergyDensity;
Payloads.H2Prop(3) = Physical.H2Cryocompressed_H2_Prop;
Payloads.Type(3) = Payload_Type_Other;
Payloads.MM(3) = Physical.H2_MM;

Payloads.Description(4) = {'Hydrogen Slush'};
Payloads.WeightDensity(4) = Physical.H2Slush_WeightDensity;
Payloads.EnergyDensity(4) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(4) = Physical.H2Slush_VolumeEnergyDensity;
Payloads.H2Prop(4) = Physical.H2Slush_H2_Prop;
Payloads.Type(4) = Payload_Type_Other;
Payloads.MM(4) = Physical.H2_MM;

Payloads.Description(5) = {'Ammonia'};
Payloads.WeightDensity(5) = Physical.NH3_WeightDensity;
Payloads.EnergyDensity(5) = Physical.NH3_EnergyDensity;
Payloads.VolumeEnergyDensity(5) = Physical.NH3_VolumeEnergyDensity;
Payloads.H2Prop(5) = Physical.NH3_H2_Prop;
Payloads.Type(5) = Payload_Type_Other;
Payloads.MM(5) = Physical.NH3_MM;

Payloads.Description(6) = {'Methanol'};
Payloads.WeightDensity(6) = Physical.CH3OH_WeightDensity;
Payloads.EnergyDensity(6) = Physical.CH3OH_EnergyDensity;
Payloads.VolumeEnergyDensity(6) = Physical.CH3OH_VolumeEnergyDensity;
Payloads.H2Prop(6) = Physical.CH3OH_H2_Prop;
Payloads.Type(6) = Payload_Type_Other;
Payloads.MM(6) = Physical.CH3OH_MM;

Payloads.Description(7) = {'SNG'};
Payloads.WeightDensity(7) = Physical.NaturalGas_WeightDensity;
Payloads.EnergyDensity(7) = Physical.NaturalGas_EnergyDensity;
Payloads.VolumeEnergyDensity(7) = Physical.NaturalGas_VolumeEnergyDensity;
Payloads.H2Prop(7) = Physical.NaturalGas_H2_Prop;
Payloads.Type(7) = Payload_Type_Gas;
Payloads.MM(7) = Physical.NG_MM;

Payloads.Description(8) = {'Methylcyclohexane (LOHC)'};
Payloads.WeightDensity(8) = Physical.MCH_WeightDensity;
Payloads.EnergyDensity(8) = Physical.MCH_EnergyDensity;
Payloads.VolumeEnergyDensity(8) = Physical.MCH_VolumeEnergyDensity;
Payloads.H2Prop(8) = Physical.MCH_H2_Prop;
Payloads.Type(8) = Payload_Type_Other;
Payloads.MM(8) = Physical.MCH_MM;

Payloads.Description(9) = {'Porous Carbon'};
Payloads.WeightDensity(9) = Physical.Carbon_WeightDensity;
Payloads.EnergyDensity(9) = Physical.Carbon_EnergyDensity;
Payloads.VolumeEnergyDensity(9) = Physical.Carbon_VolumeEnergyDensity;
Payloads.H2Prop(9) = Physical.Carbon_H2_Prop;
Payloads.Type(9) = Payload_Type_Other;
Payloads.MM(9) = 0;

Payloads.Description(10) = {'Metal Hydride'};
Payloads.WeightDensity(10) = Physical.Metal_WeightDensity;
Payloads.EnergyDensity(10) = Physical.Metal_EnergyDensity;
Payloads.VolumeEnergyDensity(10) = Physical.Metal_VolumeEnergyDensity;
Payloads.H2Prop(10) = Physical.Metal_H2_Prop;
Payloads.Type(10) = Payload_Type_Other;
Payloads.MM(10) = 0;

Payloads.Description(11) = {'Diesel'};
Payloads.WeightDensity(11) = Physical.Diesel_WeightDensity;
Payloads.EnergyDensity(11) = Physical.Diesel_EnergyDensity;
Payloads.VolumeEnergyDensity(11) = Physical.Diesel_VolumeEnergyDensity;
Payloads.H2Prop(11) = 0;
Payloads.Type(11) = Payload_Type_Other;
Payloads.MM(11) = 0;

Payloads.Description(12) = {'Natural Gas'};
Payloads.WeightDensity(12) = Physical.NaturalGas_WeightDensity;
Payloads.EnergyDensity(12) = Physical.NaturalGas_EnergyDensity;
Payloads.VolumeEnergyDensity(12) = Physical.NaturalGas_VolumeEnergyDensity;
Payloads.H2Prop(12) = 0;
Payloads.Type(12) = Payload_Type_Gas;
Payloads.MM(12) = Physical.NG_MM;

Payloads.Description(13) = {'Liquified Natural Gas'};
Payloads.WeightDensity(13) = Physical.LNG_WeightDensity;
Payloads.EnergyDensity(13) = Physical.LNG_EnergyDensity;
Payloads.VolumeEnergyDensity(13) = Physical.LNG_VolumeEnergyDensity;
Payloads.H2Prop(13) = 0;
Payloads.Type(13) = Payload_Type_Other;
Payloads.MM(13) = Physical.NG_MM;

Payloads.Description(14) = {'Coal'};
Payloads.WeightDensity(14) = Physical.Coal_WeightDensity;
Payloads.EnergyDensity(14) = Physical.Coal_EnergyDensity;
Payloads.VolumeEnergyDensity(14) = Physical.Coal_VolumeEnergyDensity;
Payloads.H2Prop(14) = 0;
Payloads.Type(14) = Payload_Type_Other;
Payloads.MM(14) = 0;

%Graphing
fig = figure;
b=bar(Payloads.WeightDensity);
xticks(1:Transport.NumberOfPayloads);
xticklabels(Payloads.Description)
xlabel('Energy Carrier')
ylabel('Weight Density (kg/m3)')
title('Comparison of Energy Carriers')

%Add number labels
xtips1 = b.XEndPoints;
ytips1 = b.YEndPoints;
labels1 = string(round(b.YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom')
fig.WindowState = 'maximized';
%Save figure
filename = "energycarrier_WeightDensity.png";
foldername = pwd + "\Graphs\";
saveas(fig,fullfile(foldername, filename));

%Graphing
fig = figure;
yyaxis left
y1(:,1)=Payloads.EnergyDensity'; 
y2(:,2)=Payloads.VolumeEnergyDensity';  % dummy disparate-magnitude data sets 
y1(:,2)=nan;
y2(:,1)=nan;    

x=[1:Transport.NumberOfPayloads].';                       % use the serial index to plot against
h=plotyy(x,y1,x,y2,@bar,@bar); % plot, save axes handles
set(h(2),'xtick',[])           % turn off labels on RH x-axis; keep only one set
set(h(1),'xticklabel',Payloads.Description) % tick labels on first...
xlabel('Energy Carrier')
ylabel('Weight Energy Density (MJ/kg)')
yyaxis right
yticks(0:50:150)
ylabel('Volume Energy Density (MJ/m3)','color','black')
title('Comparison of Energy Carriers')
fig.WindowState = 'maximized';
%Save figure
filename = "energycarrier_EnergyDensity.png";
foldername = pwd + "\Graphs\";
saveas(fig,fullfile(foldername, filename));

%Save variables
filename = "constants_transport.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Transport","Medium","Payloads");
%Close files
fclose('all');