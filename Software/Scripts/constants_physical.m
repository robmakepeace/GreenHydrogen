Physical.AmbientPressure = 101.325;
Physical.AmbientTemp_C = 20;
Physical.AmbientTemp_K = Physical.AmbientTemp_C + 273.15;

%Save variables
filename = "constants_physical.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Physical");