library(partitions)

iter = 1
plot(c(25, 55), c(3, 6), xlab='Elementos de antena (N)', 
     ylab='% de subproblemas con N elementos', type="n", cex.lab=1.8, 
     cex.axis=1.5)

legend(80, 0.02, legend=c("n = 21", "n = 18", "n = 15", "n = 12"),
       col=colors, lty=1, cex=0.8)

pcht = c(17:20, 16)
Avsx = c()
Avsy = c()

for(n in c(21, 18, 15, 12)){
  k = 4
  j = 1
  N_s = c()
  N = 0
  minval = 1
  maxval = 4
  Nmin = minval*n
  Nmax = maxval*n
  Nmid = round((Nmin + Nmax)/2)
  Nvect = c(Nmin:Nmax)
  
  colors = c('black', 'orange', 'forestgreen', 'darkblue')
  
  comp = compositions(n, k)
  
  for(i in c(1:length(comp))) {
    N = (N + (comp[i]*j))
    j = j + 1
      
    if(j > 4){
      N_s = c(N_s, N)
      j = 1
      N = 0
    }
  }
  
  Nquant = c()
  rep = 0
  
  for(a in c((n*minval):(n*maxval))){
    for(b in N_s){
      if(a == b){
        rep = rep + 1
      }
    }
    Nquant = c(Nquant, rep)
    rep = 0
  }
  
  sorted_Ns = sort(N_s)
  fx = 4*Nquant/length(comp) * 100
  
  
  points(Nvect, fx, col=colors[iter], pch=pcht[iter])
  lines(Nvect, fx, col=colors[iter])
  
  points(Nvect[(length(Nvect)/2)+1], fx[(length(fx)/2)+1], 
         pch=pcht[3], col=colors[iter], cex=1.5)
  
  Avsx = c(Avsx, Nvect[(length(Nvect)/2)+1])
  Avsy = c(Avsy, fx[(length(fx)/2)+1])
  
  lines(c(8, 109), c(fx[(length(fx)/2)+1], fx[(length(fx)/2)+1]), 
        col=colors[iter], lty=iter+1)
  
  grid()
  
  lines(c(Nmid, Nmid), c(0, 1))
  
  iter  = iter + 1
}

lines(Avsx, Avsy, lwd = 1.9, col='red')

