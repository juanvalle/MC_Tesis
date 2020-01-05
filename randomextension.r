 PP = cos_taper(vect2)*exp(1i*realphasevector2);
  
  #PHASE = c(2.45436926, 2.45436926, 2.45436926, 2.45436926, 0.58904862, 2.45436926,
  #          5.69413668, 5.69413668, 5.69413668, 2.84706834, 5.39961237, 5.39961237,
  #          4.02516559, 4.02516559, 4.02516559, 4.02516559, 2.45436926, 4.02516559,
  #          5.69413668, 4.02516559, 4.02516559, 4.02516559, 4.02516559) * -1
  
  #PP = cos_taper(vect2)*exp(1i*PHASE);
  
  #PP = cos_taper(vect2)*exp(1i*beta(vect));
  
  #PP = exp(1i*realphasevector);
  #PP = exp(1i*beta(vect));
  
  #wavevector = beta(vect);
  #wavevector = wavevector %% (2*pi);
  
  #PP = exp(1i*wavevector);
  
  for(n in c(1:length(vect))){
    AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
  }
  
  fact = abs(AF);
  my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
  fact2 = fact / my.max(fact);
  #fact2 <- read.csv("af.csv", header = FALSE, check.names=FALSE);
  #fact2 = as.numeric(fact2);
  lines(p, 20*log10(fact2), ylim=c(-30, 0), type='l', xlab=expression(paste("Angle of incidence ", theta, " (rad.)")), 
       ylab = 'dB', lty=2, col="red");
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
  
  lines(p, sll * rep(1, 1801), type="l", lty=2, col='red');
  remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
  
  
  
  
  
  
  
  
  PP = cos_taper(vect2)*exp(1i*realphasevector3);
  
  #PHASE = c(2.45436926, 2.45436926, 2.45436926, 2.45436926, 0.58904862, 2.45436926,
  #          5.69413668, 5.69413668, 5.69413668, 2.84706834, 5.39961237, 5.39961237,
  #          4.02516559, 4.02516559, 4.02516559, 4.02516559, 2.45436926, 4.02516559,
  #          5.69413668, 4.02516559, 4.02516559, 4.02516559, 4.02516559) * -1
  
  #PP = cos_taper(vect2)*exp(1i*PHASE);
  
  #PP = cos_taper(vect2)*exp(1i*beta(vect));
  
  #PP = exp(1i*realphasevector);
  #PP = exp(1i*beta(vect));
  
  #wavevector = beta(vect);
  #wavevector = wavevector %% (2*pi);
  
  #PP = exp(1i*wavevector);
  
  for(n in c(1:length(vect))){
    AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
  }
  
  fact = abs(AF);
  my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
  fact2 = fact / my.max(fact);
  #fact2 <- read.csv("af.csv", header = FALSE, check.names=FALSE);
  #fact2 = as.numeric(fact2);
  lines(p, 20*log10(fact2), ylim=c(-30, 0), type='l', xlab=expression(paste("Angle of incidence ", theta, " (rad.)")), 
        ylab = 'dB', lty=3, col="goldenrod2");
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
  
  
  lines(p, sll * rep(1, 1801), type="l", lty=2, col='goldenrod2');
  remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
  
  
  
  
  
  
  
  
  
  PP = cos_taper(vect2)*exp(1i*realphasevector4);
  
  #PHASE = c(2.45436926, 2.45436926, 2.45436926, 2.45436926, 0.58904862, 2.45436926,
  #          5.69413668, 5.69413668, 5.69413668, 2.84706834, 5.39961237, 5.39961237,
  #          4.02516559, 4.02516559, 4.02516559, 4.02516559, 2.45436926, 4.02516559,
  #          5.69413668, 4.02516559, 4.02516559, 4.02516559, 4.02516559) * -1
  
  #PP = cos_taper(vect2)*exp(1i*PHASE);
  
  #PP = cos_taper(vect2)*exp(1i*beta(vect));
  
  #PP = exp(1i*realphasevector);
  #PP = exp(1i*beta(vect));
  
  #wavevector = beta(vect);
  #wavevector = wavevector %% (2*pi);
  
  #PP = exp(1i*wavevector);
  
  for(n in c(1:length(vect))){
    AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
  }
  
  fact = abs(AF);
  my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
  fact2 = fact / my.max(fact);
  #fact2 <- read.csv("af.csv", header = FALSE, check.names=FALSE);
  #fact2 = as.numeric(fact2);
  lines(p, 20*log10(fact2), ylim=c(-30, 0), type='l', xlab=expression(paste("Angle of incidence ", theta, " (rad.)")), 
        ylab = 'dB', lty=4, col="forestgreen");
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
  
  
  lines(p, sll * rep(1, 1801), type="l", lty=2, col='forestgreen');
  remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
  
  
  
  #if(sll < golden_sll){
  #  golden = sequence;
  #  golden_sll = sll;
  #  plot(p, 20*log10(fact2), ylim=c(-30, 0), type='l', xlab='radians', ylab = 'dB');
  #  grid(34, 26)
  #  lines(p, sll * rep(1, 1801), type="l", lty=2, col='orange')
  #}
#}

  # AF = 0;
  # sequence = c();
  # vect = c();
  # count_phase = 1;
  # PS = c(1:12);
  # deg2rad = function(deg) deg * (pi/180);
  # 
  # d = 0.5;
  # 
  # #sequence = c(2, 3, 3, 2, 1, 2, 2, 1, 1, 3, 1, 3);
  # #sequence = c(3, 3, 3, 3, 2, 2, 2, 2, 3, 2, 2, 3);
  # #sequence = c(4, 3, 4, 3, 2, 3, 2, 3, 2, 4, 2, 4);
  # #sequence = c(4, 4, 3, 2, 3, 3, 2, 2, 3, 4, 2, 4);
  # sequence = c(2, 2, 1, 1, 1, 2, 2, 2, 1, 3, 2, 4);
  # 
  # SIZE = 0;
  # for(q in sequence){
  #   SIZE = SIZE + q;
  # }
  # 
  # K2 = 6;
  # K3 = 6;
  # 
  # #for(j in PS){
  # #  rand = sample(2:3, 1);
  # #  if(rand == 2 && K2 == 0){ rand = 3; }
  # #  else if(rand == 3 && K3 == 0){ rand = 2; }
  # 
  # #  sequence = c(rand, sequence);
  # 
  # #  if(rand == 2){ K2 = K2 - 1; }
  # #  else if(rand == 3){ K3 = K3 - 1; }
  # 
  # #}
  # 
  # #sequence = c(3, 3, 3, 3, 2, 2, 2, 2, 3, 2, 2, 3);
  # #sequence = c(2, 2, 2, 3, 2, 2, 3, 3, 2, 3, 3, 3);
  # 
  # # for(i in sequence){
  # #   vect = c(vect, rep(count_phase, i));
  # #   if(count_phase >= SIZE){
  # #     break;
  # #   } else {
  # #       if((i != 2) & (i != 4)){
  # #         count_phase = count_phase + i;
  # #       } else if(i == 2){
  # #         count_phase = ((2*(count_phase + i)) - 1)/2;
  # #       }
  # #     }
  # # }
  # 
  # distance = 0;
  # totd = 0;
  # vect = rep(0, 0);
  # count1 = 1;
  # for(a in sequence){
  #   if(a == 1){
  #     if(count1 == 1){
  #       distance = 0;
  #       totdist = (d/2);
  #     } else{
  #       distance = totdist + d;
  #       totdist = totdist + d;
  #     }
  #   } else if(a == 2){
  #     if(count1 == 1){
  #       distance = (d/2);
  #       totdist = d;
  #     } else{
  #       distance = totdist + d + (d/2);
  #       totdist = totdist + (2*d);
  #     }
  #   } else if(a == 3){
  #     if(count1 == 1){
  #       distance = d;
  #       totdist = 2*d;
  #     } else{
  #       distance = totdist + (2*d);
  #       totdist = totdist + (3*d);
  #     }
  #   } else if(a == 4){
  #     if(count1 == 1){
  #       distance = d + (d/2);
  #       totdist = (3*d);
  #     } else{
  #       distance = totdist + (2*d) + (d/2)
  #       totdist = totdist + (4*d);
  #     }
  #   } 
  #   count1 = count1 + 1;
  #   vect = c(vect, rep((distance*2), a));
  # }
  # 
  # #vect = c(1, 1, 1, 4, 4, 4, 7, 7, 7, 10, 10, 10, 12.5, 12.5, 14.5, 14.5, 
  # #         16.5, 16.5, 18.5, 18.5, 21, 21, 21, 23.5, 23.5, 25.5, 25.5, 
  # #         28, 28, 28);
  # 
  # vect2 = vect;
  # 
  # #plot(vect)
  # #lines(vect);
  # #lines(0:SIZE, col='red');
  # 
  # p = seq(-(pi/2), pi/2, by = pi/1800);
  # 
  # theta = deg2rad(12.3);
  # 
  # vect3 = c(1:SIZE);
  # subelements = rep(1, SIZE);
  # tcount = 1;
  # 
  # for(b in sequence){
  #   subelements[tcount:(tcount+b-1)] = rep(b, b);
  #   tcount = tcount + b;
  # }
  # 
  # cos_taper = function(phasecenter) 0.5*(1 + (cos((pi/0.25)*((((phasecenter-1)/vect[SIZE])/4) - ((1 - 0.25)/2))))^2);
  # beta = function(k) -2*pi*d*k*(sin(theta));
  # 
  # #plot(cos_taper(vect2));
  # #lines(cos_taper(vect2));
  # 
  # #realphasevector = c(0.060232911978082185, 0.060232911978082185, 0.060232911978082185, -1.5660560728276813, -1.5660560728276813, -1.5660560728276813, -3.1923450576334447, -3.1923450576334447, -3.1923450576334447, -4.818634042439207, -4.818634042439207, -4.818634042439207, -6.173874863110678, -6.173874863110678, -7.258067519647853, -7.258067519647853, -8.342260176185029, -8.342260176185029, -9.426452832722205, -9.426452832722205, -10.781693653393674, -10.781693653393674, -10.781693653393674, -12.136934474065145, -12.136934474065145, -13.221127130602321, -13.221127130602321, -14.576367951273792, -14.576367951273792, -14.576367951273792);
  # #realphasevector = c(-0.5420963282685878, -0.5420963282685878, -0.5420963282685878, -2.168385313074351, -2.168385313074351, -2.168385313074351, -3.7946742978801145, -3.7946742978801145, -3.7946742978801145, -5.420963282685878, -5.420963282685878, -5.420963282685878, -6.7762041033573475, -6.7762041033573475, -7.860396759894524, -7.860396759894524, -8.9445894164317, -8.9445894164317, -10.028782072968875, -10.028782072968875, -11.384022893640346, -11.384022893640346, -11.384022893640346, -12.739263714311816, -12.739263714311816, -13.82345637084899, -13.82345637084899, -15.178697191520461, -15.178697191520461, -15.178697191520461)
  # #realphasevector = c(-0.6076684026461445, -0.6076684026461445, -0.6076684026461445, -2.2606251043843186, -2.2606251043843186, -2.2606251043843186, -3.8611675832482786, -3.8611675832482786, -3.8611675832482786, -5.565646573431529, -5.565646573431529, -5.565646573431529, -7.138379564550066, -7.138379564550066, -8.139434257343499, -8.139434257343499, -9.169829318412681, -9.169829318412681, -10.501172203980028, -10.501172203980028, -11.676597532876572, -11.676597532876572, -11.676597532876572, -13.266302380960532, -13.266302380960532, -14.838440503823774, -14.838440503823774, -15.367330077110253, -15.367330077110253, -15.367330077110253);
  # #realphasevector = c(-0.46798340544867584, -0.46798340544867584, -0.46798340544867584, -2.021140555391407, -2.021140555391407, -2.021140555391407, -3.1621958448171243, -3.1621958448171243, -3.1621958448171243, -4.958722900680525, -4.958722900680525, -4.958722900680525, -5.854029424821523, -5.854029424821523, -6.716754592491893, -6.716754592491893, -7.697628688076359, -7.697628688076359, -8.574465245219319, -8.574465245219319, -9.114300494857027, -9.114300494857027, -9.114300494857027, -10.69847851042346, -10.69847851042346, -11.793869241114441, -11.793869241114441, -13.06782996715448, -13.06782996715448, -13.06782996715448);
  # #realphasevector = c(-0.5268758374520399, -0.5268758374520399, -0.5268758374520399, -1.8934209763317547, -1.8934209763317547, -1.8934209763317547, -3.0229322969749006, -3.0229322969749006, -3.0229322969749006, -5.0319836200662325, -5.0319836200662325, -5.0319836200662325, -6.24506644531185, -6.24506644531185, -7.18501513389052, -7.18501513389052, -8.466744355683652, -8.466744355683652, -9.370233856654803, -9.370233856654803, -11.111775584921672, -11.111775584921672, -11.111775584921672, -12.163870620784554, -12.163870620784554, -13.45251147068442, -13.45251147068442, -15.177384992459011, -15.177384992459011, -15.177384992459011);
  # 
  # 
  # #PP = cos_taper(vect2)*exp(1i*realphasevector);
  # PP = cos_taper(vect2)*exp(1i*beta(vect));
  # 
  # #wavevector = beta(vect);
  # #wavevector = wavevector %% (2*pi);
  # 
  # #PP = exp(1i*wavevector);
  # 
  # for(n in c(1:length(vect))){
  #   AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
  # }
  # 
  # fact = abs(AF);
  # my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
  # fact2 = fact / my.max(fact);
  # #fact2 <- read.csv("af.csv", header = FALSE, check.names=FALSE);
  # #fact2 = as.numeric(fact2);
  # lines(p, 20*log10(fact2), ylim=c(-30, 0), type='l', lty=1);
  # grid(34, 26);
  # 
  # max = 0;
  # for(i in c(1:length(p))) {
  #   if (fact[i] > max) {
  #     max = fact[i];
  #     maxlobe_index = i;
  #   }
  # }
  # 
  # #maxlobe_index = which(round(p, digits=6) == round(theta, digits=6));
  # 
  # flag1 = FALSE;
  # flag2 = FALSE;
  # 
  # p1 = maxlobe_index - 1;
  # p2 = p1 - 1;
  # 
  # while(fact2[p1] > fact2[p2]){
  #   p1 = p2;
  #   p2 = p1 - 1;
  #   if(p2 == 0){
  #     p1 = 1791;
  #     p2 = p1 - 1;
  #     flag1 = TRUE;
  #   }
  # }
  # 
  # tmp1 = p1;
  # 
  # q1 = maxlobe_index + 1;
  # q2 = q1 + 1;
  # 
  # while(fact2[q1] > fact2[q2]){
  #   q1 = q2;
  #   q2 = q1 + 1;
  #   if(q2 == 1801){
  #     q1 = 10;
  #     q2 = q1 + 1;
  #     flag2 = TRUE;
  #   }
  # }
  # tmp2 = q1;
  # 
  # if(flag1 || flag2){
  #   right_point = tmp1;
  #   left_point = tmp2;
  #   sll_left_index = which.max(fact2[left_point:900]) + left_point;
  #   sll_right_index = which.max(fact2[901:right_point]) + 900;
  #   
  #   bw2 = (abs(p[1]) - abs(p[left_point])) + (p[1801] - p[right_point]);
  #   sll2 = max(20*log10(fact2[sll_left_index]), 
  #             20*log10(fact2[sll_right_index]));
  #   
  #   #lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  #   #lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
  # }else{ 
  #   right_point = tmp2;
  #   left_point = tmp1;
  #   sll_left_index = which.max(fact2[1:left_point]);
  #   sll_right_index = which.max(fact2[right_point:1801]) + right_point;
  #   
  #   bw2 = abs(p[right_point] - p[left_point]);
  #   sll2 = max(20*log10(fact2[sll_left_index]), 
  #             20*log10(fact2[sll_right_index]));
  #   
  #   #lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  #   #lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
  # }
  # 
  # #lines(theta*rep(1, 1801), 20*log10(fact2), col='blue');
  # #lines(p, sll * rep(1, 1801), type="l", lty=2, col='orange');
  # remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
  # 
  # ####
  # ####
  # ####
  # ####
  # 
  # AF = 0;
  # sequence = c();
  # vect = c();
  # count_phase = 1;
  # PS = c(1:12);
  # deg2rad = function(deg) deg * (pi/180);
  # 
  # d = 0.5;
  # 
  # #sequence = c(2, 3, 3, 2, 1, 2, 2, 1, 1, 3, 1, 3);
  # #sequence = c(3, 3, 3, 3, 2, 2, 2, 2, 3, 2, 2, 3);
  # #sequence = c(4, 3, 4, 3, 2, 3, 2, 3, 2, 4, 2, 4);
  # #sequence = c(2, 3, 3, 2, 3, 2, 4, 3, 2, 2, 2, 3);
  # sequence = c(2, 2, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2);
  # 
  # SIZE = 0;
  # for(q in sequence){
  #   SIZE = SIZE + q;
  # }
  # 
  # K2 = 6;
  # K3 = 6;
  # 
  # #for(j in PS){
  # #  rand = sample(2:3, 1);
  # #  if(rand == 2 && K2 == 0){ rand = 3; }
  # #  else if(rand == 3 && K3 == 0){ rand = 2; }
  # 
  # #  sequence = c(rand, sequence);
  # 
  # #  if(rand == 2){ K2 = K2 - 1; }
  # #  else if(rand == 3){ K3 = K3 - 1; }
  # 
  # #}
  # 
  # #sequence = c(3, 3, 3, 3, 2, 2, 2, 2, 3, 2, 2, 3);
  # #sequence = c(2, 2, 2, 3, 2, 2, 3, 3, 2, 3, 3, 3);
  # 
  # # for(i in sequence){
  # #   vect = c(vect, rep(count_phase, i));
  # #   if(count_phase >= SIZE){
  # #     break;
  # #   } else {
  # #       if((i != 2) & (i != 4)){
  # #         count_phase = count_phase + i;
  # #       } else if(i == 2){
  # #         count_phase = ((2*(count_phase + i)) - 1)/2;
  # #       }
  # #     }
  # # }
  # 
  # distance = 0;
  # totd = 0;
  # vect = rep(0, 0);
  # count1 = 1;
  # for(a in sequence){
  #   if(a == 1){
  #     if(count1 == 1){
  #       distance = 0;
  #       totdist = (d/2);
  #     } else{
  #       distance = totdist + d;
  #       totdist = totdist + d;
  #     }
  #   } else if(a == 2){
  #     if(count1 == 1){
  #       distance = (d/2);
  #       totdist = d;
  #     } else{
  #       distance = totdist + d + (d/2);
  #       totdist = totdist + (2*d);
  #     }
  #   } else if(a == 3){
  #     if(count1 == 1){
  #       distance = d;
  #       totdist = 2*d;
  #     } else{
  #       distance = totdist + (2*d);
  #       totdist = totdist + (3*d);
  #     }
  #   } else if(a == 4){
  #     if(count1 == 1){
  #       distance = d + (d/2);
  #       totdist = (3*d);
  #     } else{
  #       distance = totdist + (2*d) + (d/2)
  #       totdist = totdist + (4*d);
  #     }
  #   } 
  #   count1 = count1 + 1;
  #   vect = c(vect, rep((distance*2), a));
  # }
  # 
  # #vect = c(1, 1, 1, 4, 4, 4, 7, 7, 7, 10, 10, 10, 12.5, 12.5, 14.5, 14.5, 
  # #         16.5, 16.5, 18.5, 18.5, 21, 21, 21, 23.5, 23.5, 25.5, 25.5, 
  # #         28, 28, 28);
  # 
  # vect2 = vect;
  # 
  # #plot(vect)
  # #lines(vect);
  # #lines(0:SIZE, col='red');
  # 
  # p = seq(-(pi/2), pi/2, by = pi/1800);
  # 
  # theta = deg2rad(12.3);
  # 
  # vect3 = c(1:SIZE);
  # subelements = rep(1, SIZE);
  # tcount = 1;
  # 
  # for(b in sequence){
  #   subelements[tcount:(tcount+b-1)] = rep(b, b);
  #   tcount = tcount + b;
  # }
  # 
  # cos_taper = function(phasecenter) 0.5*(1 + (cos((pi/0.25)*((((phasecenter-1)/vect[SIZE])/4) - ((1 - 0.25)/2))))^2);
  # beta = function(k) -2*pi*d*k*(sin(theta));
  # 
  # #plot(cos_taper(vect2));
  # #lines(cos_taper(vect2));
  # 
  # #realphasevector = c(0.060232911978082185, 0.060232911978082185, 0.060232911978082185, -1.5660560728276813, -1.5660560728276813, -1.5660560728276813, -3.1923450576334447, -3.1923450576334447, -3.1923450576334447, -4.818634042439207, -4.818634042439207, -4.818634042439207, -6.173874863110678, -6.173874863110678, -7.258067519647853, -7.258067519647853, -8.342260176185029, -8.342260176185029, -9.426452832722205, -9.426452832722205, -10.781693653393674, -10.781693653393674, -10.781693653393674, -12.136934474065145, -12.136934474065145, -13.221127130602321, -13.221127130602321, -14.576367951273792, -14.576367951273792, -14.576367951273792);
  # #realphasevector = c(-0.5420963282685878, -0.5420963282685878, -0.5420963282685878, -2.168385313074351, -2.168385313074351, -2.168385313074351, -3.7946742978801145, -3.7946742978801145, -3.7946742978801145, -5.420963282685878, -5.420963282685878, -5.420963282685878, -6.7762041033573475, -6.7762041033573475, -7.860396759894524, -7.860396759894524, -8.9445894164317, -8.9445894164317, -10.028782072968875, -10.028782072968875, -11.384022893640346, -11.384022893640346, -11.384022893640346, -12.739263714311816, -12.739263714311816, -13.82345637084899, -13.82345637084899, -15.178697191520461, -15.178697191520461, -15.178697191520461)
  # #realphasevector = c(-0.6076684026461445, -0.6076684026461445, -0.6076684026461445, -2.2606251043843186, -2.2606251043843186, -2.2606251043843186, -3.8611675832482786, -3.8611675832482786, -3.8611675832482786, -5.565646573431529, -5.565646573431529, -5.565646573431529, -7.138379564550066, -7.138379564550066, -8.139434257343499, -8.139434257343499, -9.169829318412681, -9.169829318412681, -10.501172203980028, -10.501172203980028, -11.676597532876572, -11.676597532876572, -11.676597532876572, -13.266302380960532, -13.266302380960532, -14.838440503823774, -14.838440503823774, -15.367330077110253, -15.367330077110253, -15.367330077110253);
  # #realphasevector = c(-0.46798340544867584, -0.46798340544867584, -0.46798340544867584, -2.021140555391407, -2.021140555391407, -2.021140555391407, -3.1621958448171243, -3.1621958448171243, -3.1621958448171243, -4.958722900680525, -4.958722900680525, -4.958722900680525, -5.854029424821523, -5.854029424821523, -6.716754592491893, -6.716754592491893, -7.697628688076359, -7.697628688076359, -8.574465245219319, -8.574465245219319, -9.114300494857027, -9.114300494857027, -9.114300494857027, -10.69847851042346, -10.69847851042346, -11.793869241114441, -11.793869241114441, -13.06782996715448, -13.06782996715448, -13.06782996715448);
  # #realphasevector = c(-0.5268758374520399, -0.5268758374520399, -0.5268758374520399, -1.8934209763317547, -1.8934209763317547, -1.8934209763317547, -3.0229322969749006, -3.0229322969749006, -3.0229322969749006, -5.0319836200662325, -5.0319836200662325, -5.0319836200662325, -6.24506644531185, -6.24506644531185, -7.18501513389052, -7.18501513389052, -8.466744355683652, -8.466744355683652, -9.370233856654803, -9.370233856654803, -11.111775584921672, -11.111775584921672, -11.111775584921672, -12.163870620784554, -12.163870620784554, -13.45251147068442, -13.45251147068442, -15.177384992459011, -15.177384992459011, -15.177384992459011);
  # 
  # 
  # #PP = cos_taper(vect2)*exp(1i*realphasevector);
  # PP = cos_taper(vect2)*exp(1i*beta(vect));
  # 
  # #wavevector = beta(vect);
  # #wavevector = wavevector %% (2*pi);
  # 
  # #PP = exp(1i*wavevector);
  # 
  # for(n in c(1:length(vect))){
  #   AF = AF + (exp(1i*2*pi*n*d*sin(p)) * PP[n]); #Array Factor
  # }
  # 
  # fact = abs(AF);
  # my.max = function(x) ifelse( !all(is.na(x)), max(x, na.rm=T), NA)
  # fact2 = fact / my.max(fact);
  # #fact2 <- read.csv("af.csv", header = FALSE, check.names=FALSE);
  # #fact2 = as.numeric(fact2);
  # lines(p, 20*log10(fact2), ylim=c(-30, 0), type='l', lty=3, col="red");
  # grid(34, 26);
  # 
  # max = 0;
  # for(i in c(1:length(p))) {
  #   if (fact[i] > max) {
  #     max = fact[i];
  #     maxlobe_index = i;
  #   }
  # }
  # 
  # #maxlobe_index = which(round(p, digits=6) == round(theta, digits=6));
  # 
  # flag1 = FALSE;
  # flag2 = FALSE;
  # 
  # p1 = maxlobe_index - 1;
  # p2 = p1 - 1;
  # 
  # while(fact2[p1] > fact2[p2]){
  #   p1 = p2;
  #   p2 = p1 - 1;
  #   if(p2 == 0){
  #     p1 = 1791;
  #     p2 = p1 - 1;
  #     flag1 = TRUE;
  #   }
  # }
  # 
  # tmp1 = p1;
  # 
  # q1 = maxlobe_index + 1;
  # q2 = q1 + 1;
  # 
  # while(fact2[q1] > fact2[q2]){
  #   q1 = q2;
  #   q2 = q1 + 1;
  #   if(q2 == 1801){
  #     q1 = 10;
  #     q2 = q1 + 1;
  #     flag2 = TRUE;
  #   }
  # }
  # tmp2 = q1;
  # 
  # if(flag1 || flag2){
  #   right_point = tmp1;
  #   left_point = tmp2;
  #   sll_left_index = which.max(fact2[left_point:900]) + left_point;
  #   sll_right_index = which.max(fact2[901:right_point]) + 900;
  #   
  #   bw3 = (abs(p[1]) - abs(p[left_point])) + (p[1801] - p[right_point]);
  #   sll3 = max(20*log10(fact2[sll_left_index]), 
  #             20*log10(fact2[sll_right_index]));
  #   
  #   #lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  #   #lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
  # }else{ 
  #   right_point = tmp2;
  #   left_point = tmp1;
  #   sll_left_index = which.max(fact2[1:left_point]);
  #   sll_right_index = which.max(fact2[right_point:1801]) + right_point;
  #   
  #   bw3 = abs(p[right_point] - p[left_point]);
  #   sll3 = max(20*log10(fact2[sll_left_index]), 
  #             20*log10(fact2[sll_right_index]));
  #   
  #   #lines(p[left_point]*rep(1, 1801), 20*log10(fact2), col='red');
  #   #lines(p[right_point]*rep(1, 1801), 20*log10(fact2), col='red');
  # }
  # 
  # #lines(theta*rep(1, 1801), 20*log10(fact2), col='blue');
  # #lines(p, sll * rep(1, 1801), type="l", lty=2, col='orange');
  # remove(flag1, flag2, tmp1, tmp2, p1, p2, q1, q2, n)
