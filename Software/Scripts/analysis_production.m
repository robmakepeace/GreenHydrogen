%Green Hydrogen Hydrogen Production Analysis
%Robert Makepeace
%First written 09/07/2022
%Last updated 10/07/2022

filename = "constants.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "constants_production_countries.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

filename = "constants_production_regions.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

var_in=Hydrogen.Economic.Aus_Electricity_Price;
var_in.montecarlo_samples();
var_in.plot_montecarlo()

var_in=Hydrogen.Economic.Electroylser_CAPEX;
var_in.montecarlo_samples();
var_in.plot_montecarlo()

var_in=Hydrogen.Economic.Electroylser_OPEX;
var_in.montecarlo_samples();
var_in.plot_montecarlo()

var_in=Hydrogen.Generation.Electroysler_Effeciency;
var_in.montecarlo_samples();
var_in.plot_montecarlo()

cost = zeros(var_in.Future_size*var_in.mc_N,1);
for sample = 1:var_in.Future_size*var_in.mc_N
    parameters.Electricity = Hydrogen.Economic.Aus_Electricity_Price.mc_r(sample);
    parameters.CAPEX_Electroysler = Hydrogen.Economic.Electroylser_CAPEX.mc_r(sample);
    parameters.OPEX_Electroysler = Hydrogen.Economic.Electroylser_OPEX.mc_r(sample);
    parameters.Electroysler_Effeciency = Hydrogen.Generation.Electroysler_Effeciency.mc_r(sample);
    cost(sample) = calcs_production(parameters);
end
LCOE.Australia = variable(0.0,0.0,0.0,'$AUD/kg','Cost ($AUD/kg)','Australia Green Hydrogen Price');
LCOE.Australia.mc_x = var_in.mc_x;
LCOE.Australia.mc_r = cost;
LCOE.Australia.montecarlo_fit();
LCOE.Australia.plot_montecarlo();

LCOE.Japan = variable(Japan.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Japan Green Hydrogen Price');
LCOE.Japan.init(Japan.LCOE.Factor * LCOE.Australia.Future);
LCOE.Japan.plot('#00FF00','#77AC30');
LCOE.Japan.montecarlo_samples();
LCOE.Japan.plot_montecarlo();

LCOE.Korea = variable(Korea.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Korea Green Hydrogen Price');
LCOE.Korea.init(Korea.LCOE.Factor * LCOE.Australia.Future);
LCOE.Korea.plot('#00FF00','#77AC30');
LCOE.Korea.montecarlo_samples();
LCOE.Korea.plot_montecarlo();

LCOE.USA = variable(USA.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','USA Green Hydrogen Price');
LCOE.USA.init(USA.LCOE.Factor * LCOE.Australia.Future);
LCOE.USA.plot('#00FF00','#77AC30');
LCOE.USA.montecarlo_samples();
LCOE.USA.plot_montecarlo();

LCOE.China = variable(China.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','China Green Hydrogen Price');
LCOE.China.init(China.LCOE.Factor * LCOE.Australia.Future);
LCOE.China.plot('#00FF00','#77AC30');
LCOE.China.montecarlo_samples();
LCOE.China.plot_montecarlo();

LCOE.Brazil = variable(Brazil.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Brazil Green Hydrogen Price');
LCOE.Brazil.init(Brazil.LCOE.Factor * LCOE.Australia.Future);
LCOE.Brazil.plot('#00FF00','#77AC30');
LCOE.Brazil.montecarlo_samples();
LCOE.Brazil.plot_montecarlo();

LCOE.Belgium = variable(Belgium.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Belgium Green Hydrogen Price');
LCOE.Belgium.init(Belgium.LCOE.Factor * LCOE.Australia.Future);
LCOE.Belgium.plot('#00FF00','#77AC30');
LCOE.Belgium.montecarlo_samples();
LCOE.Belgium.plot_montecarlo();

LCOE.SaudiArabia = variable(SaudiArabia.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Saudi Arabia Green Hydrogen Price');
LCOE.SaudiArabia.init(SaudiArabia.LCOE.Factor * LCOE.Australia.Future);
LCOE.SaudiArabia.plot('#00FF00','#77AC30');
LCOE.SaudiArabia.montecarlo_samples();
LCOE.SaudiArabia.plot_montecarlo();

LCOE.Morocco = variable(Morocco.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Morocco Arabia Green Hydrogen Price');
LCOE.Morocco.init(Morocco.LCOE.Factor * LCOE.Australia.Future);
LCOE.Morocco.plot('#00FF00','#77AC30');
LCOE.Morocco.montecarlo_samples();
LCOE.Morocco.plot_montecarlo();

LCOE.Namibia = variable(Namibia.LCOE.Factor * LCOE.Australia.CurrentValue,LCOE.Australia.Uncertainity,0.0,'$AUD/kg','Cost ($AUD/kg)','Namibia Arabia Green Hydrogen Price');
LCOE.Namibia.init(Namibia.LCOE.Factor * LCOE.Australia.Future);
LCOE.Namibia.plot('#00FF00','#77AC30');
LCOE.Namibia.montecarlo_samples();
LCOE.Namibia.plot_montecarlo();

LCOE.Oceania = variable(0.0,0.0,0.0,'$AUD/tonne','Cost ($AUD/tonne)','Oceania Green Hydrogen Price');
LCOE.Oceania.mc_x = var_in.mc_x;
LCOE.Oceania.mc_r = 1000 * cost;
LCOE.Oceania.montecarlo_fit();
LCOE.Oceania.plot_montecarlo();

LCOE.Europe = variable(Europe.LCOE.Factor * LCOE.Oceania.CurrentValue,LCOE.Oceania.Uncertainity,0.0,'$AUD/tonne','Cost ($AUD/tonne)','Europe Green Hydrogen Price');
LCOE.Europe.init(Europe.LCOE.Factor * LCOE.Oceania.Future);
LCOE.Europe.plot('#00FF00','#77AC30');
LCOE.Europe.montecarlo_samples();
LCOE.Europe.plot_montecarlo();

LCOE.NorthAmerica = variable(NorthAmerica.LCOE.Factor * LCOE.Oceania.CurrentValue,LCOE.Oceania.Uncertainity,0.0,'$AUD/tonne','Cost ($AUD/tonne)','North America Green Hydrogen Price');
LCOE.NorthAmerica.init(NorthAmerica.LCOE.Factor * LCOE.Oceania.Future);
LCOE.NorthAmerica.plot('#00FF00','#77AC30');
LCOE.NorthAmerica.montecarlo_samples();
LCOE.NorthAmerica.plot_montecarlo();

LCOE.SouthAmerica = variable(SouthAmerica.LCOE.Factor * LCOE.Oceania.CurrentValue,LCOE.Oceania.Uncertainity,0.0,'$AUD/tonne','Cost ($AUD/tonne)','South America Green Hydrogen Price');
LCOE.SouthAmerica.init(SouthAmerica.LCOE.Factor * LCOE.Oceania.Future);
LCOE.SouthAmerica.plot('#00FF00','#77AC30');
LCOE.SouthAmerica.montecarlo_samples();
LCOE.SouthAmerica.plot_montecarlo();

LCOE.Asia = variable(Asia.LCOE.Factor * LCOE.Oceania.CurrentValue,LCOE.Oceania.Uncertainity,0.0,'$AUD/tonne','Cost ($AUD/tonne)','Asia Green Hydrogen Price');
LCOE.Asia.init(Asia.LCOE.Factor * LCOE.Oceania.Future);
LCOE.Asia.plot('#00FF00','#77AC30');
LCOE.Asia.montecarlo_samples();
LCOE.Asia.plot_montecarlo();

LCOE.Africa = variable(Africa.LCOE.Factor * LCOE.Oceania.CurrentValue,LCOE.Oceania.Uncertainity,0.0,'$AUD/tonne','Cost ($AUD/tonne)','Africa Green Hydrogen Price');
LCOE.Africa.init(Africa.LCOE.Factor * LCOE.Oceania.Future);
LCOE.Africa.plot('#00FF00','#77AC30');
LCOE.Africa.montecarlo_samples();
LCOE.Africa.plot_montecarlo();

%Save variables
filename = "results_production.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"LCOE");
%Close files
fclose('all');