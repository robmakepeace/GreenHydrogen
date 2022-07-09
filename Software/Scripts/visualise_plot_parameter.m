%Parameter Visualisation
%Robert Makepeace
%First written 18/04/2022
%Last updated 09/07/2022

function visualise_plot_parameter(parameter, line_colour, shade_colour)
    global Self
    if Self.run_graphics == 1
        %Setuo figure
        fig = figure;
        
        %Define x axis
        x = 2022:2022+parameter.Future_size-1;

        %Plot uncertainity regions and parameter values
        hold on
        area(x,parameter.Upper,'FaceColor',shade_colour,'LineStyle','--')
        area(x,parameter.Lower,'FaceColor','w','LineStyle','--')
        plot(x,parameter.Future,'Color',line_colour);
        hold off

        %Figure formatting
        legend({'','Uncertainity Band','Estimated Parameter Value'})
        xlabel(parameter.xlabel)
        ylabel(parameter.ylabel)
        title(parameter.Name)
        grid on

        %Save Figure
        filename = parameter.Name+".png";
        foldername = pwd + "\Graphs\";
        saveas(fig,fullfile(foldername, filename));
    end
end   