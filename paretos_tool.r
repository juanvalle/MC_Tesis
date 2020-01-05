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


# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-1mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="blue", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=18
# )
# 
# lines(datx, daty, col="blue", lty=2)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-2mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="orange", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=19
# )
# 
# lines(datx, daty, col="orange", lty=3)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-3mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="black", cex=0.7,
#         xlab="Objective 1: SLL (dB)",
#         ylab="Objective 2: FNBW (rad.)",
#         pch=20
# )
# 
# lines(datx, daty, col="black", lty=4)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
#    
# dat = read.table("pareto12-4mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="red", cex=0.7,
#         xlab="Objective 1: SLL (dB)",
#         ylab="Objective 2: FNBW (rad.)",
#         pch=21
# )
# 
# lines(datx, daty, col="red", lty=5)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-5mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="blue", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=16
# )
# 
# lines(datx, daty, col="blue", lty=6)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-6mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="orange", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=17
# )
# 
# lines(datx, daty, col="orange", lty=7)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-7mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="black", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=18
# )
# 
# lines(datx, daty, col="black", lty=8)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-8mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="red", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=19
# )
# 
# lines(datx, daty, col="red", lty=9)
# grid()
# 
# setwd("~/Desktop/paretos/pareto12/mod")
# 
# dat = read.table("pareto12-9mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="blue", cex=0.7,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=20
# )
# 
# lines(datx, daty, col="blue", lty=10)
# grid()

#text(locator(), labels = c("red line", "black line"))

#legend(-13, 0.25, legend=c("0°", "1°", "2°", "3°", "4°", "5°", "6°", "7°", "8°", "9°"), 
#       col=c("magenta", "black", "green", "blue", "red", "orange", "brown", "magenta", "black", "green"), lty=1:7, cex=0.8)


#setwd("~/Desktop/paretos/pareto10/distribution_exp")

# for (i in 5:6) {
#   n = toString(i)
#   output <- paste("prob_front", n, ".csv", sep="")
#   
#   dat = read.table(output, header = FALSE, stringsAsFactors=FALSE, sep="\t")
#   
#   datx = c(dat[[1]])
#   daty = c(dat[[2]])
#   
#   points(datx, daty, col="blue", cex=0.6,
#          xlab="Objective 1: SLL (dB)",
#          ylab="Objective 2: FNBW (rad.)",
#          pch=17
#   )
#   
#   lines(datx, daty, col="blue", lty=2)
#   grid()
# }

# for (i in 1:1) {
#   n = toString(i)
#   output <- paste("norm_front", n, ".csv", sep="")
# 
#   dat = read.table(output, header = FALSE, stringsAsFactors=FALSE, sep="\t")
# 
#   datx = c(dat[[1]])
#   daty = c(dat[[2]])
# 
#   points(datx, daty, col="red", cex=0.8,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=16
#        #xlim = range(-22.5, -3),
#        #ylim=range(0.2 ,0.8)
#   )
# 
#   lines(datx, daty, col="red", lty=1)
#   grid()
# }

# setwd("~/Desktop/paretos/pareto10/mod")
# 
# dat = read.table("pareto10-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# 
# datx = c(dat[[1]])
# daty = c(dat[[2]])
# 
# points(datx, daty, col="orange", cex=0.6,
#        xlab="Objective 1: SLL (dB)",
#        ylab="Objective 2: FNBW (rad.)",
#        pch=18
# )
# 
# lines(datx, daty, col="orange", lty=3)
# grid()