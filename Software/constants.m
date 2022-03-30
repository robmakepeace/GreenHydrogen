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
Template.Future = zeros(Template.Future_size,1);
Template.Growth = 0.9;
Template.Future(1) = Template.CurrentValue * Template.Growth;
for n = 2:Template.Future_size 
    Template.Future(n) = Template.Future(n-1)* Template.Growth;
end
Template.Units = '$';
%figure 
%x = 2022:2022+Template.Future_size-1;
%plot(x,Template.Future)

%Hydrogen Generation Costs
Hydrogen.Generation.Green_Levelised_Cost = Template;
Hydrogen.Generation.Green_Levelised_Cost.CurrentValue = 5.0
Hydrogen.Generation.Green_Levelised_Cost.Uncertainity = 1.0;
Hydrogen.Generation.Green_Levelised_Cost.Growth = 0.9;
Hydrogen.Generation.Green_Levelised_Cost.Future(1) = Hydrogen.Generation.Green_Levelised_Cost.CurrentValue * Hydrogen.Generation.Green_Levelised_Cost.Growth;
for n = 2:Hydrogen.Generation.Green_Levelised_Cost.Future_size 
    Hydrogen.Generation.Green_Levelised_Cost.Future(n) = Hydrogen.Generation.Green_Levelised_Cost.Future(n-1)* Hydrogen.Generation.Green_Levelised_Cost.Growth;
end
Hydrogen.Generation.Green_Levelised_Cost.Units = '$/kg';

Hydrogen.Generation.Blue_Levelised_Cost = Template;
Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue = 3.0
Hydrogen.Generation.Blue_Levelised_Cost.Uncertainity = 1.0;
Hydrogen.Generation.Blue_Levelised_Cost.Growth = 0.95;
Hydrogen.Generation.Blue_Levelised_Cost.Future(1) = Hydrogen.Generation.Blue_Levelised_Cost.CurrentValue * Hydrogen.Generation.Blue_Levelised_Cost.Growth;
for n = 2:Hydrogen.Generation.Blue_Levelised_Cost.Future_size 
    Hydrogen.Generation.Blue_Levelised_Cost.Future(n) = Hydrogen.Generation.Blue_Levelised_Cost.Future(n-1)* Hydrogen.Generation.Blue_Levelised_Cost.Growth;
end
Hydrogen.Generation.Blue_Levelised_Cost.Units = '$/kg';

save("constants.mat","Hydrogen");
