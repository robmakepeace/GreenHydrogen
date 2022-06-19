    filename = "constants_fuel.mat";
    foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
    load(fullfile(foldername, filename));

    filename = "constants_physical.mat";
    foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
    load(fullfile(foldername, filename));



    %Compressed Hydrogen Pathway
    pressure1 = 2000;
    pressure2 = 50000;
    energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, 2000);
    energy(2) = calcs_conversion('H2', 'CH2', pressure1 , pressure2);
    energy(3) = calcs_conversion('CH2', 'H2', pressure2, pressure1 );
    Conversion_Energy = sum(energy)/1000000;
    net_energy = Fuel.Hydrogen.EnergyDensity - Conversion_Energy;
    %energy_kWhr = calcs_JtoKWhr(1000000*conversion_energy)
    %energy_kWhr = calcs_JtoKWhr(1000000*Fuel.Hydrogen.EnergyDensity)
    Conversion_Efficency = net_energy / Fuel.Hydrogen.EnergyDensity

    %Liqifued Hydrogen Pathway       
    pressure1 = 2000;
    energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, pressure1);
    energy(2) = calcs_conversion('H2', 'LH2',0,0);
    energy(3) = calcs_conversion('LH2', 'H2',0,0);
    Conversion_Energy = sum(energy)/1000000;
    net_energy = Fuel.Hydrogen.EnergyDensity - Conversion_Energy;
    Conversion_Efficency = net_energy / Fuel.Hydrogen.EnergyDensity
    
    %Cryocompressed Hydrogen Pathway       
    pressure1 = 2000;
    energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, pressure1);
    energy(2) = calcs_conversion('H2', 'CCH2',pressure1,0);
    energy(3) = calcs_conversion('CCH2', 'H2',0,0);  
    Conversion_Energy = sum(energy)/1000000;
    net_energy = Fuel.Hydrogen.EnergyDensity - Conversion_Energy;
    Conversion_Efficency = net_energy / Fuel.Hydrogen.EnergyDensity    