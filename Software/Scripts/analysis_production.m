%Green Hydrogen Main script
%Robert Makepeace
%First written 09/07/2022
%Last updated 09/07/2022

filename = "constants.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Hydrogen");

close all
var = Hydrogen.Generation.Green_Levelised_Cost;
var = Hydrogen.Generation.Blue_Levelised_Cost;
N = 100;
r = zeros(var.Future_size*N,1);
x = zeros(var.Future_size*N,1);

for year = 1:var.Future_size
    mu = var.value_at_year(year+var.Year-1);
    sigma = (var.value_at_year(year+var.Year-1) * var.Uncertainity)/2;
    for n=1:N
        r((year-1)*N+n) = normrnd(mu, sigma);
    end
    x((year-1)*N+1:(year-1)*N+N) = zeros(1,N)+year+var.Year-1;
end
visualise_montecarlo_parameter(var,x,r,N)

