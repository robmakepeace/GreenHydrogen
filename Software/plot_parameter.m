function plot_parameter(parameter)

    close all;
    fig = figure;
    
    x = 2022:2022+parameter.Future_size-1;
    hold on
    area(x,parameter.Upper,'FaceColor',[0.5 0.5 0.5],'LineStyle','--')
    area(x,parameter.Lower,'FaceColor','w','LineStyle','--')
    plot(x,parameter.Future,'Color','b');
    hold off
    legend({'','Uncertainity Band','Estimated Parameter Value'})
    xlabel(parameter.xlabel)
    ylabel(parameter.ylabel)
    title(parameter.Name)
    grid on
    saveas(fig,parameter.Name+".png");
end   