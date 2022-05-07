%% WORLD CASE STUDY MAP
% close all
clear all
fig=figure
wrld = worldmap("World");
load coastlines
plotm(coastlat,coastlon)
geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9])
%setm(gca,'ffacecolor',[0.0 0.0 0.1])

Importer = [0.4660, 0.6740, 0.1880];
Exporter = [0.3010, 0.7450, 0.9330];

bordersm('countries','k')

bordersm('Australia','facecolor',Exporter)
citylat(1) = -23;
citylon(1) = 133;
bordersm('Chile','facecolor',Exporter)
citylat(2) = -33;
citylon(2) = -70;
bordersm('Morocco','facecolor',Exporter)
citylat(3) = 32;
citylon(3) = -8;
bordersm('Namibia','facecolor',Exporter)
citylat(4) = -22;
citylon(4) = 19;
bordersm('Saudi Arabia','facecolor',Exporter)
citylat(5) = 22;
citylon(5) = 39;

bordersm('japan','facecolor',Importer)
citylat(6) = 35;
citylon(6) = 139;
bordersm('Korea, Republic of','facecolor',Importer)
citylat(7) = 37;
citylon(7) = 127;
bordersm('germany','facecolor',Importer)
citylat(8) = 53;
citylon(8) = 13;
bordersm('Singapore','facecolor',Importer)
citylat(9) = 1;
citylon(9) = 104;
bordersm('China','facecolor',Importer)
citylat(10) = 40;
citylon(10) = 116;
bordersm('India','facecolor',Importer)
citylat(11) = 29;
citylon(11) = 77;
bordersm('United States','facecolor',Importer)
citylat(12) = 38;
citylon(12) = -122;

plotm(citylat,citylon,"r*")

[gclat,gclon] = track2("gc",citylat(1),citylon(1),citylat(6),citylon(6));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(1),citylon(1),citylat(7),citylon(7));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(1),citylon(1),citylat(9),citylon(9));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(2),citylon(2),citylat(12),citylon(12));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(1),citylon(1),citylat(8),citylon(8));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(3),citylon(3),citylat(8),citylon(8));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(4),citylon(4),citylat(8),citylon(8));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(5),citylon(5),citylat(8),citylon(8));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(5),citylon(5),citylat(10),citylon(10));
plotm(gclat,gclon,"r--")
[gclat,gclon] = track2("gc",citylat(5),citylon(5),citylat(11),citylon(11));
plotm(gclat,gclon,"r--")


title('Green Hydrogen Case Study Routes')
mlabel off; plabel off; gridm off
%labelLat = 35;
%labelLon = 14;
%textm(labelLat, labelLon, 'Mediterranean Sea')
saveas(fig,"worldmap1.png");

%% WORLD REGION MAP
close all
clear all
fig=figure
wrld = worldmap("World");
load coastlines
whos
plotm(coastlat,coastlon)
geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9])
%setm(gca,'ffacecolor',[0.0 0.0 0.1])

Europe = [0.2 0.2 0.8];
Africa = [0.6 0.2 0.2];
Asia = [0.6 0.6 0.2];
NorthAmerica = [0.2 0.6 0.2];
SouthAmerica = [0.6 0.2 0.6];
Oceania = [0.2 0.6 0.6];
bordersm('countries','k')

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


citylat(1) = -23;
citylon(1) = 133;
citylat(2) = 0;
citylon(2) = 28;
citylat(3) = 49;
citylon(3) = 10;
citylat(4) = 42;
citylon(4) = 104;
citylat(5) = 38;
citylon(5) = -100;
citylat(6) = -14;
citylon(6) = -58;

plotm(citylat,citylon,"r*")
for x = 1:6
    for y = 1:6
        [gclat,gclon] = track2("rh",citylat(x),citylon(x),citylat(y),citylon(y));
        plotm(gclat,gclon,"r--")
    end
end
mlabel off; plabel off; gridm off
%labelLat = 35;
%labelLon = 14;
%textm(labelLat, labelLon, 'Mediterranean Sea')
saveas(fig,"worldmap2.png");
