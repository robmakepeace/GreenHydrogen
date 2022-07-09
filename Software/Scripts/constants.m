%Green Hydrogen constants
%Robert Makepeace
%First written 30/03/2022
%Last updated 09/07/2022

%Define variable struct
Template.CurrentValue = 1;
Template.Uncertainity = 0.1;
Template.Future_size = 29;
Template.Upper = zeros(Template.Future_size,1);
Template.Future = zeros(Template.Future_size,1);
Template.Lower = zeros(Template.Future_size,1);
Template.Growth = 0.9;
Template.Future(1) = Template.CurrentValue * Template.Growth;
Template.Lower(1) = Template.Future(1) * (1-Template.Uncertainity)
Template.Upper(1) = Template.Future(1) * (1+Template.Uncertainity)
for n = 2:Template.Future_size 
    Template.Future(n) = Template.Future(n-1)* Template.Growth;
    Template.Lower(n) = Template.Future(n) * (1-Template.Uncertainity)
    Template.Upper(n) = Template.Future(n) * (1+Template.Uncertainity)
end
Template.Units = '$';
Template.xlabel = 'Years';
Template.ylabel = 'Cost ($)';
Template.Name = 'Template';

%Hydrogen Generation Costs

%GREEN HYDROGEN GENERATION COST
Hydrogen.Generation.Green_Levelised_Cost = Template;
Hydrogen.Generation.Green_Levelised_Cost.CurrentValue = 4.9;
Hydrogen.Generation.Green_Levelised_Cost.Uncertainity = 0.3;
Hydrogen.Generation.Green_Levelised_Cost.Growth = 0.9;
Hydrogen.Generation.Green_Levelised_Cost.Future(1) = Hydrogen.Generation.Green_Levelised_Cost.CurrentValue; %2022
Hydrogen.Generation.Green_Levelised_Cost.Future(2) = 4.6; %2023
Hydrogen.Generation.Green_Levelised_Cost.Future(3) = 4.3; %2024
Hydrogen.Generation.Green_Levelised_Cost.Future(4) = 4.0; %2025
Hydrogen.Generation.Green_Levelised_Cost.Future(5) = 3.7; %2026
Hydrogen.Generation.Green_Levelised_Cost.Future(6) = 3.4; %2027
Hydrogen.Generation.Green_Levelised_Cost.Future(7) = 3.1; %2028
Hydrogen.Generation.Green_Levelised_Cost.Future(8) = 2.8; %2029
Hydrogen.Generation.Green_Levelised_Cost.Future(9) = 2.5; %2030
Hydrogen.Generation.Green_Levelised_Cost.Future(10) = 2.45; %2031
Hydrogen.Generation.Green_Levelised_Cost.Future(11) = 2.40; %2032
Hydrogen.Generation.Green_Levelised_Cost.Future(12) = 2.35; %2033
Hydrogen.Generation.Green_Levelised_Cost.Future(13) = 2.30; %2034
Hydrogen.Generation.Green_Levelised_Cost.Future(14) = 2.25; %2035
Hydrogen.Generation.Green_Levelised_Cost.Future(15) = 2.20; %2036
Hydrogen.Generation.Green_Levelised_Cost.Future(16) = 2.15; %2037
Hydrogen.Generation.Green_Levelised_Cost.Future(17) = 2.10; %2038
Hydrogen.Generation.Green_Levelised_Cost.Future(18) = 2.05; %2039
Hydrogen.Generation.Green_Levelised_Cost.Future(19) = 2.00; %2040
Hydrogen.Generation.Green_Levelised_Cost.Future(20) = 1.95; %2041
Hydrogen.Generation.Green_Levelised_Cost.Future(21) = 1.90; %2042
Hydrogen.Generation.Green_Levelised_Cost.Future(22) = 1.85; %2043
Hydrogen.Generation.Green_Levelised_Cost.Future(23) = 1.80; %2044
Hydrogen.Generation.Green_Levelised_Cost.Future(24) = 1.75; %2045
Hydrogen.Generation.Green_Levelised_Cost.Future(25) = 1.70; %2046
Hydrogen.Generation.Green_Levelised_Cost.Future(26) = 1.65; %2047
Hydrogen.Generation.Green_Levelised_Cost.Future(27) = 1.60; %2048
Hydrogen.Generation.Green_Levelised_Cost.Future(28) = 1.55; %2049
Hydrogen.Generation.Green_Levelised_Cost.Future(29) = 1.50; %2050
for n = 1:Hydrogen.Generation.Green_Levelised_Cost.Future_size 
    Hydrogen.Generation.Green_Levelised_Cost.Lower(n) = Hydrogen.Generation.Green_Levelised_Cost.Future(n) * (1-Hydrogen.Generation.Green_Levelised_Cost.Uncertainity)
    Hydrogen.Generation.Green_Levelised_Cost.Upper(n) = Hydrogen.Generation.Green_Levelised_Cost.Future(n) * (1+Hydrogen.Generation.Green_Levelised_Cost.Uncertainity)
end
Hydrogen.Generation.Green_Levelised_Cost.Units = '$AUD/kg';
Hydrogen.Generation.Green_Levelised_Cost.xlabel = 'Year';
Hydrogen.Generation.Green_Levelised_Cost.ylabel = 'Cost ($AUD/kg)';
Hydrogen.Generation.Green_Levelised_Cost.Name = 'Green Hydrogen Levelised Generation Cost';

visualise_plot_parameter(Hydrogen.Generation.Green_Levelised_Cost,'#00FF00','#77AC30',run_graphics);

%BLUE HYDROGEN GENERATION COST
Hydrogen.Generation.Blue_Levelised_Cost = Template;
Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue = 2.34;
Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity = 0.2;
Hydrogen.Generation.Blue_Levelised_Cost.Growth1 = 0.08;
Hydrogen.Generation.Blue_Levelised_Cost.Growth2 = 0.01;
Hydrogen.Generation.Blue_Levelised_Cost.Future(1) = Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue;
Hydrogen.Generation.Blue_Levelised_Cost.Lower(1) = Hydrogen.Generation.Blue_Levelised_Cost.Future(1) * (1-Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
Hydrogen.Generation.Blue_Levelised_Cost.Upper(1) = Hydrogen.Generation.Blue_Levelised_Cost.Future(1) * (1+Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
for n = 2:8
    Hydrogen.Generation.Blue_Levelised_Cost.Future(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n-1) - Hydrogen.Generation.Blue_Levelised_Cost.Growth1;
    Hydrogen.Generation.Blue_Levelised_Cost.Lower(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n) * (1-Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
    Hydrogen.Generation.Blue_Levelised_Cost.Upper(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n) * (1+Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
end
for n = 9:Hydrogen.Generation.Blue_Levelised_Cost.Future_size 
    Hydrogen.Generation.Blue_Levelised_Cost.Future(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n-1) - Hydrogen.Generation.Blue_Levelised_Cost.Growth2;
    Hydrogen.Generation.Blue_Levelised_Cost.Lower(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n) * (1-Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
    Hydrogen.Generation.Blue_Levelised_Cost.Upper(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n) * (1+Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)

end
Hydrogen.Generation.Blue_Levelised_Cost.Units = '$AUD/kg';
Hydrogen.Generation.Blue_Levelised_Cost.xlabel = 'Year';
Hydrogen.Generation.Blue_Levelised_Cost.ylabel = 'Cost ($AUD/kg)';
Hydrogen.Generation.Blue_Levelised_Cost.Name = 'Blue Hydrogen Levelised Generation Cost (No Carbon Cost)';
visualise_plot_parameter(Hydrogen.Generation.Blue_Levelised_Cost,'#0000FF','#4DBEEE',run_graphics);

%GREY HYDROGEN GENERATION COST
Hydrogen.Generation.Grey_Levelised_Cost = Template;
Hydrogen.Generation.Grey_Levelised_Cost.CurrentValue = 1.5
Hydrogen.Generation.Grey_Levelised_Cost.Uncertainity = 0.1;
Hydrogen.Generation.Grey_Levelised_Cost.Growth = 1.0;
Hydrogen.Generation.Grey_Levelised_Cost.Future(1) = Hydrogen.Generation.Grey_Levelised_Cost.CurrentValue;
Hydrogen.Generation.Grey_Levelised_Cost.Lower(1) = Hydrogen.Generation.Grey_Levelised_Cost.Future(1) * (1-Hydrogen.Generation.Grey_Levelised_Cost.Uncertainity)
Hydrogen.Generation.Grey_Levelised_Cost.Upper(1) = Hydrogen.Generation.Grey_Levelised_Cost.Future(1) * (1+Hydrogen.Generation.Grey_Levelised_Cost.Uncertainity)
for n = 2:Hydrogen.Generation.Grey_Levelised_Cost.Future_size 
    Hydrogen.Generation.Grey_Levelised_Cost.Future(n) = Hydrogen.Generation.Grey_Levelised_Cost.Future(n-1)* Hydrogen.Generation.Grey_Levelised_Cost.Growth;
    Hydrogen.Generation.Grey_Levelised_Cost.Lower(n) = Hydrogen.Generation.Grey_Levelised_Cost.Future(n) * (1-Hydrogen.Generation.Grey_Levelised_Cost.Uncertainity)
    Hydrogen.Generation.Grey_Levelised_Cost.Upper(n) = Hydrogen.Generation.Grey_Levelised_Cost.Future(n) * (1+Hydrogen.Generation.Grey_Levelised_Cost.Uncertainity)

end
Hydrogen.Generation.Grey_Levelised_Cost.Units = '$AUD/kg';
Hydrogen.Generation.Grey_Levelised_Cost.xlabel = 'Year';
Hydrogen.Generation.Grey_Levelised_Cost.ylabel = 'Cost ($AUD/kg)';
Hydrogen.Generation.Grey_Levelised_Cost.Name = 'Grey Hydrogen Levelised Generation Cost (No Carbon Cost)';
visualise_plot_parameter(Hydrogen.Generation.Grey_Levelised_Cost,'#000000','#808080',run_graphics);

% CARBON PRICE
Hydrogen.Economic.Carbon_Price = Template;
Hydrogen.Economic.Carbon_Price.CurrentValue = 25
Hydrogen.Economic.Carbon_Price.Uncertainity = 0.5;
Hydrogen.Economic.Carbon_Price.Growth1 = 3.125;
Hydrogen.Economic.Carbon_Price.Growth2 = 10.0;
Hydrogen.Economic.Carbon_Price.Growth3 = 15.0;
Hydrogen.Economic.Carbon_Price.Future(1) = Hydrogen.Economic.Carbon_Price.CurrentValue;
Hydrogen.Economic.Carbon_Price.Lower(1) = Hydrogen.Economic.Carbon_Price.Future(1) * (1-Hydrogen.Economic.Carbon_Price.Uncertainity)
Hydrogen.Economic.Carbon_Price.Upper(1) = Hydrogen.Economic.Carbon_Price.Future(1) * (1+Hydrogen.Economic.Carbon_Price.Uncertainity)
for n = 2:9
    Hydrogen.Economic.Carbon_Price.Future(n) = Hydrogen.Economic.Carbon_Price.Future(n-1) + Hydrogen.Economic.Carbon_Price.Growth1;
    Hydrogen.Economic.Carbon_Price.Lower(n) = Hydrogen.Economic.Carbon_Price.Future(n) * (1-Hydrogen.Economic.Carbon_Price.Uncertainity)
    Hydrogen.Economic.Carbon_Price.Upper(n) = Hydrogen.Economic.Carbon_Price.Future(n) * (1+Hydrogen.Economic.Carbon_Price.Uncertainity)
end
for n = 10:19
    Hydrogen.Economic.Carbon_Price.Future(n) = Hydrogen.Economic.Carbon_Price.Future(n-1) + Hydrogen.Economic.Carbon_Price.Growth2;
    Hydrogen.Economic.Carbon_Price.Lower(n) = Hydrogen.Economic.Carbon_Price.Future(n) * (1-Hydrogen.Economic.Carbon_Price.Uncertainity)
    Hydrogen.Economic.Carbon_Price.Upper(n) = Hydrogen.Economic.Carbon_Price.Future(n) * (1+Hydrogen.Economic.Carbon_Price.Uncertainity)
end
for n = 20:Hydrogen.Economic.Carbon_Price.Future_size 
    Hydrogen.Economic.Carbon_Price.Future(n) = Hydrogen.Economic.Carbon_Price.Future(n-1) + Hydrogen.Economic.Carbon_Price.Growth3;
    Hydrogen.Economic.Carbon_Price.Lower(n) = Hydrogen.Economic.Carbon_Price.Future(n) * (1-Hydrogen.Economic.Carbon_Price.Uncertainity)
    Hydrogen.Economic.Carbon_Price.Upper(n) = Hydrogen.Economic.Carbon_Price.Future(n) * (1+Hydrogen.Economic.Carbon_Price.Uncertainity)
end
Hydrogen.Economic.Carbon_Price.Units = '$/kg';
Hydrogen.Economic.Carbon_Price.xlabel = 'Year';
Hydrogen.Economic.Carbon_Price.ylabel = 'Cost ($AUD/tonne CO2)';
Hydrogen.Economic.Carbon_Price.Name = 'Standardised World Carbon Price';
visualise_plot_parameter(Hydrogen.Economic.Carbon_Price,'#000000','#808080',run_graphics);

% GAS PRICE
Hydrogen.Economic.Gas_Price = Template;
Hydrogen.Economic.Gas_Price.CurrentValue = 4.7
Hydrogen.Economic.Gas_Price.Uncertainity = 0.5;
Hydrogen.Economic.Gas_Price.Growth = 0.0;
Hydrogen.Economic.Gas_Price.Future(1) = Hydrogen.Economic.Gas_Price.CurrentValue;
Hydrogen.Economic.Gas_Price.Lower(1) = Hydrogen.Economic.Gas_Price.Future(1) * (1-Hydrogen.Economic.Gas_Price.Uncertainity)
Hydrogen.Economic.Gas_Price.Upper(1) = Hydrogen.Economic.Gas_Price.Future(1) * (1+Hydrogen.Economic.Gas_Price.Uncertainity)
for n = 2:Hydrogen.Economic.Gas_Price.Future_size 
    Hydrogen.Economic.Gas_Price.Future(n) = Hydrogen.Economic.Gas_Price.Future(n-1) + Hydrogen.Economic.Gas_Price.Growth;
    Hydrogen.Economic.Gas_Price.Lower(n) = Hydrogen.Economic.Gas_Price.Future(n) * (1-Hydrogen.Economic.Gas_Price.Uncertainity)
    Hydrogen.Economic.Gas_Price.Upper(n) = Hydrogen.Economic.Gas_Price.Future(n) * (1+Hydrogen.Economic.Gas_Price.Uncertainity)
end
Hydrogen.Economic.Gas_Price.Units = '$AUD/MMBTU';
Hydrogen.Economic.Gas_Price.xlabel = 'Year';
Hydrogen.Economic.Gas_Price.ylabel = 'Cost ($AUD/MMBTU)';
Hydrogen.Economic.Gas_Price.Name = 'Gas Price';
visualise_plot_parameter(Hydrogen.Economic.Gas_Price,'#000000','#808080',run_graphics);

% CARBON PRICE
Hydrogen.Economic.Electricity_Price = Template;
Hydrogen.Economic.Electricity_Price.CurrentValue = 66.3
Hydrogen.Economic.Electricity_Price.Uncertainity = 0.4;
Hydrogen.Economic.Electricity_Price.Growth1 = -3.6;
Hydrogen.Economic.Electricity_Price.Growth2 = -0.675;
Hydrogen.Economic.Electricity_Price.Future(1) = Hydrogen.Economic.Electricity_Price.CurrentValue;
Hydrogen.Economic.Electricity_Price.Lower(1) = Hydrogen.Economic.Electricity_Price.Future(1) * (1-Hydrogen.Economic.Electricity_Price.Uncertainity)
Hydrogen.Economic.Electricity_Price.Upper(1) = Hydrogen.Economic.Electricity_Price.Future(1) * (1+Hydrogen.Economic.Electricity_Price.Uncertainity)
for n = 2:9
    Hydrogen.Economic.Electricity_Price.Future(n) = Hydrogen.Economic.Electricity_Price.Future(n-1) + Hydrogen.Economic.Electricity_Price.Growth1;
    Hydrogen.Economic.Electricity_Price.Lower(n) = Hydrogen.Economic.Electricity_Price.Future(n) * (1-Hydrogen.Economic.Electricity_Price.Uncertainity)
    Hydrogen.Economic.Electricity_Price.Upper(n) = Hydrogen.Economic.Electricity_Price.Future(n) * (1+Hydrogen.Economic.Electricity_Price.Uncertainity)
end
for n = 10:Hydrogen.Economic.Electricity_Price.Future_size 
    Hydrogen.Economic.Electricity_Price.Future(n) = Hydrogen.Economic.Electricity_Price.Future(n-1) + Hydrogen.Economic.Electricity_Price.Growth2;
    Hydrogen.Economic.Electricity_Price.Lower(n) = Hydrogen.Economic.Electricity_Price.Future(n) * (1-Hydrogen.Economic.Electricity_Price.Uncertainity)
    Hydrogen.Economic.Electricity_Price.Upper(n) = Hydrogen.Economic.Electricity_Price.Future(n) * (1+Hydrogen.Economic.Electricity_Price.Uncertainity)
end
Hydrogen.Economic.Electricity_Price.Units = '$AUD/MWhr';
Hydrogen.Economic.Electricity_Price.xlabel = 'Year';
Hydrogen.Economic.Electricity_Price.ylabel = 'Cost ($AUD/MWhr)';
Hydrogen.Economic.Electricity_Price.Name = 'Electricty Price';
visualise_plot_parameter(Hydrogen.Economic.Electricity_Price,'#00FF00','#77AC30',run_graphics);

%GLOBAL HYDROGEN DEMAND
Hydrogen.Consumption.Global_Demand = Template;
Hydrogen.Consumption.Global_Demand.CurrentValue = 90;
Hydrogen.Consumption.Global_Demand.Uncertainity = 0.5;
Hydrogen.Consumption.Global_Demand.Growth1 = 5.0;
Hydrogen.Consumption.Global_Demand.Growth2 = 8.0;
Hydrogen.Consumption.Global_Demand.Growth3 = 10.0;
Hydrogen.Consumption.Global_Demand.Future(1) = Hydrogen.Consumption.Global_Demand.CurrentValue;
Hydrogen.Consumption.Global_Demand.Lower(1) = Hydrogen.Consumption.Global_Demand.Future(1) * (1-Hydrogen.Consumption.Global_Demand.Uncertainity)
Hydrogen.Consumption.Global_Demand.Upper(1) = Hydrogen.Consumption.Global_Demand.Future(1) * (1+Hydrogen.Consumption.Global_Demand.Uncertainity)
for n = 2:4 
    Hydrogen.Consumption.Global_Demand.Future(n) = Hydrogen.Consumption.Global_Demand.Future(n-1) + Hydrogen.Consumption.Global_Demand.Growth1;
    Hydrogen.Consumption.Global_Demand.Lower(n) = Hydrogen.Consumption.Global_Demand.Future(n) * (1-Hydrogen.Consumption.Global_Demand.Uncertainity)
    Hydrogen.Consumption.Global_Demand.Upper(n) = Hydrogen.Consumption.Global_Demand.Future(n) * (1+Hydrogen.Consumption.Global_Demand.Uncertainity)
end
for n = 5:9
    Hydrogen.Consumption.Global_Demand.Future(n) = Hydrogen.Consumption.Global_Demand.Future(n-1) + Hydrogen.Consumption.Global_Demand.Growth2;
    Hydrogen.Consumption.Global_Demand.Lower(n) = Hydrogen.Consumption.Global_Demand.Future(n) * (1-Hydrogen.Consumption.Global_Demand.Uncertainity)
    Hydrogen.Consumption.Global_Demand.Upper(n) = Hydrogen.Consumption.Global_Demand.Future(n) * (1+Hydrogen.Consumption.Global_Demand.Uncertainity)
end
for n = 10:Hydrogen.Consumption.Global_Demand.Future_size 
    Hydrogen.Consumption.Global_Demand.Future(n) = Hydrogen.Consumption.Global_Demand.Future(n-1) + Hydrogen.Consumption.Global_Demand.Growth3;
    Hydrogen.Consumption.Global_Demand.Lower(n) = Hydrogen.Consumption.Global_Demand.Future(n) * (1-Hydrogen.Consumption.Global_Demand.Uncertainity)
    Hydrogen.Consumption.Global_Demand.Upper(n) = Hydrogen.Consumption.Global_Demand.Future(n) * (1+Hydrogen.Consumption.Global_Demand.Uncertainity)
end
Hydrogen.Consumption.Global_Demand.Units = 'Mt';
Hydrogen.Consumption.Global_Demand.xlabel = 'Year';
Hydrogen.Consumption.Global_Demand.ylabel = 'Demand (Mt)';
Hydrogen.Consumption.Global_Demand.Name = 'Gloabal Hydrogen Demand';
visualise_plot_parameter(Hydrogen.Consumption.Global_Demand,'#FF0000','#A2142F',run_graphics);

%Save variables
filename = "constants.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Hydrogen");
