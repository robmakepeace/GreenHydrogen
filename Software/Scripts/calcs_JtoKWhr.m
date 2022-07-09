%Calculcation convertering energy units
%Robert Makepeace
%First written 19/06/2022
%Last updated 09/07/2022

function kWhr = calcs_JtoKWhr(joules)
    %Joules to Watt hours -  divide by seconds in a hour
    Whr = joules / 3600; 
    %Kila Watt hour to Watt hours -  divide by 1000
    kWhr = Whr / 1000;
end