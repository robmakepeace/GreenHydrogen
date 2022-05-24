%% WORLD CASE STUDY MAP
close all
clear all
fig=figure;


filename = "constants_casestudies.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

filename = "constants_regions.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

wrld = worldmap("World");
load coastlines;
plotm(coastlat,coastlon);
geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
%setm(gca,'ffacecolor',[0.0 0.0 0.1]);

Importer = [0.4660, 0.6740, 0.1880];
Exporter = [0.3010, 0.7450, 0.9330];

bordersm('countries','k')
bordersm('Australia','facecolor',Exporter)
bordersm('Chile','facecolor',Exporter)
bordersm('Morocco','facecolor',Exporter)
bordersm('Namibia','facecolor',Exporter)
bordersm('Saudi Arabia','facecolor',Exporter)
bordersm('japan','facecolor',Importer)
bordersm('Korea, Republic of','facecolor',Importer)
bordersm('germany','facecolor',Importer)
bordersm('Singapore','facecolor',Importer)
bordersm('China','facecolor',Importer)
bordersm('India','facecolor',Importer)
bordersm('United States','facecolor',Importer)

plotm(CaseStudies.citylat,CaseStudies.citylon,"r*")

for i = 1:CaseStudies.NumberOfRoutes
    [gclat,gclon] = track2("gc",CaseStudies.citylat(CaseStudies.Routes(i,1)),CaseStudies.citylon(CaseStudies.Routes(i,1)),CaseStudies.citylat(CaseStudies.Routes(i,2)),CaseStudies.citylon(CaseStudies.Routes(i,2)));
    plotm(gclat,gclon,"r--")
end

title('Green Hydrogen Case Study Routes')
mlabel off; plabel off; gridm off
filename = "worldmap1.png";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Graphs\";
saveas(fig,fullfile(foldername, filename));

%% WORLD REGION MAP
close all
fig=figure;
wrld = worldmap("World");
load coastlines;
plotm(coastlat,coastlon);
geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
%setm(gca,'ffacecolor',[0.0 0.0 0.1])

Europe = [0.2 0.2 0.8];
Africa = [0.6 0.2 0.2];
Asia = [0.6 0.6 0.2];
NorthAmerica = [0.2 0.6 0.2];
SouthAmerica = [0.6 0.2 0.6];
Oceania = [0.2 0.6 0.6];
bordersm('countries','k');

%Europe
cou_nam1 = {'Albania','Andorra','Austria','Belarus','Belgium','Bosnia and Herzegovina','Bulgaria',...
    'Croatia','Cyprus','Czech Republic', 'Denmark', 'Estonia','Finland','France','Germany',...
    'Greece','Hungary','Iceland','Ireland','Italy','Latvia', 'Liechtenstein','Lithuania', 'Luxembourg',...
    'Malta','Republic of Moldova','Monaco','Montenegro','Netherlands','Norway','Poland', ...
    'Portugal','Romania','San Marino','Serbia','Slovenia', 'Slovakia','Spain','Sweden'...
    'Switzerland','Turkey','Ukraine','United Kingdom'};
numRegions = length(cou_nam1);
for i = 1:1:numRegions
    bordersm(cou_nam1{i},'facecolor',Europe) 
end
%Africa
cou_nam2 = {'Algeria','Angola','Benin','Botswana','Burkina Faso','Burundi','Cape Verde',...
    'Cameroon','Central African Republic','Chad','Comoros','Congo',...
    'Democratic Republic of the Congo','Djibouti','Egypt','Equatorial Guinea','Eritrea',...
    'Swaziland','Ethiopia','Gabon','Gambia','Ghana','Guinea','Guinea-Bissau',...
    'Cote d''Ivoire','Kenya','Lesotho','Liberia','Libyan Arab Jamahiriya','Madagascar','Malawi','Mali',...
    'Mauritania','Mauritius','Morocco','Mozambique','Namibia','Niger','Nigeria','Rwanda',...
    'Sao Tome and Principe','Senegal','Seychelles','Sierra Leone','Somalia','South Africa',...
    'Sudan','United Republic of Tanzania','Togo','Tunisia','Uganda','Western Sahara','Zambia','Zimbabwe'};
numRegions = length(cou_nam2);
for i = 1:1:numRegions
    bordersm(cou_nam2{i},'facecolor',Africa) 
end
%Asia
cou_nam3 = {
'Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh','Bhutan','British Indian Ocean Territory',...
'Brunei Darussalam','Cambodia','China','Georgia','Hong Kong','India','Indonesia','Iran Islamic Republic of','Iraq','Israel','Japan',...
'Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Lao People''s Democratic Republic','Lebanon','Macau','Malaysia','Maldives','Mongolia',...
'Burma','Nepal','Korea, Democratic People''s Republic of','Oman','Pakistan','Palestine','Philippines',...
'Qatar','Russia','Saudi Arabia','Singapore','Korea, Republic of','Sri Lanka','Syrian Arab Republic','Taiwan',...
'Tajikistan','Thailand','Timor-Leste','Turkmenistan','United Arab Emirates',...
'Uzbekistan','Viet Nam','Yemen'};
numRegions = length(cou_nam3);
for i = 1:1:numRegions
    bordersm(cou_nam3{i},'facecolor',Asia) 
end
%North America
cou_nam4 = {
'Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica','Cuba',...
'Dominica','Dominican Republic','El Salvador','Greenland','Grenada','Guatemala','Haiti',...
'Honduras','Jamaica','Mexico','Nicaragua','Panama','Saint Kitts and Nevis',...
'Saint Lucia','Saint Vincent and the Grenadines','Trinidad and Tobago',...
'United States'};
numRegions = length(cou_nam4);
for i = 1:1:numRegions
    bordersm(cou_nam4{i},'facecolor',NorthAmerica) 
end
%South America
cou_nam5 = {
'Argentina','Bolivia','Brazil','Chile','Colombia','Ecuador',...
'French Guiana','Guyana','Paraguay','Peru','Suriname','Uruguay','Venezuela'};
numRegions = length(cou_nam5);
for i = 1:1:numRegions
    bordersm(cou_nam5{i},'facecolor',SouthAmerica) 
end
%Oceania
cou_nam6 = {
'Antarctica','Australia','Fiji','Kiribati','Marshall Islands','Micronesia, Federated States of',...
'Nauru','New Zealand','Palau','Papua New Guinea','Samoa','Solomon Islands','Tonga',...
'Tuvalu','Vanuatu'};
numRegions = length(cou_nam6);
for i = 1:1:numRegions
    bordersm(cou_nam6{i},'facecolor',Oceania) 
end
title('Green Hydrogen World Regions')

plotm(Regions.citylat,Regions.citylon,"r*")
for x = 1:Regions.NumberOfRegions
    for y = 1:Regions.NumberOfRegions
        [gclat2,gclon2] = track2("rh",Regions.citylat(x),Regions.citylon(x),Regions.citylat(y),Regions.citylon(y));
        plotm(gclat2,gclon2,"r--")
    end
end

mlabel off; plabel off; gridm off

filename = "worldmap2.png";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Graphs\";
saveas(fig,fullfile(foldername, filename));
