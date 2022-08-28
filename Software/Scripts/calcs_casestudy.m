%Case study calculcation distance to cost
%Robert Makepeace
%First written 27/05/2022
%Last updated 28/08/2022

function cost = calcs_casestudy(parameters)
    %Placeholder calcuclation to be developed further

    %Production Units: $/kg
    %variablecost Units: $/(kg*km)
    %distance Units: $/kg
    %Cost: $/kg
    cost = parameters.Production + parameters.variablecost * parameters.distance;
end