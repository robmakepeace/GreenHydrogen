classdef variable < handle 
    properties
        CurrentValue = 1;
        Uncertainity = 0.1;
        Future_size = 29;
        Year = 2022;
        Growth = 1.0;
        xaxis = 0;
        Upper = 0;
        Future = 0;
        Lower = 0;
        Units = '$';
        xlabel = 'Year';
        ylabel = 'Cost ($)';
        Name = 'Template';
    end

    methods
        function obj = variable(CurrentValue,Uncertainity,Growth,Units,ylabel,Name)
            obj.CurrentValue = CurrentValue;
            obj.Uncertainity = Uncertainity;
            obj.Growth = Growth;
            obj.Units = Units;
            obj.ylabel = ylabel;
            obj.Name = Name;
            obj.xaxis = obj.Year:(obj.Year+obj.Future_size-1);
            obj.Upper = zeros(obj.Future_size,1);
            obj.Future = zeros(obj.Future_size,1);
            obj.Lower = zeros(obj.Future_size,1);
            obj.Future(1) = obj.CurrentValue;
        end
        function obj = init(obj, future)
            obj.Future(1) = obj.CurrentValue;
            obj.Lower(1) = obj.Future(1) * (1-obj.Uncertainity);
            obj.Upper(1) = obj.Future(1) * (1+obj.Uncertainity);
            for n = 2:obj.Future_size
                obj.Future(n) = future(n);
                obj.Lower(n) = obj.Future(n) * (1-obj.Uncertainity);
                obj.Upper(n) = obj.Future(n) * (1+obj.Uncertainity);
            end
        end
        function value = value_at_year(obj,year)
            index = find(obj.xaxis==year);
            value = obj.Future(index);
        end
        function plot(obj, line_colour, shade_colour)
            visualise_plot_parameter(obj, line_colour, shade_colour);
        end
    end
end