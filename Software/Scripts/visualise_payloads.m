function visualise_payloads(Payloads,WeightPerLoad,EnergyPerLoad,Description)
    fig = figure;
    yyaxis left
    y1(:,1)=WeightPerLoad'; 
    y2(:,2)=EnergyPerLoad'; 
    y1(:,2)=nan;
    y2(:,1)=nan;   
    x=[1:size(WeightPerLoad,2)].';                       % use the serial index to plot against
    h=plotyy(x,y1,x,y2,@bar,@bar); % plot, save axes handles
    set(h(2),'xtick',[])           % turn off labels on RH x-axis; keep only one set
    %set(h(2),'ytick',[]) 
    set(h(1),'xticklabel',Payloads.Description) % tick labels on first...
    %b=bar(TruckEnergyPerLoad);
    %xticks(1:Transport.NumberOfPayloads);
    %xticklabels(Payloads.Description)
    
    ylabel('Weight of Energy Carrier Payload Per Vehicle (kg)')
    yyaxis right
    ymax=max(y2(:,2));
    yaxis = 0:ymax/10:ymax;
    yticks(yaxis);
    yticklabels(yaxis);
    xlabel('Energy Carrier')
    ylabel('Energy of Energy Carrier Payload Per Vehicle (MJ)')
    title(Description)
    fig.WindowState = 'maximized';
    %Save figure
    filename = Description + ".png";
    foldername = pwd + "\Graphs\";
    saveas(fig,fullfile(foldername, filename));
end