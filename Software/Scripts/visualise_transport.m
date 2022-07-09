%Transport Costs Visualisation
%Robert Makepeace
%First written 06/06/2022
%Last updated 09/07/2022

function visualise_transport(y, Description)  
    global Self
    if Self.run_graphics == 1
        % Define groups 
        grouplabels = categorical({'Fuel Weight (kg/km)','Fuel Volume (L/km)','Fuel C02 Emission (kg/km)'});
        grouplabels = reordercats(grouplabels ,{'Fuel Weight (kg/km)','Fuel Volume (L/km)','Fuel C02 Emission (kg/km)'});
        
        %Define Fuels
        serieslabels = categorical({'Diesel','Green Hydrogen','Green Ammonia'});
    
        %Figure setup
        fig = figure;
        b = bar(grouplabels,y);
        mytitle = strcat('Transport Fuel Parameters: ',Description);
        title(mytitle)
        xlabel('Category')
        ylabel({'Unit Fuel Weight (kg/km)';'Unit Fuel Volume (L/km)'; 'Unit Fuel CO2 Emissions (kg/km)'})
        legend(serieslabels)
        %fig.WindowState = 'maximized';
        fig.Position = [100 100 800 600];

        %Add number labels
        for x = 1:3
            xtips1 = b(x).XEndPoints;
            ytips1 = b(x).YEndPoints;
            labels1 = string(round(b(x).YData,2));
            text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
            'VerticalAlignment','bottom')
        end
    
        %Save figure
        filename = "transport_" + Description +".png";
        foldername = pwd + "\Graphs\";
        saveas(fig,fullfile(foldername, filename));
    end
end