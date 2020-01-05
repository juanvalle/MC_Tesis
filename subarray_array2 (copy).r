remove(list = ls());
AF = 0;
vect_p = c(2, 2, 2, 5, 5, 5, 8, 8, 8, 11, 11, 11, 14, 14, 14, 17, 17, 17, 20, 20, 20, 
           23, 23, 23, 26, 26, 26, 29, 29, 29, 32, 32, 32, 35, 35, 35);

p = seq(-(pi/2), pi/2, by = pi/1800);
deg2rad = function(deg) deg * (pi/180);
theta = deg2rad(-18);

beta = function(k) -2*pi*(0.5)*(k-1)*(sin(theta));
PP = exp(1i*beta(vect_p));

for(n in c(1:36)){
  AF = AF + (exp(1i*2*pi*(n-1)*(0.5)*sin(p)) * PP[n]);
}

fact = abs(AF);
fact2 = fact / max(fact);
plot(p, 20*log10(fact2), ylim=c(-40, 0), type='l', xlab='radians', ylab = 'dB');
grid(34, 26)
maxlobe_index = which(round(p, digits=6) == round(theta, digits=6));

flag1 = FALSE;
flag2 = FALSE;

p1 = maxlobe_index - 10;
p2 = p1 - 1;

while(fact[p1] > fact[p2]){
  p1 = p2;
  p2 = p1 - 1;
  if(p2 == 0){
    p1 = 1791;
    p2 = p1 - 1;
    flag1 = TRUE;
  }
}

tmp1 = p1;

q1 = maxlobe_index + 10;
q2 = q1 + 1;

while(fact[q1] > fact[q2]){
  q1 = q2;
  q2 = q1 + 1;
  if(q2 == 1801){
    q1 = 10;
    q2 = q1 + 1;
    flag2 = TRUE;
  }
}
tmp2 = q1;

print(flag1, flag2)

if(flag1 || flag2){
  right_point = tmp1;
  left_point = tmp2;
  sll_left_index = which.max(fact[left_point:900]) + left_point;
  sll_right_index = which.max(fact[901:right_point]) + 900;
  
  bw = (abs(p[1]) - abs(p[left_point])) + (p[1801] - p[right_point]);
  sll = max(20*log10(fact2[sll_left_index]), 
            20*log10(fact2[sll_right_index]));
  
  lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
}else{ 
  right_point = tmp2;
  left_point = tmp1;
  sll_left_index = which.max(fact[1:left_point]);
  sll_right_index = which.max(fact[right_point:1801]) + right_point;
  
  bw = abs(p[right_point] - p[left_point]);
  sll = max(20*log10(fact2[sll_left_index]), 
            20*log10(fact2[sll_right_index]));
  
  lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
}

lines(theta*rep(1, 1801), 20*log10(fact2), col='brown');
lines(p, sll * rep(1, 1801), type="l", lty=2, col='orange');
remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
