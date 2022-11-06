v = 2;
for t = 1:14;  
    vehicleCosts = TransportCosts.Batch(v,t).Unit_Cost;
    fuelCosts = TransportCosts.Batch(v,t).UnitFuel_Cost(1);
    total(t) = 1000*(vehicleCosts + fuelCosts);
end