%% AUSTRALIA EXPORT MAP	'r';
close all;
clear all;
fig=figure;

land = readgeotable("landareas.shp");

wrld = worldmap(["Australia"]);
latlim = [-45, -10];
lonlim = [110, 160];
wrld = worldmap(latlim, lonlim);
geoshow(land,"FaceColor",[0.9 0.9 0.9])


%Asian Renewable Energy Hub
citylat(1) = -20.407408;
citylon(1) = 121.307033;
descrip(1) = {'Asian Renewable Energy Hub'};
colour(1) = 'r';

%Western Green Energy Hub
citylat(2) = -31.921503;
citylon(2) = 125.705507;
descrip(2) = {'Western Green Energy Hub'};
colour(2) = 'r';

%HyEnergy Zero Carbon Hydrogen
citylat(3) = -24.839137;
citylon(3) = 113.702750;
descrip(3) = {'HyEnergy Zero Carbon Hydrogen'};
colour(3) = 'b';

%Murchison Renewable Hydrogen Project
citylat(4) = -26.426720;
citylon(4) = 115.842974;
descrip(4) = {'Murchison Renewable Hydrogen Project'};
colour(4) = 'r';

%Pacific Solar Hydrogen
citylat(5) = -24.290890;
citylon(5) = 150.513415;
descrip(5) = {'Pacific Solar Hydrogen'};
colour(5) = 'k';

%H2-Hub Gladstone
citylat(6) = -23.877974;
citylon(6) = 151.284246;
descrip(6) = {'H2-Hub Gladstone'};
colour(6) = 'r';

%Burnie Hydrogen Hub
citylat(7) = -41.067603; 
citylon(7) = 145.950446;
descrip(7) = {'Burnie Hydrogen Hub'};
colour(7) = 'k';

%H2TAS Project
citylat(8) = -41.131080;
citylon(8) = 146.858026;
descrip(8) = {'H2TAS Project'};
colour(8) = 'r';

%Hydrogen Energy Supply Chain Project
citylat(9) = -38.158602; 
citylon(9) = 146.797243;
descrip(9) = {'Hydrogen Energy Supply Chain Project'};
colour(9) = 'g';

%Heywood Hydrogen and Solar Farm
citylat(10) = -38.135678; 
citylon(10) = 141.582273;
descrip(10) = {'Heywood Hydrogen and Solar Farm'};
colour(10) = 'r';

%Eyre Peninsula Gateway Project
citylat(11) = -34.432517;
citylon(11) = 135.625170;
descrip(11) = {'Eyre Peninsula Gateway Project'};
colour(11) = 'r';

%Project NEO
citylat(12) = -32.513917; 
citylon(12) = 151.074007;
descrip(12) = {'Project NEO'};
colour(12) = 'r';

%Bundaberg Hydrogen Hub
citylat(13) = -24.932201;
citylon(13) = 152.322697;
descrip(13) = {'Bundaberg Hydrogen Hub'};
colour(13) = 'r';

%Stanwell Hydrogen Electrolysis Deployment
citylat(14) = -23.360146; 
citylon(14) = 150.406047;
descrip(14) = {'Stanwell Hydrogen Electrolysis Deployment'};
colour(14) = 'r';

%Renewable Ammonia Facility 
citylat(15) = -22.012522;
citylon(15) = 148.025581;
descrip(15) = {'Renewable Ammonia Facility '};
colour(15) = 'r';

%Central Queensland Hydrogen Project (CQ-H2)
citylat(16) = -23.877974;
citylon(16) = 151.284246;
descrip(16) = {'CQ-H2'};
colour(16) = 'g';

%Gibson Island Green Ammonia Feasibility
citylat(17) = -27.433498;
citylon(17) = 153.126065;
descrip(17) = {'Gibson Island Green Ammonia Feasibility'};
colour(17) = 'r';

%Green Hydrogen and Ammonia Project
citylat(18) = -24.602885;
citylon(18) = 149.943269;
descrip(18) = {'Green Hydrogen and Ammonia Project'};
colour(18) = 'r';

%Arrowsmith Hydrogen Project
citylat(19) = -29.230113;
citylon(19) = 114.943102;
descrip(19) = {'Arrowsmith Hydrogen Project'};
colour(19) = 	'k';

%Tiwi Islands Green Hydrogen Export Project
citylat(20) = -11.595584;
citylon(20) = 130.876518;
descrip(20) = {'Tiwi Islands Green Hydrogen Export Project'};
colour(20) = 'b';

%Crystal Brook Energy Park
citylat(21) = -33.370080;
citylon(21) = 138.185422;
descrip(21) = {'Crystal Brook Energy Park'};
colour(21) = 'm';

%Crystal Brook Energy Park
citylat(22) = -34.478531;
citylon(22) = 150.911094;
descrip(22) = {'Port Kembla Hydrogen Hub'};
colour(22) = 'k';

for i = 1:22
    geoshow(citylat(i),citylon(i),"Marker",".","Color",colour(i))
end
for i = 1:6
    textm(citylat(i),(citylon(i)+0.5),descrip(i),"Color",colour(i),"FontSize",8)
end
textm(citylat(7),(citylon(7)-7),descrip(7),"Color",colour(7),"FontSize",8)
for i = 8:15
    textm(citylat(i),(citylon(i)+0.5),descrip(i),"Color",colour(i),"FontSize",8)
end
textm(citylat(16),(citylon(16)-3),descrip(16),"Color",colour(16),"FontSize",8)
textm(citylat(17),(citylon(17)+1),descrip(17),"Color",colour(17),"FontSize",8)
textm(citylat(18),(citylon(18)-12),descrip(18),"Color",colour(18),"FontSize",8)
for i = 19:22
    textm(citylat(i),(citylon(i)+0.5),descrip(i),"Color",colour(i),"FontSize",8)
end

title('Proposed Australian Green Hydrogen Production Projects For Export')
fig.WindowState = 'maximized';

filename = "australia.png";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Graphs\";
saveas(fig,fullfile(foldername, filename));