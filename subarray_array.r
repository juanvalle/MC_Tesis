AF = 0;
vect_p = c(2, 2, 2, 5, 5, 5, 8, 8, 8, 11, 11, 11, 14, 14, 14, 17, 17, 17, 20, 20, 20, 
          23, 23, 23, 26, 26, 26, 29, 29, 29, 32, 32, 32, 35, 35, 35);
#vect_p = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);

    
p = seq(-(pi/2), pi/2, by = pi/1000);
deg2rad = function(deg) deg * (pi/180);
theta = deg2rad(40);

beta = function(k) -2*pi*(0.5)*(k-1)*(sin(theta));

for(n in vect_p){
  AF = AF + (exp(1i*2*pi*(n-1)*(0.5)*sin(p)));#*exp(1i*beta(n));
}

fact = abs(AF);
fact2 = fact / max(fact);
plot(p, 20*log10(fact2), ylim = c(-30, 0), type = 'l')