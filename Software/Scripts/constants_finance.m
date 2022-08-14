%Green Hydrogen Finance constants
%Robert Makepeace
%First written 14/08/2022
%Last updated 14/08/2022

Finance.DiscountRate = 5.0; %Units: %

%Save variables
filename = "constants_finance.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"Finance");