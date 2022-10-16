%Green Hydrogen constants
%Robert Makepeace
%First written 30/03/2022
%Last updated 10/07/2022

%Hydrogen Generation Costs

%GREEN HYDROGEN GENERATION COST
Hydrogen.Generation.Green_Levelised_Cost = variable(4.9,0.3,0.9,'$AUD/kg','Cost ($AUD/kg)','Green Hydrogen Levelised Generation Cost');
future = [4.9 4.6 4.3 4.0 3.7 3.4 3.1 2.8 2.5...
    2.45 2.40 2.35 2.30 2.25 2.20 2.15 2.10 2.05 2.00...
    1.95 1.90 1.85 1.80 1.75 1.70 1.65 1.60 1.55 1.50];
Hydrogen.Generation.Green_Levelised_Cost.init(future);
Hydrogen.Generation.Green_Levelised_Cost.plot('#00FF00','#77AC30');

%BLUE HYDROGEN GENERATION COST
Hydrogen.Generation.Blue_Levelised_Cost = variable(2.34,0.2,0.08,'$AUD/kg','Cost ($AUD/kg)','Blue Hydrogen Levelised Generation Cost (No Carbon Cost)');
Growth1 = 0.08;
Growth2 = 0.01;
future(1) = Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue;
for n = 2:8
    future(n) = future(n-1) - Growth1;
end
for n = 9:Hydrogen.Generation.Blue_Levelised_Cost.Future_size 
    future(n) = future(n-1) - Growth2;
end
Hydrogen.Generation.Blue_Levelised_Cost.init(future);
Hydrogen.Generation.Blue_Levelised_Cost.plot('#0000FF','#4DBEEE');

%GREY HYDROGEN GENERATION COST
Hydrogen.Generation.Grey_Levelised_Cost = variable(1.5,0.1,1.0,'$AUD/kg','Cost ($AUD/kg)','Grey Hydrogen Levelised Generation Cost (No Carbon Cost)');
future(1) = Hydrogen.Generation.Grey_Levelised_Cost.CurrentValue;
for n = 2:Hydrogen.Generation.Grey_Levelised_Cost.Future_size 
    future(n) = future(n-1)* Hydrogen.Generation.Grey_Levelised_Cost.Growth;
end
Hydrogen.Generation.Grey_Levelised_Cost.init(future);
Hydrogen.Generation.Grey_Levelised_Cost.plot('#000000','#808080');

%Electroysler_Effeciency
Hydrogen.Generation.Electroysler_Effeciency = variable(0.6,0.04,0.01,'%','Efficiency (%)','Electroysler Effeciency');
future(1) = Hydrogen.Generation.Electroysler_Effeciency.CurrentValue;
for n = 2:11 
    future(n) = future(n-1) + Hydrogen.Generation.Electroysler_Effeciency.Growth;
end
for n = 12:Hydrogen.Generation.Electroysler_Effeciency.Future_size
    future(n) = future(n-1);
end
Hydrogen.Generation.Electroysler_Effeciency.init(future);
Hydrogen.Generation.Electroysler_Effeciency.plot('#00FF00','#77AC30');

% CARBON PRICE
Hydrogen.Economic.Carbon_Price = variable(25,0.5,3.125,'$/kg','Cost ($AUD/tonne CO2)','Standardised World Carbon Price');
Growth1 = 3.125;
Growth2 = 10.0;
Growth3 = 15.0;
future(1) = Hydrogen.Economic.Carbon_Price.CurrentValue;
for n = 2:9
    future(n) = future(n-1) + Growth1;
end
for n = 10:19
    future(n) = future(n-1) + Growth2;
end
for n = 20:Hydrogen.Economic.Carbon_Price.Future_size 
    future(n) = future(n-1) + Growth3;
end
Hydrogen.Economic.Carbon_Price.init(future);
Hydrogen.Economic.Carbon_Price.plot('#000000','#808080');

% GAS PRICE
Hydrogen.Economic.Gas_Price = variable(4.7,0.5,0.0,'$/kg','Cost ($AUD/MMBTU)','Gas Price');
future(1) = Hydrogen.Economic.Gas_Price.CurrentValue;
for n = 2:Hydrogen.Economic.Gas_Price.Future_size 
    future(n) = future(n-1) + Hydrogen.Economic.Gas_Price.Growth;
end
Hydrogen.Economic.Gas_Price.init(future);
Hydrogen.Economic.Gas_Price.plot('#000000','#808080');


% Electricty Price
Hydrogen.Economic.Electricity_Price = variable(66.3,0.4,-3.6,'$AUD/MWhr','Cost ($AUD/MWhr)','Electricty Price');
Growth1 = -3.6;
Growth2 = -0.675;
future(1) = Hydrogen.Economic.Electricity_Price.CurrentValue;
for n = 2:9
    future(n) = future(n-1) + Growth1;
end
for n = 10:Hydrogen.Economic.Electricity_Price.Future_size 
    future(n) = future(n-1) + Growth2;
end
Hydrogen.Economic.Electricity_Price.init(future);
Hydrogen.Economic.Electricity_Price.plot('#00FF00','#77AC30');

Hydrogen.Economic.Aus_Electricity_Price = variable(40.8250,0.2,-3.6,'$AUD/MWhr','Cost ($AUD/MWhr)','Asutralian Electricty Price');
Growth1 = -2.0;
Growth2 = -0.3;
future(1) = Hydrogen.Economic.Aus_Electricity_Price.CurrentValue;
for n = 2:9
    future(n) = future(n-1) + Growth1;
end
for n = 10:Hydrogen.Economic.Aus_Electricity_Price.Future_size 
    future(n) = future(n-1) + Growth2;
end
Hydrogen.Economic.Aus_Electricity_Price.init(future);
Hydrogen.Economic.Aus_Electricity_Price.plot('#00FF00','#77AC30');


% Electrolyser CAPEX
Hydrogen.Economic.Electroylser_CAPEX = variable(900,0.1,0.97,'$AUD/MWe','Cost ($AUD/kWe)','Electrolyser CAPEX Cost');
future(1) = Hydrogen.Economic.Electroylser_CAPEX.CurrentValue;
for n = 2:Hydrogen.Economic.Electroylser_CAPEX.Future_size 
    future(n) = future(n-1)*Hydrogen.Economic.Electroylser_CAPEX.Growth;
end
Hydrogen.Economic.Electroylser_CAPEX.init(future);
Hydrogen.Economic.Electroylser_CAPEX.plot('#00FF00','#77AC30');

% Electrolyser OPEX
Hydrogen.Economic.Electroylser_OPEX = variable(13.5,0.1,0.97,'$AUD/MWe*yr','Cost ($AUD/kWe*yr)','Electrolyser OPEX Cost');
future(1) = Hydrogen.Economic.Electroylser_OPEX.CurrentValue;
for n = 2:Hydrogen.Economic.Electroylser_OPEX.Future_size 
    future(n) = future(n-1)*Hydrogen.Economic.Electroylser_OPEX.Growth;
end
Hydrogen.Economic.Electroylser_OPEX.init(future);
Hydrogen.Economic.Electroylser_OPEX.plot('#00FF00','#77AC30');

%GLOBAL HYDROGEN DEMAND
Hydrogen.Consumption.Global_Demand = variable(90,0.5,0.5,'Mt','Demand (Mt)','Gloabal Hydrogen Demand');
Growth1 = 5.0;
Growth2 = 8.0;
Growth3 = 10.0;
future(1) = Hydrogen.Consumption.Global_Demand.CurrentValue;
for n = 2:4 
    future(n) = future(n-1) + Growth1;
end
for n = 5:9
    future(n) = future(n-1) + Growth2;
end
for n = 10:Hydrogen.Consumption.Global_Demand.Future_size 
    future(n) = future(n-1) + Growth3;
end
Hydrogen.Consumption.Global_Demand.init(future);
Hydrogen.Consumption.Global_Demand.plot('#FF0000','#A2142F');

%Save variables
filename = "constants.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Hydrogen");
%Close files
fclose('all');
