    %Green Hydrogen Conversion Analysis 
    %Robert Makepeace
    %First written 19/06/2022
    %Last updated 18/09/2022

    %Load physical variables
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),"Physical");

    %Load fuel variables
    filename = "constants_fuel.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),"Fuel");

    %Print to Text File
    main_print("\nConversion Analysis",'a');

    %Compressed Hydrogen Conversion Pathway
    pressure1 = 2000;
    pressure2 = 50000;
    energy = zeros(2,1);
    %energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, pressure1);% Units: J
    energy(2) = calcs_conversion('H2', 'CH2', pressure1, pressure2);% Units: J
    ConversionCosts.H2_CH2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.H2_CH2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.H2_CH2.Energy_MJ;
    ConversionCosts.H2_CH2.Efficency = ConversionCosts.H2_CH2.NetEnergy / Physical.H2_EnergyDensity; 
    main_print(strcat("Compressed Hydrogen Pathway Conversion Efficency: ",string(100*ConversionCosts.H2_CH2.Efficency)," %%"),'a');

    %Compressed Hydrogen Reconversion Pathway
    energy = zeros(1,1);
    energy(1) = calcs_conversion('CH2', 'H2', pressure2, pressure1);% Units: J
    ConversionCosts.CH2_H2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.CH2_H2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.CH2_H2.Energy_MJ;
    ConversionCosts.CH2_H2.Efficency = ConversionCosts.CH2_H2.NetEnergy / Physical.H2_EnergyDensity; 
    main_print(strcat("Compressed Hydrogen Pathway Reconversion Efficency: ",string(100*ConversionCosts.CH2_H2.Efficency)," %%"),'a');

    %Liquefied Hydrogen Conversion Pathway       
    pressure1 = 2000;
    energy = zeros(2,1);    
    %energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, pressure1);
    energy(2) = calcs_conversion('H2', 'LH2',0,0);

    ConversionCosts.H2_LH2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.H2_LH2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.H2_LH2.Energy_MJ;
    ConversionCosts.H2_LH2.Efficency = ConversionCosts.H2_LH2.NetEnergy / Physical.H2_EnergyDensity;    
    main_print(strcat("Liquefied Hydrogen Pathway Conversion Efficency: ",string(100*ConversionCosts.H2_LH2.Efficency)," %%"),'a');
  
    %Liquefied Hydrogen Reconversion Pathway       
    energy = zeros(1,1);
    energy(1) = calcs_conversion('LH2', 'H2',0,0);
    ConversionCosts.LH2_H2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.LH2_H2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.LH2_H2.Energy_MJ;
    ConversionCosts.LH2_H2.Efficency = ConversionCosts.LH2_H2.NetEnergy / Physical.H2_EnergyDensity;    
    main_print(strcat("Liquefied Hydrogen Pathway Reconversion Efficency: ",string(100*ConversionCosts.LH2_H2.Efficency)," %%"),'a');

    %Cryocompressed Hydrogen Conversion Pathway       
    pressure1 = 2000;
    energy = zeros(2,1); 
    %energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, pressure1);
    energy(2) = calcs_conversion('H2', 'CCH2',pressure1,0);
    ConversionCosts.H2_CCH2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.H2_CCH2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.H2_CCH2.Energy_MJ;
    ConversionCosts.H2_CCH2.Efficency = ConversionCosts.H2_CCH2.NetEnergy / Physical.H2_EnergyDensity;    
    main_print(strcat("Cryocompressed Hydrogen Pathway Conversion Efficency: ",string(100*ConversionCosts.H2_CCH2.Efficency)," %%"),'a');

    %Cryocompressed Hydrogen Reconversion Pathway       
    energy = zeros(1,1);
    energy(3) = calcs_conversion('CCH2', 'H2',0,0);  
    ConversionCosts.CCH2_H2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.CCH2_H2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.CCH2_H2.Energy_MJ;
    ConversionCosts.CCH2_H2.Efficency = ConversionCosts.CCH2_H2.NetEnergy / Physical.H2_EnergyDensity;    
    main_print(strcat("Cryocompressed Hydrogen Pathway Conversion Efficency: ",string(100*ConversionCosts.CCH2_H2.Efficency)," %%"),'a');

    %Slush Hydrogen Conversion Pathway       
    pressure1 = 2000;
    energy = zeros(2,1); 
    %energy(1) = calcs_conversion('H2', 'CH2', Physical.AmbientPressure, pressure1);
    energy(2) = calcs_conversion('H2', 'SH2',pressure1,0);
    ConversionCosts.H2_SH2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.H2_SH2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.H2_SH2.Energy_MJ;
    ConversionCosts.H2_SH2.Efficency = ConversionCosts.H2_SH2.NetEnergy / Physical.H2_EnergyDensity;    
    main_print(strcat("Slush Hydrogen Pathway Conversion Efficency: ",string(100*ConversionCosts.H2_SH2.Efficency)," %%"),'a');

    %Slush Hydrogen Reconversion Pathway       
    energy = zeros(1,1);
    energy(3) = calcs_conversion('SH2', 'H2',0,0);  
    ConversionCosts.SH2_H2.Energy_MJ = sum(energy)/1000000;
    ConversionCosts.SH2_H2.NetEnergy = Physical.H2_EnergyDensity - ConversionCosts.SH2_H2.Energy_MJ;
    ConversionCosts.SH2_H2.Efficency = ConversionCosts.SH2_H2.NetEnergy / Physical.H2_EnergyDensity;    
    main_print(strcat("Slush Hydrogen Pathway Conversion Efficency: ",string(100*ConversionCosts.SH2_H2.Efficency)," %%"),'a');

    %Save variables
    filename = "results_conversions.mat";
    foldername = pwd + "\Variables\";
    save(fullfile(foldername, filename),"ConversionCosts");

    %Close files
    fclose('all');