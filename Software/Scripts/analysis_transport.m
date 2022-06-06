%Load Case Study Variables
filename = "constants_transport.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

close all;

Medium = Transport.Truck;
TransportCosts.Truck = calcs_transport(Medium,'Truck');

Medium = Transport.Ship;
TransportCosts.Ship = calcs_transport(Medium,'Ship');

Medium = Transport.Train;
TransportCosts.Train = calcs_transport(Medium,'Train');


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

filename = "constants_transport.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"Transport");

filename = "constants_transportcosts.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"TransportCosts");