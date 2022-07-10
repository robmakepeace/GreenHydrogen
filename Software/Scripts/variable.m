%Variable Class Definition
%Robert Makepeace
%First written 09/07/2022
%Last updated 10/07/2022

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
        mc_mu = 0;
        mc_sigma = 1;
        mc_N=100;
        mc_x = 0; 
        mc_r = 0;
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

            obj.mc_mu = zeros(obj.Future_size,1);
            obj.mc_sigma =  zeros(obj.Future_size,1);
            obj.Future(1) = obj.CurrentValue;
        end
        function obj = init(obj, future)
            obj.Future(1) = obj.CurrentValue;
            obj.Lower(1) = obj.Future(1) * (1-obj.Uncertainity);
            obj.Upper(1) = obj.Future(1) * (1+obj.Uncertainity);
            obj.mc_mu(1) = obj.Future(1);
            obj.mc_sigma(1) = (obj.Future(1) * obj.Uncertainity)/2;
            for n = 2:obj.Future_size
                obj.Future(n) = future(n);
                obj.Lower(n) = obj.Future(n) * (1-obj.Uncertainity);
                obj.Upper(n) = obj.Future(n) * (1+obj.Uncertainity);
                obj.mc_mu(n) = obj.Future(n);
                obj.mc_sigma(n) = (obj.Future(n) * obj.Uncertainity)/2;
            end
        end
        %Print value for a year
        function value = value_at_year(obj,year)
            index = find(obj.xaxis==year);
            value = obj.Future(index);
        end
        %Generate one montecarlo sample
        function value = montecarlo_sample(obj,year)
            value = normrnd(obj.mc_mu(year-obj.Year+1), obj.mc_sigma(year-obj.Year+1));
        end
        %Generate full set of Monte Carlo samples
        function montecarlo_samples(obj)
            obj.mc_r = zeros(obj.Future_size*obj.mc_N,1);
            obj.mc_x = zeros(obj.Future_size*obj.mc_N,1);
            for year = 1:obj.Future_size
                for n=1:obj.mc_N
                    obj.mc_r((year-1)*obj.mc_N+n) = obj.montecarlo_sample(year+obj.Year-1);
                end
                obj.mc_x((year-1)*obj.mc_N+1:(year-1)*obj.mc_N+obj.mc_N) = zeros(1,obj.mc_N)+year+obj.Year-1;
            end
        end
        function montecarlo_fit(obj)
            obj.CurrentValue = median(obj.mc_r(1:obj.mc_N));
            obj.Future(1)= obj.CurrentValue;
            obj.Uncertainity = 2*std(obj.mc_r(1:obj.mc_N))/obj.CurrentValue;
            obj.Lower(1) = obj.Future(1) * (1-obj.Uncertainity);
            obj.Upper(1) = obj.Future(1) * (1+obj.Uncertainity);
            for year = 2:obj.Future_size
                obj.Future(year)= median(obj.mc_r((year-1)*obj.mc_N+1:(year-1)*obj.mc_N+obj.mc_N));
                obj.Uncertainity = 2*std(obj.mc_r((year-1)*obj.mc_N+1:(year-1)*obj.mc_N+obj.mc_N))/obj.Future(year);
                obj.Lower(year) = obj.Future(year) * (1-obj.Uncertainity);
                obj.Upper(year) = obj.Future(year) * (1+obj.Uncertainity);
            end
        end
        %Method to call basic parameter plotting function
        function plot(obj, line_colour, shade_colour)
            visualise_plot_parameter(obj, line_colour, shade_colour);
        end
        %Method to call Monte Carlo plotting function
        function plot_montecarlo(obj)
            visualise_montecarlo_parameter(obj,obj.mc_x,obj.mc_r,obj.mc_N);
        end        
    end
end