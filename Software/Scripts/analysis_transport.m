%Green Hydrogen Transport Analysis 
%Robert Makepeace
%First written 30/05/2022
%Last updated 09/07/2022

%Load Case Study Variables
filename = "constants_transport.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Transport");

%Truck
Medium = Transport.Truck;
TransportCosts.Truck = calcs_transport(Medium,'Truck',run_graphics);

%Ship
Medium = Transport.Ship;
TransportCosts.Ship = calcs_transport(Medium,'Ship',run_graphics);

%Train
Medium = Transport.Train;
TransportCosts.Train = calcs_transport(Medium,'Train',run_graphics);

%Pipeline
Medium = Transport.Pipeline;
%TransportCosts.Pipeline = calcs_transport(Medium,'Train',run_graphics);

%MonteCarlo Code
% N = 1000;
% for n = 1:N
%     a = 1 + 0.5*(rand()-0.5);
%     b = 1 + 0.5*(rand()-0.5);
%     c = 1 + 0.5*(rand()-0.5);
%     out(n) = calcs_transport(a,b,c);
% end
% min(out)
% max(out)
% mean(out)
% std(out)
% fig=figure;
% histfit(out,N/50);

%Save variables
filename = "results_transportcosts.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"TransportCosts");