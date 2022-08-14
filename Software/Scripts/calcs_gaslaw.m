%Green Hydrogen Gas Law calculcation
%Robert Makepeace
%First written 14/08/2022
%Last updated 14/08/2022

function [n, mass, density] = calcs_gaslaw (Pressure, Volume, Temperature, GasConstant, MM);
    %Pressure Units kPa
    %Volume m^3
    %Tempperature Kelvin
    %Gas Constatnt J mol^-1 Kelvin^-1
    %n in mols

    %Calculcate number of molecules of gas
    n = Pressure * Volume / (GasConstant * Temperature); %Units: mols
    
    %Calcuclate mass of gas
    mass = n * MM/1000; %Units: kg

    %Calculcate new gas density
    if Volume == 0
        density = 0;
    else
        density = mass / Volume; %Units: kg/m3
    end
end