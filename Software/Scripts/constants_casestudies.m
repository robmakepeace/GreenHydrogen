CaseStudies.locations(1)={'Australia'};
CaseStudies.citylat(1) = -23;
CaseStudies.citylon(1) = 133;
CaseStudies.locations(2)={'Chile'};
CaseStudies.citylat(2) = -33;
CaseStudies.citylon(2) = -70;
CaseStudies.locations(3)={'Morocco'};
CaseStudies.citylat(3) = 32;
CaseStudies.citylon(3) = -8;
CaseStudies.locations(4)={'Namibia'};
CaseStudies.citylat(4) = -22;
CaseStudies.citylon(4) = 19;
CaseStudies.locations(5)={'Saudi Arabia'};
CaseStudies.citylat(5) = 22;
CaseStudies.citylon(5) = 39;
CaseStudies.locations(6)={'Japan'};
CaseStudies.citylat(6) = 35;
CaseStudies.citylon(6) = 139;
CaseStudies.locations(7)={'South Korea'};
CaseStudies.citylat(7) = 37;
CaseStudies.citylon(7) = 127;
CaseStudies.locations(8)={'Germany'};
CaseStudies.citylat(8) = 53;
CaseStudies.citylon(8) = 13;
CaseStudies.locations(9)={'Singapore'};
CaseStudies.citylat(9) = 1;
CaseStudies.citylon(9) = 104;
CaseStudies.locations(10)={'China'};
CaseStudies.citylat(10) = 40;
CaseStudies.citylon(10) = 116;
CaseStudies.locations(11)={'India'};
CaseStudies.citylat(11) = 29;
CaseStudies.citylon(11) = 77;
CaseStudies.locations(12)={'United States'};
CaseStudies.citylat(12) = 38;
CaseStudies.citylon(12) = -122;

CaseStudies.Routes = [1,6;1,7;1,9;2,12;1,8;3,8;4,8;5,8;5,10;5,11];

CaseStudies.NumberOfRoutes = 10;

CaseStudies.dist=zeros(CaseStudies.NumberOfRoutes,1);
for x = 1:CaseStudies.NumberOfRoutes
    CaseStudies.dist(x)=calcs_distance(CaseStudies.citylat(CaseStudies.Routes(x,1)),CaseStudies.citylon(CaseStudies.Routes(x,1)),CaseStudies.citylat(CaseStudies.Routes(x,2)),CaseStudies.citylon(CaseStudies.Routes(x,1)));
    disp(strcat(CaseStudies.locations(CaseStudies.Routes(x,1))," - ",CaseStudies.locations(CaseStudies.Routes(x,2)),": ",string(CaseStudies.dist(x))," km"))
end
CaseStudies.dist;

filename = "constants_casestudies.mat";
foldername = "C:\Users\robma\OneDrive\UTS\42908 Engineering Project Preparation\Github\GreenHydrogen\GreenHydrogen\Software\Variables\";
save(fullfile(foldername, filename),"CaseStudies");