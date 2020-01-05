remove(list = ls());
golden = c();
golden_sll = 0;

#cycle = c(1:100);
#for(k in cycle){
AF = 0;
sequence = c();
vect = c();
count_phase = 1;
PS = c(1:8);
deg2rad = function(deg) deg * (pi/180);

d = 0.5;

sequence = c(3, 3, 2, 2, 2, 2, 3, 3);

SIZE = 0;
for(q in sequence){
  SIZE = SIZE + q;
}

K2 = 6;
K3 = 6;

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

vect2 = vect;

p = seq(-(pi/2), pi/2, by = pi/1800);

theta = deg2rad(0);

vect3 = c(1:SIZE);
subelements = rep(1, SIZE);
tcount = 1;

for(b in sequence){
  subelements[tcount:(tcount+b-1)] = rep(b, b);
  tcount = tcount + b;
}

cos_taper = function(phasecenter) 0.5*(1 + 
              (cos(pi*((((phasecenter-1)/vect[SIZE])) - (3/2))))^2);
beta = function(k) -2*pi*d*k*(sin(theta));

PP = cos_taper(vect2)*exp(1i*beta(vect));

for(n in c(1:length(vect))){
  AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
}

fact = abs(AF);
my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
fact2 = fact / my.max(fact);

plot(p, 20*log10(fact2), ylim=c(-30, 0), type='l', 
     xlab=expression(paste("Angle of incidence ", theta, " (rad.)")), 
     ylab = 'dB', lty=1, col="black");

grid(34, 26);

max = 0;
for(i in c(1:length(p))) {
  if (fact[i] > max) {
    max = fact[i];
    maxlobe_index = i;
  }
}

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
  
  #lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  #lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
}else{ 
  right_point = tmp2;
  left_point = tmp1;
  sll_left_index = which.max(fact2[1:left_point]);
  sll_right_index = which.max(fact2[right_point:1799]) + right_point;
  
  bw = abs(p[right_point] - p[left_point]);
  sll = max(20*log10(fact2[sll_left_index]), 
            20*log10(fact2[sll_right_index]));
  
  #lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  #lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
}

#lines(theta*rep(1, 1801), 20*log10(fact2), type="l", lty=2, col='black');
lines(p, sll * rep(1, 1801), type="l", lty=2, col='blue');
remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
