setwd("~/backup/antenna_main/paretos/pareto12/mod")

dat = read.table("pareto12-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

setwd("~/backup/antenna_main/paretos/pareto6/mod")
dat = read.table("pareto6-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

dat2x = c(dat[[1]])
dat2y = c(dat[[2]])

plot(datx, daty, col="black", cex=1,
     xlab="Objetivo 1: SLL (dB)",
     ylab="Objetivo 2: FNBW (rad.)",
     pch=17,
     xlim = range(min(datx), max(dat2x)),
     ylim=range(min(daty), max(dat2y))
)

lines(datx, daty, col="black", lty=3)
grid()

setwd("~/backup/antenna_main/paretos/pareto11/mod")

dat = read.table("pareto11-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

points(datx, daty, col="blue", cex=1.1,
       xlab="Objective 1: SLL (dB)",
       ylab="Objective 2: FNBW (rad.)",
       pch=18
)

lines(datx, daty, col="blue", lty=3)
grid()

setwd("~/backup/antenna_main/paretos/pareto10/mod")

dat = read.table("pareto10-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

points(datx, daty, col="red", cex=1.1,
       xlab="Objective 1: SLL (dB)",
       ylab="Objective 2: FNBW (rad.)",
       pch=19
)

lines(datx, daty, col="red", lty=3)
grid()


setwd("~/backup/antenna_main/paretos/pareto9/mod")

dat = read.table("pareto9-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

points(datx, daty, col="green", cex=1,
       xlab="Objective 1: SLL (dB)",
       ylab="Objective 2: FNBW (rad.)",
       pch=17
)

lines(datx, daty, col="green", lty=3)
grid()

setwd("~/backup/antenna_main/paretos/pareto8/mod")

dat = read.table("pareto8-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

points(datx, daty, col="brown", cex=1.1,
       xlab="Objective 1: SLL (dB)",
       ylab="Objective 2: FNBW (rad.)",
       pch=18
)

lines(datx, daty, col="brown", lty=3)
grid()

setwd("~/backup/antenna_main/paretos/pareto7/mod")

dat = read.table("pareto7-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

points(datx, daty, col="magenta", cex=1.1,
       xlab="Objective 1: SLL (dB)",
       ylab="Objective 2: FNBW (rad.)",
       pch=19
)

lines(datx, daty, col="magenta", lty=3)
grid()

setwd("~/backup/antenna_main/paretos/pareto6/mod")

dat = read.table("pareto6-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")

datx = c(dat[[1]])
daty = c(dat[[2]])

points(datx, daty, col="orange", cex=1,
       xlab="Objective 1: SLL (dB)",
       ylab="Objective 2: FNBW (rad.)",
       pch=17
)

lines(datx, daty, col="orange", lty=3)
grid()

legend(-21.92, 0.25, legend=c("n = 6", "n = 7", "n = 8", "n = 9", "n = 10", "n = 11", "n = 12"), 
       col=c("orange", "magenta", "brown", "green", "red", "blue", "black"), lty=1, cex=0.7)
