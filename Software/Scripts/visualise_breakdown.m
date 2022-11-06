%Cost Breakdown Visualisation
%Robert Makepeace
%First written 18/09/2022
%Last updated 18/09/2022

function visualise_breakdown(x, y, x_cats, y_cats,desc,xlabel_desc)
    global Self
    if Self.run_graphics == 1
    
        fig = figure;
        barh(x,y,'stacked')
        yticklabels(x_cats)
        yticks(x);
        legend(y_cats,'Location','bestoutside')
        xlabel(xlabel_desc)
        ylabel('Transport Medium')
        title(strcat('Levelised Cost of Hydrogen (LCOH) - ',desc))
        fig.Position = [100 100 800 600];
        %Save figure
        filename = "breakdown_"+desc+".png";
        foldername = pwd + "\Graphs\";
        saveas(fig,fullfile(foldername, filename));
    end
end