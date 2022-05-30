%Load Case Study Variables
filename = "constants_casestudies.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
load(fullfile(foldername, filename));

CaseStudies;

Production = 1.5;

for x = 1:CaseStudies.NumberOfRoutes
    CaseStudies.Cost(x) = Production + calcs_casestudy(CaseStudies.dist(x));
    disp(strcat(CaseStudies.locations(CaseStudies.Routes(x,1))," - ",CaseStudies.locations(CaseStudies.Routes(x,2)),": $",string(CaseStudies.Cost(x)),"/tonne"))
end

