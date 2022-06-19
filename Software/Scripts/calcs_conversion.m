function energy = calcs_conversion(source, destination, param1, param2)
    filename = "constants_conversion.mat";
    foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
    load(fullfile(foldername, filename));


    
    if ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.CH2.Labels)==1))
        Conversion.H2.Pressure=param1;
        Conversion.CH2.Pressure=param2;
        %Volume of one kilogram 
        H2_Volume_L = Conversion.H2.Amount*Conversion.GasConstant*Conversion.H2.Temperature/Conversion.H2.Pressure; %Units: L
        H2_Volume = H2_Volume_L/1000;%Units: m3
        %assumed same temperature
        CH2_Volume = H2_Volume*(Conversion.H2.Pressure/Conversion.CH2.Pressure); %Units: m3
        
        %Calculcate energy
        energy_ideal = Conversion.H2.Amount*Conversion.GasConstant*Conversion.H2.Temperature*log(Conversion.CH2.Pressure/Conversion.H2.Pressure);
        energy = energy_ideal / Conversion.CH2.Efficiency; 
        energy_kWhr = calcs_JtoKWhr(energy);
    elseif ((strcmp(source,Conversion.CH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy=0; 
        energy_kWhr = calcs_JtoKWhr(energy);
    elseif ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.LH2.Labels)==1))
        energy = Conversion.LH2.Energy * 1000 * 3600;
        energy_kWhr = calcs_JtoKWhr(energy);
    elseif ((strcmp(source,Conversion.LH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy = 0;
        energy_kWhr = calcs_JtoKWhr(energy);
    elseif ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.CCH2.Labels)==1))
        Conversion.H2.Pressure=param1;
        %Volume of one kilogram 
        H2_Volume_L = Conversion.H2.Amount*Conversion.GasConstant*Conversion.H2.Temperature/Conversion.H2.Pressure; %Units: L
        H2_Volume = H2_Volume_L/1000; %Units: m3
        %Volume of one kilogram 
        CCH2_Volume_L = Conversion.H2.Amount*Conversion.GasConstant*Conversion.CCH2.Temperature/Conversion.CCH2.Pressure; %Units: L
        CCH2_Volume = CCH2_Volume_L/1000; %Units: m3
        
        %Calculcate energy
        energy_ideal = Conversion.H2.Amount*Conversion.GasConstant*Conversion.H2.Temperature*log(H2_Volume/CCH2_Volume);
        energy = energy_ideal / Conversion.CCH2.Efficiency; 
        energy_kWhr = calcs_JtoKWhr(energy);
    elseif ((strcmp(source,Conversion.CCH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy=0; 
        energy_kWhr = calcs_JtoKWhr(energy);
    else
        energy = 0; 
        disp('Conversion no valid');
    end
end