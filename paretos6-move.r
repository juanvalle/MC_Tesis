probs = read.table("pareto6-0-prob.csv", header = FALSE, stringsAsFactors=FALSE)

prob1 = c(probs[[1]])
prob2 = c(probs[[2]])
prob3 = c(probs[[3]])
prob4 = c(probs[[4]])

size = c(1:6)

plot(size, prob1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 6),
     ylim=range(0 , 1), type="n")

lines(size, prob1, col="red")
tmp1 = prob1+prob2
lines(size, tmp1, col="blue")
tmp2 = prob1+prob2+prob3
lines(size, tmp2, col="orange")
#tmp3 = prob4
#lines(size, tmp3, col="green")

probs = read.table("pareto6-1-prob.csv", header = FALSE, stringsAsFactors=FALSE)

prob1 = c(probs[[1]])
prob2 = c(probs[[2]])
prob3 = c(probs[[3]])
prob4 = c(probs[[4]])

size = c(1:6)

plot(size, prob1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 6),
     ylim=range(0 , 1), type="n")

lines(size, prob1, col="red")
tmp1 = prob1+prob2
lines(size, tmp1, col="blue")
tmp2 = prob1+prob2+prob3
lines(size, tmp2, col="orange")
#tmp3 = prob4
#lines(size, tmp3, col="green")

probs = read.table("pareto6-2-prob.csv", header = FALSE, stringsAsFactors=FALSE)

prob1 = c(probs[[1]])
prob2 = c(probs[[2]])
prob3 = c(probs[[3]])
prob4 = c(probs[[4]])

size = c(1:6)

plot(size, prob1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 6),
     ylim=range(0 , 1), type="n")

lines(size, prob1, col="red")
tmp1 = prob1+prob2
lines(size, tmp1, col="blue")
tmp2 = prob1+prob2+prob3
lines(size, tmp2, col="orange")
#tmp3 = prob4
#lines(size, tmp3, col="green")

probs = read.table("pareto6-3-prob.csv", header = FALSE, stringsAsFactors=FALSE)

prob1 = c(probs[[1]])
prob2 = c(probs[[2]])
prob3 = c(probs[[3]])
prob4 = c(probs[[4]])

size = c(1:6)

plot(size, prob1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 6),
     ylim=range(0 , 1), type="n")

lines(size, prob1, col="red")
tmp1 = prob1+prob2
lines(size, tmp1, col="blue")
tmp2 = prob1+prob2+prob3
lines(size, tmp2, col="orange")
#tmp3 = prob4
#lines(size, tmp3, col="green")

probs = read.table("pareto6-4-prob.csv", header = FALSE, stringsAsFactors=FALSE)

prob1 = c(probs[[1]])
prob2 = c(probs[[2]])
prob3 = c(probs[[3]])
prob4 = c(probs[[4]])

size = c(1:6)

plot(size, prob1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 6),
     ylim=range(0 , 1), type="n")

lines(size, prob1, col="red")
tmp1 = prob1+prob2
lines(size, tmp1, col="blue")
tmp2 = prob1+prob2+prob3
lines(size, tmp2, col="orange")
#tmp3 = prob4
#lines(size, tmp3, col="green")
probs = read.table("pareto6-5-prob.csv", header = FALSE, stringsAsFactors=FALSE)

prob1 = c(probs[[1]])
prob2 = c(probs[[2]])
prob3 = c(probs[[3]])
prob4 = c(probs[[4]])

size = c(1:6)

plot(size, prob1, xlab="Element", 
     ylab="Probability",
     xlim = range(1, 6),
     ylim=range(0 , 1), type="n")

lines(size, prob1, col="red")
tmp1 = prob1+prob2
lines(size, tmp1, col="blue")
tmp2 = prob1+prob2+prob3
lines(size, tmp2, col="orange")
#tmp3 = prob4
#lines(size, tmp3, col="green")