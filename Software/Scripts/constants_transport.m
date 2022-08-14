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
Transport.Truck.Utilisation = 0.7;% Units: %
Transport.Truck.Pressure = 300;% Units: bar
Transport.Truck.Energy = 33.5;% Units: MJ/km

%Ship Transport
Transport.Ship.Description = "Ship";
Transport.Ship.WeightLimit = 104000000;% Units: kg
Transport.Ship.VolumeLimit = 120000;% Units: m3
Transport.Ship.ActualWeight = 0 ;% Units: kg
Transport.Ship.ActualVolume = 0 ;% Units: m3
Transport.Ship.Speed = 45; % Units: km/hr
Transport.Ship.CapitalCost = 10000000; % Units: $
Transport.Ship.VariableCost = 10000;% Units: $/day (excludes fuel)
Transport.Ship.Lifetime = 30; % Units: years
Transport.Ship.Utilisation = 0.9;% Units: %
Transport.Ship.Pressure = 250;% Units: bar
Transport.Ship.Energy = 9464.0;% Units: MJ/km

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
Transport.Train.Utilisation = 0.9;% Units: %
Transport.Train.Pressure = 250;% Units: bar
Transport.Train.Energy = 671.0;% Units: MJ/km

%Pipeline Transport
Transport.Pipeline.Description = "Pipeline";
Transport.Pipeline.Pressure = 10000; %Units: kPa
Transport.Pipeline.Velocity = 10.0; %Units: m/s
Transport.Pipeline.Diameter = 300.0; %Units: mm 
Transport.Pipeline.Utilisation = 0.9; %Units: %
Transport.Pipeline.NaturalGasBlendProp = 0.2; %Units: %
Transport.Pipeline.Lifetime = 30; % Units: years
Transport.Pipeline.CapitalCost = 1000; % Units: $AUD/km
Transport.Pipeline.VariableCost = 100; % Units: $AUD/km*yr

%Payloads
Payloads.Description(1) = {'Hydrogen Gas'};
Payloads.WeightDensity(1) = Physical.H2Gas_WeightDensity;
Payloads.EnergyDensity(1) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(1) = Physical.H2Gas_VolumeEnergyDensity;

Payloads.Description(2) = {'Hydrogen Liquified'};
Payloads.WeightDensity(2) = Physical.H2Liquid_WeightDensity;
Payloads.EnergyDensity(2) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(2) = Physical.H2Liquid_VolumeEnergyDensity;

Payloads.Description(3) = {'Hydrogen Cryocompressed'};
Payloads.WeightDensity(3) = Physical.H2Cryocompressed_WeightDensity;
Payloads.EnergyDensity(3) = Physical.H2_EnergyDensity;
Payloads.VolumeEnergyDensity(3) = Physical.H2Cryocompressed_VolumeEnergyDensity;

Payloads.Description(4) = {'Ammonia'};
Payloads.WeightDensity(4) = Physical.NH3_WeightDensity;
Payloads.EnergyDensity(4) = Physical.NH3_EnergyDensity;
Payloads.VolumeEnergyDensity(4) = Physical.NH3_VolumeEnergyDensity;

Payloads.Description(5) = {'Methanol'};
Payloads.WeightDensity(5) = Physical.CH3OH_WeightDensity;
Payloads.EnergyDensity(5) = Physical.CH3OH_EnergyDensity;
Payloads.VolumeEnergyDensity(5) = Physical.CH3OH_VolumeEnergyDensity;

Payloads.Description(6) = {'SNG'};
Payloads.WeightDensity(6) = Physical.NaturalGas_WeightDensity;
Payloads.EnergyDensity(6) = Physical.NaturalGas_EnergyDensity;
Payloads.VolumeEnergyDensity(6) = Physical.NaturalGas_VolumeEnergyDensity;

Payloads.Description(7) = {'Methylcyclohexane (LOHC)'};
Payloads.WeightDensity(7) = Physical.MCH_WeightDensity;
Payloads.EnergyDensity(7) = Physical.MCH_EnergyDensity;
Payloads.VolumeEnergyDensity(7) = Physical.MCH_VolumeEnergyDensity;

Payloads.Description(8) = {'Porous Carbon'};
Payloads.WeightDensity(8) = Physical.Carbon_WeightDensity;
Payloads.EnergyDensity(8) = Physical.Carbon_EnergyDensity;
Payloads.VolumeEnergyDensity(8) = Physical.Carbon_VolumeEnergyDensity;

Payloads.Description(9) = {'Metal Hydride'};
Payloads.WeightDensity(9) = Physical.Metal_WeightDensity;
Payloads.EnergyDensity(9) = Physical.Metal_EnergyDensity;
Payloads.VolumeEnergyDensity(9) = Physical.Metal_VolumeEnergyDensity;

Payloads.Description(10) = {'Diesel'};
Payloads.WeightDensity(10) = Physical.Diesel_WeightDensity;
Payloads.EnergyDensity(10) = Physical.Diesel_EnergyDensity;
Payloads.VolumeEnergyDensity(10) = Physical.Diesel_VolumeEnergyDensity;

Payloads.Description(11) = {'Natural Gas'};
Payloads.WeightDensity(11) = Physical.NaturalGas_WeightDensity;
Payloads.EnergyDensity(11) = Physical.NaturalGas_EnergyDensity;
Payloads.VolumeEnergyDensity(11) = Physical.NaturalGas_VolumeEnergyDensity;

Payloads.Description(12) = {'Liquified Natural Gas'};
Payloads.WeightDensity(12) = Physical.LNG_WeightDensity;
Payloads.EnergyDensity(12) = Physical.LNG_EnergyDensity;
Payloads.VolumeEnergyDensity(12) = Physical.LNG_VolumeEnergyDensity;

Payloads.Description(13) = {'Coal'};
Payloads.WeightDensity(13) = Physical.Coal_WeightDensity;
Payloads.EnergyDensity(13) = Physical.Coal_EnergyDensity;
Payloads.VolumeEnergyDensity(13) = Physical.Coal_VolumeEnergyDensity;

%Graphing
N=13;
fig = figure;
b=bar(Payloads.WeightDensity);
xticks([1:N]);
xticklabels(Payloads.Description)
xlabel('Energy Carrier')
ylabel('Weight Density (kg/m3)')
title('Comparison of Energy Carriers')

%Add number labels
xtips1 = b.XEndPoints;
ytips1 = b.YEndPoints;
labels1 = string(round(b.YData,2));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom')

%Save figure
filename = "energycarrier_WeightDensity.png";
foldername = pwd + "\Graphs\";
saveas(fig,fullfile(foldername, filename));

%Graphing
fig = figure;
yyaxis left
N=13;                             % number of bars
y1(:,1)=Payloads.EnergyDensity'; 
y2(:,2)=Payloads.VolumeEnergyDensity';  % dummy disparate-magnitude data sets 
y1(:,2)=nan;
y2(:,1)=nan;    

x=[1:N].';                       % use the serial index to plot against
h=plotyy(x,y1,x,y2,@bar,@bar); % plot, save axes handles
set(h(2),'xtick',[])           % turn off labels on RH x-axis; keep only one set
set(h(1),'xticklabel',Payloads.Description) % tick labels on first...
%xticks([1:13]);
xlabel('Energy Carrier')
ylabel('Weight Energy Density (MJ/kg)')
yyaxis right
yticks([0:50:150])
ylabel('Volume Energy Density (MJ/m3)','color','black')
title('Comparison of Energy Carriers')

%Save figure
filename = "energycarrier_EnergyDensity.png";
foldername = pwd + "\Graphs\";
saveas(fig,fullfile(foldername, filename));

%Save variables
filename = "constants_transport.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Transport","Payloads");