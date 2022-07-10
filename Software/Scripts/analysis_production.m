%Green Hydrogen Hydrogen Production Analysis
%Robert Makepeace
%First written 09/07/2022
%Last updated 10/07/2022

filename = "constants.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Hydrogen");

var_in=Hydrogen.Economic.Electricity_Price;
var_in.montecarlo_samples();
var_in.plot_montecarlo()

var_in=Hydrogen.Economic.Electroylser_CAPEX;
var_in.montecarlo_samples();
var_in.plot_montecarlo()

cost = zeros(var_in.Future_size*var_in.mc_N,1);
for sample = 1:var_in.Future_size*var_in.mc_N
    parameters.Electricity = Hydrogen.Economic.Electricity_Price.mc_r(sample);
    parameters.CAPEX_Electroysler = Hydrogen.Economic.Electroylser_CAPEX.mc_r(sample);
    cost(sample) = calcs_production(parameters);
end
var_out = variable(0.0,0.0,0.0,'$AUD/Mt','Cost ($AUD/kg)','Green Hydrogen Price');
var_out.mc_x = var_in.mc_x;
var_out.mc_r = cost;
var_out.montecarlo_fit();
var_out.plot_montecarlo();

%Save variables
filename = "results_production.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"var_out");