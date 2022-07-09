%Parameter Visualisation
%Robert Makepeace
%First written 18/04/2022
%Last updated 09/07/2022

function visualise_montecarlo_parameter(var,x,r,N)
    fig=figure;

    %Generate Colour Heat Map
    c = zeros(var.Future_size*N,1);
    var_median = zeros(var.Future_size,1);
    for year = 1:var.Future_size
        [h_values,h_edges] = histcounts(r((year-1)*N+1:(year-1)*N+N));
        Y = discretize(r((year-1)*N+1:(year-1)*N+N),h_edges);
        for n=1:N
            c((year-1)*N+n,1) = h_values(Y(n))/N;
        end
        var_median(year) = median(r((year-1)*N+1:(year-1)*N+N));
    end

    %Generate scatter plot (year vs value, colour is distrubution density)
    hold on
    scatter(x,r,10,c,'filled') 
    colorbar
    colormap('default')
    
    %Plot variable information over the top
    plot(var.xaxis,var_median)
    plot(var.xaxis,var.Future)
    plot(var.xaxis,var.Lower)
    plot(var.xaxis,var.Upper)
    hold off

    %Figure Formatting
    xlabel(var.xlabel)
    ylabel(var.ylabel)
    title(var.Name)
    legend('Monte Carlo point','Projected Value','Monte Carlo Median','Upper Bound (2sigma)','Lower Bound (2sigma)')
    
    %Save Figure
    filename = "Monte Carlo_"+var.Name+".png";
    foldername = pwd + "\Graphs\";
    saveas(fig,fullfile(foldername, filename));
end