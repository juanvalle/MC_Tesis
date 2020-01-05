N = 8;
AF = 0;
p = seq(0, pi, by = pi/1000);
beta = function(n) -1i*2*pi*(n-1)*(0.5)*cos(1.0);

for(n in c(1:N)){
  AF = exp(1i*2*pi*(n-1)*(0.5)*cos(p) + beta(n)) + AF
}

factor = abs(AF);
factor = factor / max(factor);
plot(p, 20*log10(factor), ylim = c(-40, 0), type = 'l')