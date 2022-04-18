%Green Hydrogen constants
%Robert Makepeace
%First written 30/03/2022
%Last updated 30/03/2022

close all;
clear all;

%Density (at STP) (g/L)
Hydrogen.Constants.Gas_Density = 0.08988;

%Density (at STP) (g/cm3)
Hydrogen.Constants.Liquid_Density = 0.07;

%Define variable struct
Template.CurrentValue = 1;
Template.Uncertainity = 0.1;
Template.Future_size = 30;
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
Hydrogen.Generation.Green_Levelised_Cost = Template;
Hydrogen.Generation.Green_Levelised_Cost.CurrentValue = 5.0
Hydrogen.Generation.Green_Levelised_Cost.Uncertainity = 0.4;
Hydrogen.Generation.Green_Levelised_Cost.Growth = 0.9;
Hydrogen.Generation.Green_Levelised_Cost.Future(1) = Hydrogen.Generation.Green_Levelised_Cost.CurrentValue;
Hydrogen.Generation.Green_Levelised_Cost.Lower(1) = Hydrogen.Generation.Green_Levelised_Cost.Future(1) * (1-Hydrogen.Generation.Green_Levelised_Cost.Uncertainity)
Hydrogen.Generation.Green_Levelised_Cost.Upper(1) = Hydrogen.Generation.Green_Levelised_Cost.Future(1) * (1+Hydrogen.Generation.Green_Levelised_Cost.Uncertainity)
for n = 2:Hydrogen.Generation.Green_Levelised_Cost.Future_size 
    Hydrogen.Generation.Green_Levelised_Cost.Future(n) = Hydrogen.Generation.Green_Levelised_Cost.Future(n-1)* Hydrogen.Generation.Green_Levelised_Cost.Growth;
    Hydrogen.Generation.Green_Levelised_Cost.Lower(n) = Hydrogen.Generation.Green_Levelised_Cost.Future(n) * (1-Hydrogen.Generation.Green_Levelised_Cost.Uncertainity)
    Hydrogen.Generation.Green_Levelised_Cost.Upper(n) = Hydrogen.Generation.Green_Levelised_Cost.Future(n) * (1+Hydrogen.Generation.Green_Levelised_Cost.Uncertainity)
end
Hydrogen.Generation.Green_Levelised_Cost.Units = '$/kg';
Hydrogen.Generation.Green_Levelised_Cost.xlabel = 'Year';
Hydrogen.Generation.Green_Levelised_Cost.ylabel = 'Cost ($/kg)';
Hydrogen.Generation.Green_Levelised_Cost.Name = 'Green Hydrogen Levelised Generation Cost';

plot_parameter(Hydrogen.Generation.Green_Levelised_Cost);

Hydrogen.Generation.Blue_Levelised_Cost = Template;
Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue = 3.0
Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity = 0.3;
Hydrogen.Generation.Blue_Levelised_Cost.Growth = 0.95;
Hydrogen.Generation.Blue_Levelised_Cost.Future(1) = Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue * Hydrogen.Generation.Blue_Levelised_Cost.Growth;
Hydrogen.Generation.Blue_Levelised_Cost.Lower(1) = Hydrogen.Generation.Blue_Levelised_Cost.Future(1) * (1-Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
Hydrogen.Generation.Blue_Levelised_Cost.Upper(1) = Hydrogen.Generation.Blue_Levelised_Cost.Future(1) * (1+Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
for n = 2:Hydrogen.Generation.Blue_Levelised_Cost.Future_size 
    Hydrogen.Generation.Blue_Levelised_Cost.Future(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n-1)* Hydrogen.Generation.Blue_Levelised_Cost.Growth;
    Hydrogen.Generation.Blue_Levelised_Cost.Lower(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n) * (1-Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)
    Hydrogen.Generation.Blue_Levelised_Cost.Upper(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n) * (1+Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity)

end
Hydrogen.Generation.Blue_Levelised_Cost.Units = '$/kg';
Hydrogen.Generation.Blue_Levelised_Cost.xlabel = 'Year';
Hydrogen.Generation.Blue_Levelised_Cost.ylabel = 'Cost ($/kg)';
Hydrogen.Generation.Blue_Levelised_Cost.Name = 'Blue Hydrogen Levelised Generation Cost';
plot_parameter(Hydrogen.Generation.Blue_Levelised_Cost);

%Test
save("constants.mat","Hydrogen");
