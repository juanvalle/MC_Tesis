dat = read.table("opt_distances.csv", header = FALSE, stringsAsFactors=FALSE)
# dat2 = read.table("pareto7.csv", header = FALSE, stringsAsFactors=FALSE)
# dat3 = read.table("pareto8.csv", header = FALSE, stringsAsFactors=FALSE)
# dat4 = read.table("pareto9.csv", header = FALSE, stringsAsFactors=FALSE)
# dat5 = read.table("pareto10.csv", header = FALSE, stringsAsFactors=FALSE)
# dat6 = read.table("pareto11.csv", header = FALSE, stringsAsFactors=FALSE)

datx = c(dat[[1]])
daty = c(dat[[2]])
# dat2x = c(dat2[[1]])
# dat2y = c(dat2[[2]])
# dat3x = c(dat3[[1]])
# dat3y = c(dat3[[2]])
# dat4x = c(dat4[[1]])
# dat4y = c(dat4[[2]])
# dat5x = c(dat5[[1]])
# dat5y = c(dat5[[2]])
# dat6x = c(dat6[[1]])
# dat6y = c(dat6[[2]])

plot(rev(datx[order(datx)]), daty[order(daty)], col="red", cex=0.4, 
     xlab="Objective 1: SLL (dB)", 
     ylab="Objective 2: BW (rad.)",
     #xlim = range(-20, -3),
     #ylim=range(0.1 ,0.8)
     )
     
# points(rev(dat2x[order(dat2x)]), dat2y[order(dat2y)], col="blue", cex=0.4, 
#        xlab="Objective 1: SLL (dB)", 
#        ylab="Objective 2: BW (rad.)")
# 
# points(rev(dat3x[order(dat3x)]), dat3y[order(dat3y)], col="green", cex=0.4, 
#        xlab="Objective 1: SLL (dB)", 
#        ylab="Objective 2: BW (rad.)")
# 
# points(rev(dat4x[order(dat4x)]), dat4y[order(dat4y)], col="orange", cex=0.4, 
#        xlab="Objective 1: SLL (dB)", 
#        ylab="Objective 2: BW (rad.)")
# 
# points(rev(dat5x[order(dat5x)]), dat5y[order(dat5y)], col="brown", cex=0.4, 
#        xlab="Objective 1: SLL (dB)", 
#        ylab="Objective 2: BW (rad.)")
# 
# points(rev(dat6x[order(dat6x)]), dat6y[order(dat6y)], col="black", cex=0.4, 
#        xlab="Objective 1: SLL (dB)", 
#        ylab="Objective 2: BW (rad.)")

lines(rev(datx[order(datx)]), daty[order(daty)], col="red")
# lines(rev(dat2x[order(dat2x)]), dat2y[order(dat2y)], col="blue")
# lines(rev(dat3x[order(dat3x)]), dat3y[order(dat3y)], col="green")
# lines(rev(dat4x[order(dat4x)]), dat4y[order(dat4y)], col="orange")
# lines(rev(dat5x[order(dat5x)]), dat5y[order(dat5y)], col="brown")
# lines(rev(dat6x[order(dat6x)]), dat6y[order(dat6y)], col="black")

# legend(-9, 0.7, legend=c("m = 4,096", "m = 16,384", "m = 65,536", 
#                          "m = 262,144", "m = 1,048,576", 
#                          "m = 4,194,304"), 
#        col=c("red", "blue", "green", "orange", "brown", "black"), lty=1:2, cex=0.8)

# points(-13.36, 0.1571, col="blue", pch=15)
# points(-17.53, 0.3019, col="red", pch=16)
# points(-15.93, 0.2339, col="black", pch=17)
# points(-13.595, 0.1571, col="black", pch=4)

#points(-16.12, 0.2374, col="blue", pch=15)
#points(-16.17, 0.2269, col="red", pch=16)
#points(-15.75, 0.2147, col="black", pch=17)
#points(-15.68, 0.2321, col="black", pch=4)

#x = c(-18, -13.36)
#y = c(0.1571, 0.1571)
#lines(x, y, col="lightgray", lty=1)

#x = c(-13.36, -13.36)
#y = c(0.1571, 0.15)
#lines(x, y, col="lightgray", lty=1)
grid()