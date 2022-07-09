%Green Hydrogen Regions Analysis Script
%Robert Makepeace
%First written 15/05/2022
%Last updated 09/07/2022

%Load Region Variables
filename = "constants_regions.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"Regions");

%Display Regions Constants
Regions

%Linear Programming

%Variables
%x11 Region 1 local production to Region 1
%x22 Region 2 local production to Region 2
%x33 Region 3 local production to Region 3
%x44 Region 4 local production to Region 4
%x55 Region 5 local production to Region 5
%x66 Region 6 local production to Region 6

%x12 Region 1 local production transported to Region 2
%x13 Region 1 local production transported to Region 3
%x14 Region 1 local production transported to Region 4
%x15 Region 1 local production transported to Region 5
%x16 Region 1 local production transported to Region 6

%x21 Region 2 local production transported to Region 1
%x23 Region 2 local production transported to Region 3
%x24 Region 2 local production transported to Region 4
%x25 Region 2 local production transported to Region 5
%x26 Region 2 local production transported to Region 6

%x31 Region 3 local production transported to Region 1
%x32 Region 3 local production transported to Region 2
%x34 Region 3 local production transported to Region 4
%x35 Region 3 local production transported to Region 5
%x36 Region 3 local production transported to Region 6

%x41 Region 4 local production transported to Region 1
%x42 Region 4 local production transported to Region 2
%x43 Region 4 local production transported to Region 3
%x45 Region 4 local production transported to Region 5
%x46 Region 4 local production transported to Region 6

%x51 Region 5 local production transported to Region 1
%x52 Region 5 local production transported to Region 2
%x53 Region 5 local production transported to Region 3
%x54 Region 5 local production transported to Region 4
%x56 Region 5 local production transported to Region 6

%x61 Region 6 local production transported to Region 1
%x62 Region 6 local production transported to Region 2
%x63 Region 6 local production transported to Region 3
%x64 Region 6 local production transported to Region 4
%x65 Region 6 local production transported to Region 5

%Define variables and ranges
x11 = optimvar('x11','LowerBound',0,'UpperBound',Regions.LocalMax);
x22 = optimvar('x22','LowerBound',0,'UpperBound',Regions.LocalMax);
x33 = optimvar('x33','LowerBound',0,'UpperBound',Regions.LocalMax);
x44 = optimvar('x44','LowerBound',0,'UpperBound',Regions.LocalMax);
x55 = optimvar('x55','LowerBound',0,'UpperBound',Regions.LocalMax);
x66 = optimvar('x66','LowerBound',0,'UpperBound',Regions.LocalMax);

x12 = optimvar('x12','LowerBound',0,'UpperBound',Regions.TransportMax);
x13 = optimvar('x13','LowerBound',0,'UpperBound',Regions.TransportMax);
x14 = optimvar('x14','LowerBound',0,'UpperBound',Regions.TransportMax);
x15 = optimvar('x15','LowerBound',0,'UpperBound',Regions.TransportMax);
x16 = optimvar('x16','LowerBound',0,'UpperBound',Regions.TransportMax);

x21 = optimvar('x21','LowerBound',0,'UpperBound',Regions.TransportMax);
x23 = optimvar('x23','LowerBound',0,'UpperBound',Regions.TransportMax);
x24 = optimvar('x24','LowerBound',0,'UpperBound',Regions.TransportMax);
x25 = optimvar('x25','LowerBound',0,'UpperBound',Regions.TransportMax);
x26 = optimvar('x26','LowerBound',0,'UpperBound',Regions.TransportMax);

x31 = optimvar('x31','LowerBound',0,'UpperBound',Regions.TransportMax);
x32 = optimvar('x32','LowerBound',0,'UpperBound',Regions.TransportMax);
x34 = optimvar('x34','LowerBound',0,'UpperBound',Regions.TransportMax);
x35 = optimvar('x35','LowerBound',0,'UpperBound',Regions.TransportMax);
x36 = optimvar('x36','LowerBound',0,'UpperBound',Regions.TransportMax);

x41 = optimvar('x41','LowerBound',0,'UpperBound',Regions.TransportMax);
x42 = optimvar('x42','LowerBound',0,'UpperBound',Regions.TransportMax);
x43 = optimvar('x43','LowerBound',0,'UpperBound',Regions.TransportMax);
x45 = optimvar('x45','LowerBound',0,'UpperBound',Regions.TransportMax);
x46 = optimvar('x46','LowerBound',0,'UpperBound',Regions.TransportMax);

x51 = optimvar('x51','LowerBound',0,'UpperBound',Regions.TransportMax);
x52 = optimvar('x52','LowerBound',0,'UpperBound',Regions.TransportMax);
x53 = optimvar('x53','LowerBound',0,'UpperBound',Regions.TransportMax);
x54 = optimvar('x54','LowerBound',0,'UpperBound',Regions.TransportMax);
x56 = optimvar('x56','LowerBound',0,'UpperBound',Regions.TransportMax);

x61 = optimvar('x61','LowerBound',0,'UpperBound',Regions.TransportMax);
x62 = optimvar('x62','LowerBound',0,'UpperBound',Regions.TransportMax);
x63 = optimvar('x63','LowerBound',0,'UpperBound',Regions.TransportMax);
x64 = optimvar('x64','LowerBound',0,'UpperBound',Regions.TransportMax);
x65 = optimvar('x65','LowerBound',0,'UpperBound',Regions.TransportMax);

%Define objective function minimise cost
cc = Regions.cost;
prob = optimproblem('Objective', ...
  cc(1,1)*x11 + cc(2,2)*x22 + cc(3,3)*x33 + cc(4,4)*x44 + cc(5,5)*x55 + cc(6,6)*x66 + ...
  cc(1,2)*x12 + cc(1,3)*x13 + cc(1,4)*x14 + cc(1,5)*x15 + cc(1,6)*x16 + ...
  cc(2,1)*x21 + cc(2,3)*x23 + cc(2,4)*x24 + cc(2,5)*x25 + cc(2,6)*x26 + ...
  cc(3,1)*x31 + cc(3,2)*x32 + cc(3,4)*x34 + cc(3,5)*x35 + cc(3,6)*x36 + ...
  cc(4,1)*x41 + cc(4,2)*x42 + cc(4,3)*x43 + cc(4,5)*x45 + cc(4,6)*x46 + ...
  cc(5,1)*x51 + cc(5,2)*x52 + cc(5,3)*x53 + cc(5,4)*x54 + cc(5,6)*x56 + ...
  cc(6,1)*x61 + cc(6,2)*x62 + cc(6,3)*x63 + cc(6,4)*x64 + cc(6,5)*x65 ...
  ,'ObjectiveSense','min');

%Region 1 production constraint
prob.Constraints.c1 = x11 + x12 + x13 + x14 + x15 + x16 <= Regions.Supply(1);
%Region 2 production constraint
prob.Constraints.c2 = x22 + x21 + x23 + x24 + x25 + x26 <= Regions.Supply(2);
%Region 3 production constraint
prob.Constraints.c3 = x33 + x31 + x32 + x34 + x35 + x36 <= Regions.Supply(3);
%Region 4 production constraint
prob.Constraints.c4 = x44 + x41 + x42 + x43 + x45 + x46 <= Regions.Supply(4);
%Region 5 production constraint
prob.Constraints.c5 = x55 + x51 + x52 + x53 + x54 + x56 <= Regions.Supply(5);
%Region 6 production constraint
prob.Constraints.c6 = x66 + x61 + x62 + x63 + x64 + x65 <= Regions.Supply(6);

%Region 1 demand constraint
prob.Constraints.c7 = x11 + x21 + x31 + x41 + x51 + x61 >= Regions.Demand(1);
%Region 2 demand constraint
prob.Constraints.c8 = x22 + x12 + x32 + x42 + x52 + x62 >= Regions.Demand(2);
%Region 3 demand constraint
prob.Constraints.c9 = x33 + x13 + x23 + x43 + x53 + x63 >= Regions.Demand(3);
%Region 4 demand constraint
prob.Constraints.c10 = x44 + x14 + x24 + x34 + x54 + x64 >= Regions.Demand(4);
%Region 5 demand constraint
prob.Constraints.c11 = x55 + x15 + x25 + x35 + x45 + x65 >= Regions.Demand(5);
%Region 6 demand constraint
prob.Constraints.c12 = x66 + x16 + x26 + x36 + x46 + x56 >= Regions.Demand(6);

%Solve linear programming problem
problem = prob2struct(prob);
[sol,fval,exitflag,output] = linprog(problem)
prob.Variables
prob.Objective
prob.Constraints

%Transpose into a matrix
Total = [sol(1:6)';sol(7:12)';sol(13:18)';sol(19:24)';sol(25:30)';sol(31:36)']

%Visualisation

%https://au.mathworks.com/matlabcentral/fileexchange/66746-alluvial-flow-diagram
%Reference: Alexander Carmeli (2022). Alluvial flow diagram (https://www.mathworks.com/matlabcentral/fileexchange/66746-alluvial-flow-diagram), MATLAB Central File Exchange. Retrieved May 25, 2022.
if ~exist('run_graphics',"var") || run_graphics == 1
    fig=figure
    graph_title = "Green Hydrogen World Region Flows (LHS Supply to RHS Demand)";
    alluvialflow(Total,Regions.locations,Regions.locations,graph_title)
    fig.WindowState = 'maximized';
    filename = "worldregions_alluvialflow.png";
    foldername = pwd + "\Graphs\";
    saveas(fig,fullfile(foldername, filename));
end