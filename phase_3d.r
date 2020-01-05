phases = read.table("phases_3d.csv", header = FALSE, stringsAsFactors=FALSE)

phases_45 = c(phases[[1]])
phases_50 = c(phases[[2]])
phases_55 = c(phases[[3]])
elem_number = c(1:30)

plot(elem_number, phases_45, col="blue", cex=0.4, 
     xlab="Elementos de Antena", 
     ylab="Radianes",
     #xlim = range(-20, -3),
     ylim=range(-1300 ,0)
)

points(elem_number, phases_50, col="red", cex=0.4, 
       xlab="Elementos de Antena", 
       ylab="Radianes")

points(elem_number, phases_55, col="orange", cex=0.4, 
       xlab="Elementos de Antena", 
       ylab="Radianes")

lines(elem_number, phases_45, col="blue")
lines(elem_number, phases_50, col="red")
lines(elem_number, phases_55, col="orange")

grid()