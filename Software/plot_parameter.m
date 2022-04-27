function plot_parameter(parameter, line_colour, shade_colour)

    close all;
    fig = figure;
    
    x = 2022:2022+parameter.Future_size-1;
    hold on
    area(x,parameter.Upper,'FaceColor',shade_colour,'LineStyle','--')
    area(x,parameter.Lower,'FaceColor','w','LineStyle','--')
    plot(x,parameter.Future,'Color',line_colour);
    hold off
    legend({'','Uncertainity Band','Estimated Parameter Value'})
    xlabel(parameter.xlabel)
    ylabel(parameter.ylabel)
    title(parameter.Name)
    grid on
    saveas(fig,parameter.Name+".png");
end   