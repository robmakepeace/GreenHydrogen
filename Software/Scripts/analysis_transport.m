%Green Hydrogen Transport Analysis 
%Robert Makepeace
%First written 30/05/2022
%Last updated 09/07/2022

%Load Case Study Variables
filename = "constants_transport.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Transport");

main_print("\nTransport Analysis",'a');

%Truck
Medium = Transport.Truck;
Medium_desc = 'Truck';
TransportCosts.Truck = calcs_transport(Medium,Medium_desc);
main_print(strcat(Medium_desc," Transport Unit Cost: $",string(TransportCosts.Truck.Unit_Cost),"/km*tGH2"),'a');

%Ship
Medium = Transport.Ship;
Medium_desc = 'Ship';
TransportCosts.Ship = calcs_transport(Medium,Medium_desc);
main_print(strcat(Medium_desc," Transport Unit Cost: $",string(TransportCosts.Ship.Unit_Cost),"/km*tGH2"),'a');

%Train
Medium = Transport.Train;
Medium_desc = 'Train';
TransportCosts.Train = calcs_transport(Medium,Medium_desc);
main_print(strcat(Medium_desc," Transport Unit Cost: $",string(TransportCosts.Train.Unit_Cost),"/km*tGH2"),'a');

%Pipeline
Medium = Transport.Pipeline;
Medium_desc = 'Pipeline';
%TransportCosts.Pipeline = calcs_transport(Medium,Medium_desc);
%main_print(strcat(Medium_desc," Transport Costs",string(TransportCosts.Pipeline.Unit_Cost),"/km*tGH2"),'a');

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