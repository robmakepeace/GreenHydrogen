%Green Hydrogen Case Studies Analysis Script
%Robert Makepeace
%First written 25/05/2022
%Last updated 09/07/2022

%Load Case Study Variables
filename = "constants_casestudies.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename),"CaseStudies");

main_print("\nCase Study Analysis",'a');

%Display Case Study Constants
CaseStudies;

%Placeholder costs
Production = 1.5;

%Calculcate costs for each route
for x = 1:CaseStudies.NumberOfRoutes
    CaseStudies.Cost(x) = Production + calcs_casestudy(CaseStudies.dist(x));
    main_print(strcat(CaseStudies.locations(CaseStudies.Routes(x,1))," - ",CaseStudies.locations(CaseStudies.Routes(x,2)),": $",string(CaseStudies.Cost(x)),"/tonne"),'a')
end

