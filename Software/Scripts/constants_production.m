%Source: Projected Costs of Generating Electricity 2020 Edition

Japan.LCOE.Wind = 140.17; % Units: $USD/MWh
Japan.LCOE.Solar = 172.05; % Units: $USD/MWh
Japan.LCOE.Average = (Japan.LCOE.Wind + Japan.LCOE.Solar)/2; % Units: $USD/MWh

Korea.LCOE.Wind = 96.57; % Units: $USD/MWh
Korea.LCOE.Solar = 113.33; % Units: $USD/MWh
Korea.LCOE.Average = (Korea.LCOE.Wind + Korea.LCOE.Solar)/2; % Units: $USD/MWh

USA.LCOE.Wind = 35.19; % Units: $USD/MWh
USA.LCOE.Solar = 34.59; % Units: $USD/MWh
USA.LCOE.Average = (USA.LCOE.Wind + USA.LCOE.Solar)/2; % Units: $USD/MWh

China.LCOE.Wind = 58.43; % Units: $USD/MWh
China.LCOE.Solar = 50.78; % Units: $USD/MWh
China.LCOE.Average = (China.LCOE.Wind + China.LCOE.Solar)/2; % Units: $USD/MWh

Brazil.LCOE.Wind = 33.59; % Units: $USD/MWh
Brazil.LCOE.Solar = 46.02;  % Units: $USD/MWh
Brazil.LCOE.Average = (Brazil.LCOE.Wind + Brazil.LCOE.Solar)/2; % Units: $USD/MWh

Australia.LCOE.Wind = 43; % Units: $USD/MWh
Australia.LCOE.Solar = 38.65; % Units: $USD/MWh
Australia.LCOE.Average = (Australia.LCOE.Wind + Australia.LCOE.Solar)/2; % Units: $USD/MWh

Belgium.LCOE.Wind = 87.43; % Units: $USD/MWh
Belgium.LCOE.Solar = 90.22; % Units: $USD/MWh
Belgium.LCOE.Average = (Belgium.LCOE.Wind + Belgium.LCOE.Solar)/2; % Units: $USD/MWh

SaudiArabia.LCOE.Wind = 25; % Units: $USD/MWh
SaudiArabia.LCOE.Solar = 50; % Units: $USD/MWh
SaudiArabia.LCOE.Average = (SaudiArabia.LCOE.Wind + SaudiArabia.LCOE.Solar)/2; % Units: $USD/MWh

%Source: IRENA The Renewable Energy Transition in Africa
Africa.LCOE.Wind = 53; % Units: $USD/MWh
Africa.LCOE.Solar = 68; % Units: $USD/MWh
Africa.LCOE.Average = (Africa.LCOE.Wind + Africa.LCOE.Solar)/2; % Units: $USD/MWh

Morocco.LCOE.Average = Africa.LCOE.Average;
Namibia.LCOE.Average = Africa.LCOE.Average;

main_print("\nCountry Factors",'a');
Australia.LCOE.Factor = 1;
main_print(strcat("Australia:",string(Australia.LCOE.Factor)) ,'a');
Japan.LCOE.Factor = Japan.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("Japan:",string(Japan.LCOE.Factor)) ,'a');
Korea.LCOE.Factor = Korea.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("Korea:",string(Korea.LCOE.Factor)) ,'a');
USA.LCOE.Factor = USA.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("USA:",string(USA.LCOE.Factor)) ,'a');
China.LCOE.Factor = China.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("China:",string(China.LCOE.Factor)) ,'a');
Brazil.LCOE.Factor = Brazil.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("Brazil:",string(Brazil.LCOE.Factor)) ,'a');
Belgium.LCOE.Factor = Belgium.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("Belgium:",string(Belgium.LCOE.Factor)) ,'a');
SaudiArabia.LCOE.Factor = SaudiArabia.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("SaudiaArabia:",string(SaudiArabia.LCOE.Factor)) ,'a');
Morocco.LCOE.Factor = Morocco.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("Morocco:",string(Morocco.LCOE.Factor)) ,'a');
Namibia.LCOE.Factor = Namibia.LCOE.Average / Australia.LCOE.Average;
main_print(strcat("Namibia:",string(Namibia.LCOE.Factor)) ,'a');

%Regions
Oceania.LCOE.Average = Australia.LCOE.Average;
Europe.LCOE.Average = Belgium.LCOE.Average;
SouthAmerica.LCOE.Average = Brazil.LCOE.Average;
NorthAmerica.LCOE.Average = USA.LCOE.Average;
Asia.LCOE.Average = Korea.LCOE.Average;
Africa.LCOE.Average;

main_print("\nRegion Factors",'a');
Oceania.LCOE.Factor = 1;
main_print(strcat("Oceania:",string(Oceania.LCOE.Factor)) ,'a');
Europe.LCOE.Factor = Europe.LCOE.Average / Oceania.LCOE.Average;
main_print(strcat("Europe:",string(Europe.LCOE.Factor)) ,'a');
NorthAmerica.LCOE.Factor = NorthAmerica.LCOE.Average / Oceania.LCOE.Average;
main_print(strcat("NorthAmerica:",string(NorthAmerica.LCOE.Factor)) ,'a');
SouthAmerica.LCOE.Factor = SouthAmerica.LCOE.Average / Oceania.LCOE.Average;
main_print(strcat("SouthAmerica:",string(SouthAmerica.LCOE.Factor)) ,'a');
Asia.LCOE.Factor = Asia.LCOE.Average / Oceania.LCOE.Average;
main_print(strcat("Asia:",string(Asia.LCOE.Factor)) ,'a');
Africa.LCOE.Factor = Africa.LCOE.Average / Oceania.LCOE.Average;
main_print(strcat("Africa:",string(Africa.LCOE.Factor)) ,'a');

%Save variables
filename = "constants_production_countries.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Australia","Japan","Korea","USA","China","Brazil","Belgium","SaudiArabia","Morocco","Namibia");

filename = "constants_production_regions.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Oceania","Europe","NorthAmerica","SouthAmerica","Asia","Africa");