% %WORLD CASE STUDY AND REGIONS MAP Visualisation
% %Robert Makepeace
% %First written 07/05/2022
% %Last updated 09/07/2022
% 
% % if ~exist('Self.run_graphics',"var") || Self.run_graphics == 1  
% %     %Load case study variables
% %     filename = "constants_casestudies.mat";
% %     foldername = pwd + "\Variables\";
% %     load(fullfile(foldername, filename),"CaseStudies");
% % 
% %     %Load region variables
% %     filename = "constants_regions.mat";
% %     foldername = pwd + "\Variables\";
% %     load(fullfile(foldername, filename),"Regions");
% % 
% %     %Figure setup
% %     fig=figure;    
% %     wrld = worldmap("World");
% %     load coastlines;
% %     plotm(coastlat,coastlon);
% %     geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
% %     %setm(gca,'ffacecolor',[0.0 0.0 0.1]);
% %     
% %     %Define countries and status
% %     Importer = [0.4660, 0.6740, 0.1880];
% %     Exporter = [0.3010, 0.7450, 0.9330];
% %     
% %     bordersm('countries','k')
% %     bordersm('Australia','facecolor',Exporter)
% %     bordersm('Chile','facecolor',Exporter)
% %     bordersm('Morocco','facecolor',Exporter)
% %     bordersm('Namibia','facecolor',Exporter)
% %     bordersm('Saudi Arabia','facecolor',Exporter)
% %     bordersm('japan','facecolor',Importer)
% %     bordersm('Korea, Republic of','facecolor',Importer)
% %     bordersm('germany','facecolor',Importer)
% %     bordersm('Singapore','facecolor',Importer)
% %     bordersm('China','facecolor',Importer)
% %     bordersm('India','facecolor',Importer)
% %     bordersm('United States','facecolor',Importer)
% %     
% %     %Plot case study location markers
% %     plotm(CaseStudies.citylat,CaseStudies.citylon,"r*")
% %     
% %     %Plot routes between locations
% %     for i = 1:CaseStudies.NumberOfRoutes
% %         [gclat,gclon] = track2("gc",CaseStudies.citylat(CaseStudies.Routes(i,1)),CaseStudies.citylon(CaseStudies.Routes(i,1)),CaseStudies.citylat(CaseStudies.Routes(i,2)),CaseStudies.citylon(CaseStudies.Routes(i,2)));
% %         plotm(gclat,gclon,"r--")
% %     end
% %     
% %     %Figure formatting
% %     title('Green Hydrogen Case Study Routes')
% %     mlabel off; plabel off; gridm off
% % 
% %     %Save graph
% %     filename = "worldmap1.png";
% %     foldername = pwd + "\Graphs\";
% %     saveas(fig,fullfile(foldername, filename));
% %     
% %     % WORLD REGION MAP
% % 
% %     %Figure setup    
% %     fig=figure;
% %     wrld = worldmap("World");
% %     load coastlines;
% %     plotm(coastlat,coastlon);
% %     geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
% %     %setm(gca,'ffacecolor',[0.0 0.0 0.1])
% %     
% %     %Define region colours
% %     Europe = [0.2 0.2 0.8];
% %     Africa = [0.6 0.2 0.2];
% %     Asia = [0.6 0.6 0.2];
% %     NorthAmerica = [0.2 0.6 0.2];
% %     SouthAmerica = [0.6 0.2 0.6];
% %     Oceania = [0.2 0.6 0.6];
% %     bordersm('countries','k');
% %     
%     %Europe
     cou_nam1 = {'Albania','Andorra','Austria','Belarus','Belgium','Bosnia and Herzegovina','Bulgaria',...
         'Croatia','Cyprus','Czech Republic', 'Denmark', 'Estonia','Finland','France','Germany',...
         'Greece','Hungary','Iceland','Ireland','Italy','Latvia', 'Liechtenstein','Lithuania', 'Luxembourg',...
         'Malta','Republic of Moldova','Monaco','Montenegro','Netherlands','Norway','Poland', ...
         'Portugal','Romania','San Marino','Serbia','Slovenia', 'Slovakia','Spain','Sweden'...
         'Switzerland','Turkey','Ukraine','United Kingdom'};
     numRegions1 = length(cou_nam1);
%     %Plot countries in region
%     for i = 1:1:numRegions1
%         bordersm(cou_nam1{i},'facecolor',Europe) 
%     end
%     %Africa
     cou_nam2 = {'Algeria','Angola','Benin','Botswana','Burkina Faso','Burundi','Cape Verde',...
         'Cameroon','Central African Republic','Chad','Comoros','Congo',...
         'Democratic Republic of the Congo','Djibouti','Egypt','Equatorial Guinea','Eritrea',...
         'Swaziland','Ethiopia','Gabon','Gambia','Ghana','Guinea','Guinea-Bissau',...
         'Cote d''Ivoire','Kenya','Lesotho','Liberia','Libyan Arab Jamahiriya','Madagascar','Malawi','Mali',...
         'Mauritania','Mauritius','Morocco','Mozambique','Namibia','Niger','Nigeria','Rwanda',...
         'Sao Tome and Principe','Senegal','Seychelles','Sierra Leone','Somalia','South Africa',...
         'Sudan','United Republic of Tanzania','Togo','Tunisia','Uganda','Western Sahara','Zambia','Zimbabwe'};
     numRegions2 = length(cou_nam2);
%     %Plot countries in region
%     for i = 1:1:numRegions2
%         bordersm(cou_nam2{i},'facecolor',Africa) 
%     end
%     %Asia
     cou_nam3 = {
     'Afghanistan','Armenia','Azerbaijan','Bahrain','Bangladesh','Bhutan','British Indian Ocean Territory',...
     'Brunei Darussalam','Cambodia','China','Georgia','Hong Kong','India','Indonesia','Iran Islamic Republic of','Iraq','Israel','Japan',...
     'Jordan','Kazakhstan','Kuwait','Kyrgyzstan','Lao People''s Democratic Republic','Lebanon','Macau','Malaysia','Maldives','Mongolia',...
     'Burma','Nepal','Korea, Democratic People''s Republic of','Oman','Pakistan','Palestine','Philippines',...
     'Qatar','Russia','Saudi Arabia','Singapore','Korea, Republic of','Sri Lanka','Syrian Arab Republic','Taiwan',...
     'Tajikistan','Thailand','Timor-Leste','Turkmenistan','United Arab Emirates',...
     'Uzbekistan','Viet Nam','Yemen'};
     numRegions3 = length(cou_nam3);
%     %Plot countries in region
%     for i = 1:1:numRegions3
%         bordersm(cou_nam3{i},'facecolor',Asia) 
%     end
%     %North America
     cou_nam4 = {
     'Antigua and Barbuda','Bahamas','Barbados','Belize','Canada','Costa Rica','Cuba',...
     'Dominica','Dominican Republic','El Salvador','Greenland','Grenada','Guatemala','Haiti',...
     'Honduras','Jamaica','Mexico','Nicaragua','Panama','Saint Kitts and Nevis',...
     'Saint Lucia','Saint Vincent and the Grenadines','Trinidad and Tobago',...
     'United States'};
     numRegions4 = length(cou_nam4);
%     for i = 1:1:numRegions4
%         bordersm(cou_nam4{i},'facecolor',NorthAmerica) 
%     end
%     %South America
     cou_nam5 = {
     'Argentina','Bolivia','Brazil','Chile','Colombia','Ecuador',...
     'French Guiana','Guyana','Paraguay','Peru','Suriname','Uruguay','Venezuela'};
     numRegions5 = length(cou_nam5);
%     %Plot countries in region
%     for i = 1:1:numRegions5
%         bordersm(cou_nam5{i},'facecolor',SouthAmerica) 
%     end
%     %Oceania
     cou_nam6 = {
     'Antarctica','Australia','Fiji','Kiribati','Marshall Islands','Micronesia, Federated States of',...
     'Nauru','New Zealand','Palau','Papua New Guinea','Samoa','Solomon Islands','Tonga',...
     'Tuvalu','Vanuatu'};
     numRegions6 = length(cou_nam6);
%     %Plot countries in region
%     for i = 1:1:numRegions6
%         bordersm(cou_nam6{i},'facecolor',Oceania) 
%     end
% % 
% %     
% %     %Plot routes between locations
% %     plotm(Regions.citylat,Regions.citylon,"r*")
% %     for x = 1:Regions.NumberOfRegions
% %         for y = 1:Regions.NumberOfRegions
% %             [gclat2,gclon2] = track2("rh",Regions.citylat(x),Regions.citylon(x),Regions.citylat(y),Regions.citylon(y));
% %             plotm(gclat2,gclon2,"r--")
% %         end
% %     end
% % 
% %     %Figure Formatting
% %     title('Green Hydrogen World Regions')    
% %     mlabel off; plabel off; gridm off
% %     
% %     %Save figure
% %     filename = "worldmap2.png";
% %     foldername = pwd + "\Graphs\";
% %     saveas(fig,fullfile(foldername, filename));
% %     
%     %Figure setup    
%     fig=figure;
%     wrld = worldmap("World");
%     load coastlines;
%     plotm(coastlat,coastlon);
%     geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
%     %setm(gca,'ffacecolor',[0.0 0.0 0.1])
%     
%     %Define region colours   
%     Demand = [19.77586799,	7.783995952,	25.246445,	29.41215737,	4.44648255, 1.335051144];
%     %Demand = [64.49629673,	25.38644134,	82.33783766,	95.92374051,	14.5015965, 4.354087255];
%     maxDemand = 100;%max(Demand);
%     Demand = Demand ./maxDemand;
% 
%     DarkGreen = [0 0.2 0];
%     Green = [0 1 0];
%     
%     for x = 1:20
%         map(x,:) = DarkGreen + (Green - DarkGreen) .* (x/20);
%     end
%     colormap(map)
% 
%     Europe = DarkGreen + (Green - DarkGreen) .* Demand(1);
%     Africa = DarkGreen + (Green - DarkGreen) .* Demand(2);
%     Asia = DarkGreen + (Green - DarkGreen) .* Demand(3);
%     NorthAmerica = DarkGreen + (Green - DarkGreen) .* Demand(4);
%     SouthAmerica = DarkGreen + (Green - DarkGreen) .* Demand(5);
%     Oceania = DarkGreen + (Green - DarkGreen) .* Demand(6);
%     bordersm('countries','k');
% 
%     for i = 1:1:numRegions1
%         bordersm(cou_nam1{i},'facecolor',Europe) 
%     end
%     for i = 1:1:numRegions2
%         bordersm(cou_nam2{i},'facecolor',Africa) 
%     end
%     for i = 1:1:numRegions3
%         bordersm(cou_nam3{i},'facecolor',Asia) 
%     end
%     for i = 1:1:numRegions4
%         bordersm(cou_nam4{i},'facecolor',NorthAmerica) 
%     end
%     for i = 1:1:numRegions5
%         bordersm(cou_nam5{i},'facecolor',SouthAmerica) 
%     end
%     for i = 1:1:numRegions6
%         bordersm(cou_nam6{i},'facecolor',Oceania) 
%     end
% %Figure Formatting
%      title('Green Hydrogen World Region Demand 2030')    
%      mlabel off; plabel off; gridm off
%      
%      
%      ticks = 0:1/4:1
%      ticksLabels = 0:maxDemand/4:maxDemand
%      c = colorbar('Ticks',ticks,'TickLabels',ticksLabels);
%      c.Label.String = 'Green Hydrogen Demand (Mt)';
% 
% %Save figure
%      filename = "worldmap3.png";
%      foldername = pwd + "\Graphs\";
%      saveas(fig,fullfile(foldername, filename));
% 
% 
% 
%     %Figure setup    
%     fig=figure;
%     wrld = worldmap("World");
%     load coastlines;
%     plotm(coastlat,coastlon);
%     geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
%     %setm(gca,'ffacecolor',[0.0 0.0 0.1])
%     
%     %Define region colours   
%     Supply = [39.55173597,	155.679919,	50.49288999,	58.82431474,	88.92965099, 26.70102289];
%     %Supply = [128.9925935,	507.7288269, 164.6756753,	191.847481,	290.0319299, 87.0817451];
% 
%     maxSupply = 600;%max(Supply);
%     Supply = Supply ./maxSupply;
% 
%     DarkGreen = [0 0.2 0];
%     Green = [0 1 0];
%     
%     for x = 1:20
%         map(x,:) = DarkGreen + (Green - DarkGreen) .* (x/20);
%     end
%     colormap(map)
% 
%     Europe = DarkGreen + (Green - DarkGreen) .* Supply(1);
%     Africa = DarkGreen + (Green - DarkGreen) .* Supply(2);
%     Asia = DarkGreen + (Green - DarkGreen) .* Supply(3);
%     NorthAmerica = DarkGreen + (Green - DarkGreen) .* Supply(4);
%     SouthAmerica = DarkGreen + (Green - DarkGreen) .* Supply(5);
%     Oceania = DarkGreen + (Green - DarkGreen) .* Supply(6);
%     bordersm('countries','k');
% 
%     for i = 1:1:numRegions1
%         bordersm(cou_nam1{i},'facecolor',Europe) 
%     end
%     for i = 1:1:numRegions2
%         bordersm(cou_nam2{i},'facecolor',Africa) 
%     end
%     for i = 1:1:numRegions3
%         bordersm(cou_nam3{i},'facecolor',Asia) 
%     end
%     for i = 1:1:numRegions4
%         bordersm(cou_nam4{i},'facecolor',NorthAmerica) 
%     end
%     for i = 1:1:numRegions5
%         bordersm(cou_nam5{i},'facecolor',SouthAmerica) 
%     end
%     for i = 1:1:numRegions6
%         bordersm(cou_nam6{i},'facecolor',Oceania) 
%     end
% %Figure Formatting
%      title('Green Hydrogen World Region Supply 2030')    
%      mlabel off; plabel off; gridm off
%      
%      
%      ticks = 0:1/4:1
%      ticksLabels = 0:maxSupply/4:maxSupply
%      c = colorbar('Ticks',ticks,'TickLabels',ticksLabels);
%      c.Label.String = 'Green Hydrogen Supply (Mt)';
% 
% %Save figure
%      filename = "worldmap4.png";
%      foldername = pwd + "\Graphs\";
%      saveas(fig,fullfile(foldername, filename));
% 
% %end

%     %Load case study variables
%     filename = "constants_casestudies.mat";
%     foldername = pwd + "\Variables\";
%     load(fullfile(foldername, filename),"CaseStudies");
% 
%     %Load region variables
%     filename = "constants_regions.mat";
%     foldername = pwd + "\Variables\";
%     load(fullfile(foldername, filename),"Regions");
% 
% 
%     %Figure setup
%     fig=figure;    
%     wrld = worldmap("World");
%     load coastlines;
%     plotm(coastlat,coastlon);
%     geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
%     %setm(gca,'ffacecolor',[0.0 0.0 0.1]);
%     
%     Green = [0 0.2 0];
%     DarkGreen = [0 1 0];
%     
%     for x = 1:20
%         map(x,:) = DarkGreen + (Green - DarkGreen) .* (x/20);
%     end
% 
%     Price = [1 0.978 1.48 1.48 0.92 3.82 2.57 2.18 3.82 1.33 1.33 0.85];
%     Price = Price .* 2.0;%2030
%     %Price = Price .* 1.5;%2050    
%     maxPrice = 8; round(max(Price));
%     Price = round(256.* Price ./maxPrice);
%     thismap = colormap("jet")
%     Australia = thismap(Price(1),:);
%     Chile = thismap(Price(2),:);
%     Morocco = thismap(Price(3),:);
%     Namibia = thismap(Price(4),:);
%     SaudiArabia = thismap(Price(5),:);
%     Japan = thismap(Price(6),:);
%     Korea = thismap(Price(7),:);
%     Germany = thismap(Price(8),:);
%     Singapore = thismap(Price(9),:);
%     China = thismap(Price(10),:);
%     India = thismap(Price(11),:);
%     USA = thismap(Price(12),:);
% 
% %     Australia = DarkGreen + (Green - DarkGreen) .* Price(1);
% %     Chile = DarkGreen + (Green - DarkGreen) .* Price(2);
% %     Morocco = DarkGreen + (Green - DarkGreen) .* Price(3);
% %     Namibia = DarkGreen + (Green - DarkGreen) .* Price(4);
% %     SaudiArabia = DarkGreen + (Green - DarkGreen) .* Price(5);
% %     Japan = DarkGreen + (Green - DarkGreen) .* Price(6);
% %     Korea = DarkGreen + (Green - DarkGreen) .* Price(7);
% %     Germany = DarkGreen + (Green - DarkGreen) .* Price(8);
% %     Singapore = DarkGreen + (Green - DarkGreen) .* Price(9);
% %     China = DarkGreen + (Green - DarkGreen) .* Price(10);
% %     India = DarkGreen + (Green - DarkGreen) .* Price(11);
% %     USA = DarkGreen + (Green - DarkGreen) .* Price(12);
% 
%     %Define countries and status
%     Importer = [0.4660, 0.6740, 0.1880];
%     Exporter = [0.3010, 0.7450, 0.9330];
%     
%     bordersm('countries','k')
%     bordersm('Australia','facecolor',Australia)
%     bordersm('Chile','facecolor',Chile)
%     bordersm('Morocco','facecolor',Morocco)
%     bordersm('Namibia','facecolor',Namibia)
%     bordersm('Saudi Arabia','facecolor',SaudiArabia)
%     bordersm('japan','facecolor',Japan)
%     bordersm('Korea, Republic of','facecolor',Korea)
%     bordersm('germany','facecolor',Germany)
%     bordersm('Singapore','facecolor',Singapore)
%     bordersm('China','facecolor',China)
%     bordersm('India','facecolor',India)
%     bordersm('United States','facecolor',USA)
%     
%     %Plot case study location markers
%     plotm(CaseStudies.citylat,CaseStudies.citylon,"r*")
%     
%     %Plot routes between locations
%     for i = 1:CaseStudies.NumberOfRoutes
%         [gclat,gclon] = track2("gc",CaseStudies.citylat(CaseStudies.Routes(i,1)),CaseStudies.citylon(CaseStudies.Routes(i,1)),CaseStudies.citylat(CaseStudies.Routes(i,2)),CaseStudies.citylon(CaseStudies.Routes(i,2)));
%         plotm(gclat,gclon,"r--")
%     end
%     
%     %Figure formatting
%     title('Green Hydrogen Case Study Routes - Green Hydrogen Price 2030')
%     mlabel off; plabel off; gridm off
% 
%      ticks = 0:1/4:1
%      ticksLabels = 0:maxPrice/4:maxPrice
%      c = colorbar('Ticks',ticks,'TickLabels',ticksLabels);
%      c.Label.String = 'Green Hydrogen Price ($/kg)';
% 
%     %Save graph
%     filename = "worldmap5_2030.png";
%     foldername = pwd + "\Graphs\";
%     saveas(fig,fullfile(foldername, filename));

%Figure setup    
    fig=figure;
    wrld = worldmap("World");
    load coastlines;
    plotm(coastlat,coastlon);
    geoshow('landareas.shp', 'FaceColor', [0.9 0.9 0.9]);
    %setm(gca,'ffacecolor',[0.0 0.0 0.1])
    
    DarkGreen = [0 0.2 0];
    Green = [0 1 0];
    
    Price = [2.18 1.48 2.57 0.85 0.978 1.0];
    %Price = Price .* 2.0;%2030
    Price = Price .* 1.5;%2050    
    maxPrice = 6; round(max(Price));
    Price = round(256.* Price ./maxPrice);
    thismap = colormap("jet");

    Europe = thismap(Price(1),:);
    Africa = thismap(Price(2),:);
    Asia = thismap(Price(3),:);
    NorthAmerica = thismap(Price(4),:);
    SouthAmerica = thismap(Price(5),:);
    Oceania = thismap(Price(6),:);
    bordersm('countries','k');

    for i = 1:1:numRegions1
        bordersm(cou_nam1{i},'facecolor',Europe) 
    end
    for i = 1:1:numRegions2
        bordersm(cou_nam2{i},'facecolor',Africa) 
    end
    for i = 1:1:numRegions3
        bordersm(cou_nam3{i},'facecolor',Asia) 
    end
    for i = 1:1:numRegions4
        bordersm(cou_nam4{i},'facecolor',NorthAmerica) 
    end
    for i = 1:1:numRegions5
        bordersm(cou_nam5{i},'facecolor',SouthAmerica) 
    end
    for i = 1:1:numRegions6
        bordersm(cou_nam6{i},'facecolor',Oceania) 
    end
%Figure Formatting
     title('Green Hydrogen World Region Price 2050')    
     mlabel off; plabel off; gridm off
          
     ticks = 0:1/4:1
     ticksLabels = 0:maxPrice/4:maxPrice
     c = colorbar('Ticks',ticks,'TickLabels',ticksLabels);
     c.Label.String = 'Green Hydrogen Price ($/kg)';

%Save figure
     filename = "worldmap6_2050.png";
     foldername = pwd + "\Graphs\";
     saveas(fig,fullfile(foldername, filename));

    