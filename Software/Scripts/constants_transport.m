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

Transport.Pipeline.Description = "Pipeline";


filename = "constants_transport.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Transport");