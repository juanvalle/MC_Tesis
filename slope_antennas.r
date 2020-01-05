setwd("~/Desktop/paretos/pareto6/mod")

dat = read.table("pareto6-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datx = c(dat[[4]])
daty = c(dat[[2]])

plot(datx, daty, pch=16, col="red", xlab="Elements", ylab="FNBW", 
     xlim = range(20, 44), ylim = range(0.1, 0.3))
lines(datx, daty, col="red")
grid()

setwd("~/Desktop/paretos/pareto7/mod")

dat = read.table("pareto7-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datx = c(dat[[4]])
daty = c(dat[[2]])

points(datx, daty, pch=17, col="blue", xlab="Elements", ylab="FNBW")
lines(datx, daty, col="blue", lty=2)
grid()

setwd("~/Desktop/paretos/pareto8/mod")

dat = read.table("pareto8-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datx = c(dat[[4]])
daty = c(dat[[2]])

points(datx, daty, pch=18, col="orange", xlab="Elements", ylab="FNBW")
lines(datx, daty, col="orange", lty=3)
grid()

setwd("~/Desktop/paretos/pareto9/mod")

dat = read.table("pareto9-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datx = c(dat[[4]])
daty = c(dat[[2]])

points(datx, daty, pch=16, col="black", xlab="Elements", ylab="FNBW")
lines(datx, daty, col="black", lty=4)
grid()

setwd("~/Desktop/paretos/pareto10/mod")

dat = read.table("pareto10-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datx = c(dat[[4]])
daty = c(dat[[2]])

points(datx, daty, pch=17, col="red", xlab="Elements", ylab="FNBW")
lines(datx, daty, col="red", lty=5)
grid()

setwd("~/Desktop/paretos/pareto11/mod")

dat = read.table("pareto11-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datx = c(dat[[4]])
daty = c(dat[[2]])

points(datx, daty, pch=18, col="green", xlab="Elements", ylab="FNBW")
lines(datx, daty, col="green", lty=6)
grid()
