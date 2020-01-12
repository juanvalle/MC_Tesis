setwd("~/Desktop/paretos/pareto10/mod")
dat0 = read.table("pareto10-5mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

setwd("~/Desktop/exp1")
dat1 = read.table("pareto10-5evo_rand_exp1.csv", header = FALSE, stringsAsFactors=FALSE, sep="\t")
dat2 = read.table("pareto10-5evo_rand2_exp1.csv", header = FALSE, stringsAsFactors=FALSE, sep="\t")
dat3 = read.table("pareto10-5evo_prob2_exp1.csv", header = FALSE, stringsAsFactors=FALSE, sep="\t")


dat0x = c(dat0[[1]])
dat0y = c(dat0[[2]])
dat1x = c(dat1[[1]])
dat1y = c(dat1[[2]])
dat2x = c(dat2[[1]])
dat2y = c(dat2[[2]])
dat3x = c(dat3[[1]])
dat3y = c(dat3[[2]])

plot(dat0x, dat0y, col="orange", cex=0.6, 
     xlab="Objective 1: SLL (dB)", 
     ylab="Objective 2: FNBW (rad.)"
     #xlim = range(-20, -13),
     #ylim=range(0.15 ,0.3)
)

points(dat1x, dat1y, col="red", cex=0.6, 
       xlab="Objective 1: SLL (dB)", 
       ylab="Objective 2: FNBW (rad.)")

points(dat2x, dat2y, col="black", cex=0.6, 
       xlab="Objective 1: SLL (dB)", 
       ylab="Objective 2: FNBW (rad.)")

points(dat3x, dat3y, col="blue", cex=0.6, 
       xlab="Objective 1: SLL (dB)", 
       ylab="Objective 2: FNBW (rad.)")

lines(dat0x, dat0y, col="orange")
lines(dat1x, dat1y, col="red")
lines(dat2x, dat2y, col="black")
lines(dat3x, dat3y, col="blue")

legend(-16, 0.24, legend=c("Rand: 30,000", "Rand: 10,000", "Prob: 1,000", "Pareto"), 
       col=c("red", "black", "blue", "orange"), lty=1:1, cex=0.8)

grid()
