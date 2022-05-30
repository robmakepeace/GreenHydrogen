function monte_carlo(variables)
N = 1000;
variables
for n = 1:N
    a = 1 + 0.5*(rand()-0.5);
    b = 1 + 0.5*(rand()-0.5);
    c = 1 + 0.5*(rand()-0.5);
    out(n) = a * b * c;
end
min(out)
max(out)
mean(out)
std(out)
fig=figure;
histfit(out,N/50);

