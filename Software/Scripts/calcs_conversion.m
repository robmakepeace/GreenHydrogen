%Medium conversions calculcation
%Robert Makepeace
%First written 19/06/2022
%Last updated 09/07/2022

function [energy, energy_kWhr] = calcs_conversion(source, destination, param1, param2)
    %Load physical variables
    filename = "constants_physical.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),'Physical');
    
    %Load conversion variables
    filename = "constants_conversion.mat";
    foldername = pwd + "\Variables\";
    load(fullfile(foldername, filename),'Conversion');
  
    %Uncompressed H2 Gas to Compressed H2 Gas

    if ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.CH2.Labels)==1))
        Conversion.H2.Pressure=param1;
        Conversion.CH2.Pressure=param2;
        %Volume of one kilogram 
        H2_Volume_L = Conversion.H2.Amount*Physical.GasConstant*Conversion.H2.Temperature/Conversion.H2.Pressure; %Units: L
        H2_Volume = H2_Volume_L/1000;%Units: m3
        %assumed same temperature
        CH2_Volume = H2_Volume*(Conversion.H2.Pressure/Conversion.CH2.Pressure); %Units: m3
        
        %Calculcate energy
        energy_ideal = Conversion.H2.Amount*Physical.GasConstant*Conversion.H2.Temperature*log(Conversion.CH2.Pressure/Conversion.H2.Pressure);
        energy = energy_ideal / Conversion.CH2.Efficiency; 
        energy_kWhr = calcs_JtoKWhr(energy);

    %Compressed H2 Gas to Uncompressed H2 Gas    

    elseif ((strcmp(source,Conversion.CH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy=0; 
        energy_kWhr = calcs_JtoKWhr(energy);

    %Uncompressed H2 Gas to Liquified H2

    elseif ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.LH2.Labels)==1))
        energy = Conversion.LH2.Energy * 1000 * 3600;
        energy_kWhr = calcs_JtoKWhr(energy);

    %Liquified H2 to Uncompressed H2 Gas

    elseif ((strcmp(source,Conversion.LH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy = 0;
        energy_kWhr = calcs_JtoKWhr(energy);

    %Uncompressed H2 Gas to Cryocompressed H2

    elseif ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.CCH2.Labels)==1))
        Conversion.H2.Pressure=param1;
        %Volume of one kilogram 
        H2_Volume_L = Conversion.H2.Amount*Physical.GasConstant*Conversion.H2.Temperature/Conversion.H2.Pressure; %Units: L
        H2_Volume = H2_Volume_L/1000; %Units: m3
        %Volume of one kilogram 
        CCH2_Volume_L = Conversion.H2.Amount*Physical.GasConstant*Conversion.CCH2.Temperature/Conversion.CCH2.Pressure; %Units: L
        CCH2_Volume = CCH2_Volume_L/1000; %Units: m3
        
        %Calculcate energy
        energy_ideal = Conversion.H2.Amount*Physical.GasConstant*Conversion.H2.Temperature*log(H2_Volume/CCH2_Volume);
        energy = energy_ideal / Conversion.CCH2.Efficiency; 
        energy_kWhr = calcs_JtoKWhr(energy);

    %Cryocompressed H2 Gas to Uncompressed H2

    elseif ((strcmp(source,Conversion.CCH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy=0; 
        energy_kWhr = calcs_JtoKWhr(energy);

    %Uncompressed H2 Gas to Slush H2
    elseif ((strcmp(source,Conversion.H2.Labels)==1) && (strcmp(destination,Conversion.SH2.Labels)==1))
        Conversion.H2.Pressure=param1;
        %Volume of one kilogram 
        H2_Volume_L = Conversion.H2.Amount*Physical.GasConstant*Conversion.H2.Temperature/Conversion.H2.Pressure; %Units: L
        H2_Volume = H2_Volume_L/1000; %Units: m3
        %Volume of one kilogram 
        SH2_Volume_L = Conversion.H2.Amount*Physical.GasConstant*Conversion.SH2.Temperature/Conversion.SH2.Pressure; %Units: L
        SH2_Volume = SH2_Volume_L/1000; %Units: m3
        
        %Calculcate energy
        energy_ideal = Conversion.H2.Amount*Physical.GasConstant*Conversion.H2.Temperature*log(H2_Volume/SH2_Volume);
        energy = energy_ideal / Conversion.SH2.Efficiency; 
        energy_kWhr = calcs_JtoKWhr(energy);

    elseif ((strcmp(source,Conversion.SH2.Labels)==1) && (strcmp(destination,Conversion.H2.Labels)==1))
        energy=0; 
        energy_kWhr = calcs_JtoKWhr(energy);
    %Else Case  
     
    else
        energy = 0; 
        disp('Conversion not valid');
    end
    %Close files
    fclose('all');
end