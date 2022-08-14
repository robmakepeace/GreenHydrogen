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
% main_print(strcat(Medium_desc," Transport Total Costs: ",string(TransportCosts.Truck.Total_Cost)," $AUD"),'a');
% main_print(strcat(Medium_desc," Transport Amount: ",string(TransportCosts.Truck.Total_Transport)," kgGH2"),'a');
% main_print(strcat(Medium_desc," Transport Unit Costs: ",string(TransportCosts.Truck.Unit_Cost)," $AUD/kgGH2"),'a');

%Ship
Medium = Transport.Ship;
Medium_desc = 'Ship';
% TransportCosts.Ship = calcs_transport(Medium,Medium_desc);
% main_print(strcat(Medium_desc," Transport Total Costs: ",string(TransportCosts.Ship.Total_Cost)," $AUD"),'a');
% main_print(strcat(Medium_desc," Transport Amount: ",string(TransportCosts.Ship.Total_Transport)," kgGH2"),'a');
% main_print(strcat(Medium_desc," Transport Unit Costs: ",string(TransportCosts.Ship.Unit_Cost)," $AUD/kgGH2"),'a');

%Train
Medium = Transport.Train;
Medium_desc = 'Train';
% TransportCosts.Train = calcs_transport(Medium,Medium_desc);
% main_print(strcat(Medium_desc," Transport Total Costs: ",string(TransportCosts.Train.Total_Cost)," $AUD"),'a');
% main_print(strcat(Medium_desc," Transport Amount: ",string(TransportCosts.Train.Total_Transport)," kgGH2"),'a');
% main_print(strcat(Medium_desc," Transport Unit Costs: ",string(TransportCosts.Train.Unit_Cost)," $AUD/kgGH2"),'a');

%New Pipeline (100% GH2)
Medium = Transport.Pipeline;
Medium.NaturalGasBlendProp = 1.0;
Medium_desc = 'New Pipeline 100%% GH2';
Distance = 1000;
TransportCosts.Pipeline = calcs_pipeline(Medium,Medium_desc,Distance);
main_print(strcat(Medium_desc," Transport Total Costs: ",string(TransportCosts.Pipeline.Total_Cost)," $AUD"),'a');
main_print(strcat(Medium_desc," Transport Amount: ",string(TransportCosts.Pipeline.Total_Transport)," kgGH2"),'a');
main_print(strcat(Medium_desc," Transport Unit Costs: ",string(TransportCosts.Pipeline.Unit_Cost)," $AUD/kgGH2"),'a');

%New Pipeline (20% GH2 80% NG)
Medium = Transport.Pipeline;
Medium.NaturalGasBlendProp = Transport.Pipeline.NaturalGasBlendProp;
Medium_desc = 'New Pipeline 20%% GH2 80%% NG';
Distance = 1000;
TransportCosts.Pipeline = calcs_pipeline(Medium,Medium_desc,Distance);
main_print(strcat(Medium_desc," Transport Total Costs: ",string(TransportCosts.Pipeline.Total_Cost)," $AUD"),'a');
main_print(strcat(Medium_desc," Transport Amount: ",string(TransportCosts.Pipeline.Total_Transport)," kgGH2"),'a');
main_print(strcat(Medium_desc," Transport Unit Costs: ",string(TransportCosts.Pipeline.Unit_Cost)," $AUD/kgGH2"),'a');

%New Pipeline (100% NG)
Medium = Transport.Pipeline;
Medium.NaturalGasBlendProp = 0.0;
Medium_desc = 'New Pipeline 100%% NG';
Distance = 1000;
TransportCosts.Pipeline = calcs_pipeline(Medium,Medium_desc,Distance);
main_print(strcat(Medium_desc," Transport Total Costs: ",string(TransportCosts.Pipeline.Total_Cost)," $AUD"),'a');
main_print(strcat(Medium_desc," Transport Amount: ",string(TransportCosts.Pipeline.Total_Transport)," kgGH2"),'a');
main_print(strcat(Medium_desc," Transport Unit Costs: ",string(TransportCosts.Pipeline.Unit_Cost)," $AUD/kgGH2"),'a');

%Save variables
filename = "results_transportcosts.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"TransportCosts");