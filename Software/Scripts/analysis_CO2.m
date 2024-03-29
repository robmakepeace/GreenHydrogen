%Green Hydrogen CO2 Analysis 
%Robert Makepeace
%First written 18/09/2022
%Last updated 18/09/2022

%Load Case Study Variables
filename = "results_transportcosts.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "constants_physical.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "constants_fuel.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

CO2.Coal.CO2_WeightFuel = 3.66; %Units kgCO2/kgC
CO2.Coal.CO2_Energy = CO2.Coal.CO2_WeightFuel / Physical.Coal_EnergyDensity;%Units kgCO2/MJ

CO2.Diesel.CO2_WeightFuel = Fuel.Diesel.CO2 * (1000 / Physical.Diesel_WeightDensity); %Units kgCO2/kgD
CO2.Diesel.CO2_Energy = CO2.Diesel.CO2_WeightFuel / Physical.Diesel_EnergyDensity;%Units kgCO2/MJ

CO2.LNG.CO2_WeightFuel = 1419.75 / Physical.LNG_WeightDensity; %Units kgCO2/kgD
CO2.LNG.CO2_Energy = CO2.LNG.CO2_WeightFuel / Physical.LNG_EnergyDensity;%Units kgCO2/MJ

CO2.NG.CO2_WeightFuel = 2.001 / Physical.NaturalGas_WeightDensity; %Units kgCO2/kgD
CO2.NG.CO2_Energy = CO2.NG.CO2_WeightFuel / Physical.NaturalGas_EnergyDensity;%Units kgCO2/MJ

CO2.H2.CO2_Energy = 0;

y = zeros(2,5);
y = [CO2.Diesel.CO2_Energy CO2.NG.CO2_Energy CO2.LNG.CO2_Energy CO2.Coal.CO2_Energy CO2.H2.CO2_Energy];
%Units: kgC02/MJ delivered 

Distance = 5000; 
t = 1;%Ship
y(2,1) = TransportCosts.Batch(t,11).Diesel.CO2_km * Distance / TransportCosts.Batch(t,11).EnergyPerLoad;
y(2,2) = TransportCosts.Batch(t,12).Diesel.CO2_km * Distance / TransportCosts.Batch(t,12).EnergyPerLoad;
y(2,3) = TransportCosts.Batch(t,13).Diesel.CO2_km * Distance / TransportCosts.Batch(t,13).EnergyPerLoad;
y(2,4) = TransportCosts.Batch(t,14).Diesel.CO2_km * Distance / TransportCosts.Batch(t,14).EnergyPerLoad;
y(2,5) = TransportCosts.Batch(t,2).Diesel.CO2_km * Distance / TransportCosts.Batch(t,2).EnergyPerLoad;
%Units: kgC02/MJ delivered 

x = 1:5;
x_cats = {'Diesel','NG','LNG','Coal','H2'};
y_cats = {'Fuel Emissions','Transport Emissions'};
desc = " CO2 Emissions";
xlabel_desc = "kg CO2/MJ delivered";
visualise_breakdown(x, y, x_cats, y_cats,desc,xlabel_desc);

desc = " CO2 Carbon Cost ($AUD per kgCO2)";
C02.Volume = y(1,:) + y(2,:);
y_cats = 'Emissions';
CarbonPrice = 100;
z = C02.Volume .* CarbonPrice;
xlabel_desc = "$AUD/MJ delivered";
visualise_breakdown(x, z, x_cats, y_cats,desc,xlabel_desc);

CO2.List = x_cats
CO2.Cost = z;

%Cost per MJ
fuel = [41.5 24.9 16.6 17.4 44.0 30.0 20.0];
emissions = [0 0 0 0.104 0.069 0.075 0.05];
c = 0:1:500;
for i = 1:size(c,2)
    for f = 1:7
        cost(i,f) = fuel(f) + c(i) *  emissions(f);
    end
end
i = 100
for f = 4:7
    CO2.carbon(f-3) = c(i) *  emissions(f);
end

fig = figure
fig.Position = [100 100 800 600];
plot(cost,'LineWidth',2)
title('Alternate Fuel Breakeven Carbon Price')
x_cats = {'Green Hydrogen (2025)','Green Hydrogen (2030)', 'Green Hydrogen (2050)','Coal','Diesel','LNG','NG'};
legend(x_cats,'Location','bestoutside')
xlabel('Carbon Price ($/kgCO2)')
ylabel('Delivered Energy Price ($/GJ)')
title('Alternate Fuels Breakeven Carbon Price')
xlim([0 500])
ylim([0 80])

%Save Figure
filename = "alternatefuelco2.png";
foldername = pwd + "\Graphs\";
saveas(fig,fullfile(foldername, filename));


%Save variables
filename = "constants_transport.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"CO2");
%Close files
fclose('all');

