%Green Hydrogen Transport Analysis 
%Robert Makepeace
%First written 30/05/2022
%Last updated 15/08/2022

%Load Case Study Variables
filename = "constants_transport.mat";
foldername = pwd + "\Variables\";
load(fullfile(foldername, filename));

main_print("\nTransport Analysis",'a');

%Excute loop for each medium (Truck, Ship, Train)
for m = 1:Transport.NumberOfMediums
    %Excute loop for each payload
    for p = 1:Transport.NumberOfPayloads
        %Load up payload properties
        Payload.WeightDensity = Payloads.WeightDensity(p);
        Payload.EnergyDensity = Payloads.EnergyDensity(p);
        Payload.VolumeEnergyDensity = Payloads.VolumeEnergyDensity(p);
        Payload.Type = Payloads.Type(p);
        Payload.MM = Payloads.MM(p);
        Payload.H2Prop = Payloads.H2Prop(p);
        %Calculcate transport costs
        TransportCosts.Batch(m,p)= calcs_transport(Medium.Medium(m), Payload, Medium.Description(m));
        %Print Results
        main_print(strcat(Medium.Description(m)," ",Payloads.Description(p)," Transport Total Costs: ",string(TransportCosts.Batch(m,p).Total_Cost)," $AUD"),'a');
        main_print(strcat(Medium.Description(m)," ",Payloads.Description(p)," Transport Amount: ",string(TransportCosts.Batch(m,p).Total_Transport)," kgGH2"),'a');
        main_print(strcat(Medium.Description(m)," ",Payloads.Description(p)," Transport Unit Costs: ",string(TransportCosts.Batch(m,p).Unit_Cost)," $AUD/kgGH2"),'a');
    end
end

%New Pipeline (100% GH2)
Pipeline = Transport.Pipeline;
Pipeline.NaturalGasBlendProp = 1.0;
Pipeline_desc = 'New Pipeline 100%% GH2';
Distance = 1;
TransportCosts.Pipe(1) = calcs_pipeline(Pipeline,Pipeline_desc,Distance);
main_print(strcat(Pipeline_desc," Transport Total Costs: ",string(TransportCosts.Pipe(1).Total_Cost)," $AUD"),'a');
main_print(strcat(Pipeline_desc," Transport Amount: ",string(TransportCosts.Pipe(1).Total_Transport)," kgGH2"),'a');
main_print(strcat(Pipeline_desc," Transport Unit Costs: ",string(TransportCosts.Pipe(1).Unit_Cost)," $AUD/kgGH2"),'a');

%New Pipeline (20% GH2 80% NG)
Pipeline = Transport.Pipeline;
Pipeline.NaturalGasBlendProp = Transport.Pipeline.NaturalGasBlendProp;
Pipeline_desc = 'New Pipeline 20%% GH2 80%% NG';
Distance = 1;
TransportCosts.Pipe(2) = calcs_pipeline(Pipeline,Pipeline_desc,Distance);
main_print(strcat(Pipeline_desc," Transport Total Costs: ",string(TransportCosts.Pipe(2).Total_Cost)," $AUD"),'a');
main_print(strcat(Pipeline_desc," Transport Amount: ",string(TransportCosts.Pipe(2).Total_Transport)," kgGH2"),'a');
main_print(strcat(Pipeline_desc," Transport Unit Costs: ",string(TransportCosts.Pipe(2).Unit_Cost)," $AUD/kgGH2"),'a');

%New Pipeline (100% NG)
Pipeline = Transport.Pipeline;
Pipeline.NaturalGasBlendProp = 0.0;
Pipeline_desc = 'New Pipeline 100%% NG';
Distance = 1;
TransportCosts.Pipe(3) = calcs_pipeline(Pipeline,Pipeline_desc,Distance);
main_print(strcat(Pipeline_desc," Transport Total Costs: ",string(TransportCosts.Pipe(3).Total_Cost)," $AUD"),'a');
main_print(strcat(Pipeline_desc," Transport Amount: ",string(TransportCosts.Pipe(3).Total_Transport)," kgGH2 * km"),'a');
main_print(strcat(Pipeline_desc," Transport Unit Costs: ",string(TransportCosts.Pipe(3).Unit_Cost)," $AUD/(kgGH2*km)"),'a');

TruckEnergyPerLoad = zeros(1,Transport.NumberOfPayloads);
ShipEnergyPerLoad = zeros(1,Transport.NumberOfPayloads);
TrainEnergyPerLoad = zeros(1,Transport.NumberOfPayloads);
TruckWeightPerLoad = zeros(1,Transport.NumberOfPayloads);
ShipWeightPerLoad = zeros(1,Transport.NumberOfPayloads);
TrainWeightPerLoad = zeros(1,Transport.NumberOfPayloads);
for x=1:Transport.NumberOfPayloads
    TruckEnergyPerLoad(x) = TransportCosts.Batch(1,x).EnergyPerLoad;
    ShipEnergyPerLoad(x) = TransportCosts.Batch(2,x).EnergyPerLoad;
    TrainEnergyPerLoad(x) = TransportCosts.Batch(3,x).EnergyPerLoad;
    TruckWeightPerLoad(x) = TransportCosts.Batch(1,x).ActualWeight;
    ShipWeightPerLoad(x) = TransportCosts.Batch(2,x).ActualWeight;
    TrainWeightPerLoad(x) = TransportCosts.Batch(3,x).ActualWeight;
end
visualise_payloads(Payloads,TruckWeightPerLoad,TruckEnergyPerLoad,'Comparison of Energy Carriers - Truck - Energy Per Vehicle')
visualise_payloads(Payloads,ShipWeightPerLoad,ShipEnergyPerLoad,'Comparison of Energy Carriers - Ship - Energy Per Vehicle')
visualise_payloads(Payloads,TrainWeightPerLoad,TrainEnergyPerLoad,'Comparison of Energy Carriers - Train - Energy Per Vehicle')

TransportCosts.Payloads_Description = Payloads.Description;
TransportCosts.Medium_Description = Medium.Description;
TransportCosts.Fuel_Description(1) = {'Diesel'};
TransportCosts.Fuel_Description(2) = {'Hydrogen'};
TransportCosts.Fuel_Description(3) = {'Ammonia'};

%Save variables
filename = "results_transportcosts.mat";
foldername = pwd + "\Variables\";
save(fullfile(foldername, filename),"TransportCosts");
fclose('all');