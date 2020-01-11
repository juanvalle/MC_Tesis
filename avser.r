remove(list = ls());
golden = c();
golden_sll = 0;

#cycle = c(1:100);
#for(k in cycle){

AF = 0;
sequence = c();
vect = c();
count_phase = 1;
PS = c(1:5);
deg2rad = function(deg) deg * (pi/180);

d = 0.5;

sequence = c(2, 3, 4, 2, 3);

SIZE = 0;
for(q in sequence){
  SIZE = SIZE + q;
}

K2 = 6;
K3 = 6;

# for(i in sequence){
#   vect = c(vect, rep(count_phase, i));
#   if(count_phase >= SIZE){
#     break;
#   } else {
#       if((i != 2) & (i != 4)){
#         count_phase = count_phase + i;
#       } else if(i == 2){
#         count_phase = ((2*(count_phase + i)) - 1)/2;
#       }
#     }
# }

distance = 0;
totd = 0;
vect = rep(0, 0);
count1 = 1;
for(a in sequence){
  if(a == 1){
    if(count1 == 1){
      distance = 0;
      totdist = (d/2);
    } else{
      distance = totdist + d;
      totdist = totdist + d;
    }
  } else if(a == 2){
    if(count1 == 1){
      distance = (d/2);
      totdist = d;
    } else{
      distance = totdist + d + (d/2);
      totdist = totdist + (2*d);
    }
  } else if(a == 3){
    if(count1 == 1){
      distance = d;
      totdist = 2*d;
    } else{
      distance = totdist + (2*d);
      totdist = totdist + (3*d);
    }
  } else if(a == 4){
    if(count1 == 1){
      distance = d + (d/2);
      totdist = (3*d);
    } else{
      distance = totdist + (2*d) + (d/2)
      totdist = totdist + (4*d);
    }
  } 
  count1 = count1 + 1;
  vect = c(vect, rep((distance*2), a));
}

#vect = c(1, 1, 1, 4, 4, 4, 7, 7, 7, 10, 10, 10, 12.5, 12.5, 14.5, 14.5, 
#         16.5, 16.5, 18.5, 18.5, 21, 21, 21, 23.5, 23.5, 25.5, 25.5, 
#         28, 28, 28);

vect2 = vect;

#plot(vect)
#lines(vect);
#lines(0:SIZE, col='red');

p = seq(-(pi/2), pi/2, by = pi/1800);

theta = deg2rad(0); # angulo de escaneo

vect3 = c(1:SIZE);
subelements = rep(1, SIZE);
tcount = 1;

for(b in sequence){
  subelements[tcount:(tcount+b-1)] = rep(b, b);
  tcount = tcount + b;
}

cos_taper = function(phasecenter) 0.5*(1 + (cos(pi*((((phasecenter-1)/vect[SIZE])) - (3/2))))^2);
beta = function(k) -2*pi*d*k*(sin(theta));

plot(cos_taper(vect2), ylim=c(0.4, 1), xlab="Elementos de Antena", 
     ylab = 'Amplitud', lty=1, col="black", cex.lab=1.8, cex.axis=1.5);
lines(cos_taper(vect2), lwd=1.5);

grid();

#rpvect = c(0.00000000, 0.09817477, 0.19634954, 0.29452431, 0.39269908, 0.49087385, 0.58904862, 0.68722339, 
#           0.78539816, 0.88357293, 0.98174770, 1.07992247, 1.17809725, 1.27627202, 1.37444679, 1.47262156, 
#           1.57079633, 1.66897110, 1.76714587, 1.86532064, 1.96349541, 2.06167018, 2.15984495, 2.25801972, 
#           2.35619449, 2.45436926, 2.55254403, 2.65071880, 2.74889357, 2.84706834, 2.94524311, 3.04341788, 
#           3.14159265, 3.23976742, 3.33794219, 3.43611696, 3.53429174, 3.63246651, 3.73064128, 3.82881605, 
#           3.92699082, 4.02516559, 4.12334036, 4.22151513, 4.31968990, 4.41786467, 4.51603944, 4.61421421, 
#           4.71238898, 4.81056375, 4.90873852, 5.00691329, 5.10508806, 5.20326283, 5.30143760,5.39961237, 
#           5.49778714, 5.59596191, 5.69413668, 5.79231146, 5.89048623, 5.98866100, 6.08683577, 6.18501054) * -1;

plot(realphasevector, xlab = "Elementos de antena", ylab = "Ángulo de fase (rad.)", 
     pch=1, ylim=c(-6, 0));
lines(realphasevector, cex=1.5, lty= 2);

points(realphasevector2, pch=1, col="red")
lines(realphasevector2, cex=1.5, lty = 2, col="red")
grid();

points(realphasevector3, pch=1, col="blue")
lines(realphasevector3, cex=1.5, lty = 2, col="blue")
grid();

points(realphasevector4, pch=1, col="green")
lines(realphasevector4, cex=1.5, lty = 2, col="green")
grid();

PP = exp(1i*beta(vect));

for(n in c(1:length(vect))){
  AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
}

fact = abs(AF);
my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
fact2 = fact / my.max(fact);

plot(p, 20*log10(fact2), ylim=c(-30, 0), type='l', xlab=expression(paste("Ángulo de incidencia ", theta, " (rad.)")), 
     ylab = 'dBi', lty=1, col="darkgreen", cex.lab=1.5, cex.axis=1.3);

grid(34, 26);

max = 0;
for(i in c(1:length(p))) {
  if (fact[i] > max) {
    max = fact[i];
    maxlobe_index = i;
  }
}

#maxlobe_index = which(round(p, digits=6) == round(theta, digits=6));

flag1 = FALSE;
flag2 = FALSE;

p1 = maxlobe_index - 1;
p2 = p1 - 1;

while(fact2[p1] > fact2[p2]){
  p1 = p2;
  p2 = p1 - 1;
  if(p2 == 0){
    p1 = 1791;
    p2 = p1 - 1;
    flag1 = TRUE;
  }
}

tmp1 = p1;

q1 = maxlobe_index + 1;
q2 = q1 + 1;

while(fact2[q1] > fact2[q2]){
  q1 = q2;
  q2 = q1 + 1;
  if(q2 == 1801){
    q1 = 10;
    q2 = q1 + 1;
    flag2 = TRUE;
  }
}
tmp2 = q1;

if(flag1 || flag2){
  right_point = tmp1;
  left_point = tmp2;
  sll_left_index = which.max(fact2[left_point:900]) + left_point;
  sll_right_index = which.max(fact2[901:right_point]) + 900;
  
  bw = (abs(p[1]) - abs(p[left_point])) + (p[1801] - p[right_point]);
  sll = max(20*log10(fact2[sll_left_index]), 
            20*log10(fact2[sll_right_index]));
  
  lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
}else{ 
  right_point = tmp2;
  left_point = tmp1;
  sll_left_index = which.max(fact2[1:left_point]);
  sll_right_index = which.max(fact2[right_point:1799]) + right_point;
  
  bw = abs(p[right_point] - p[left_point]);
  sll = max(20*log10(fact2[sll_left_index]), 
            20*log10(fact2[sll_right_index]));
  
  lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
}

#lines(theta*rep(1, 1801), 20*log10(fact2), type="l", lty=2, col='black');
lines(p, sll * rep(1, 1801), type="l", lty=2, col='darkgreen');
remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
