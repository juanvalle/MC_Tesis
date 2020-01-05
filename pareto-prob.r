setwd("~/Desktop/paretos/pareto6/mod")
#setwd("~/Documents/scripts/R/antenna/paretos_clust")

# PS = 6
# dat = read.table("pareto6-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# datz = gsub("\\[|\\]", "", c(dat[[3]]))
# 
# prob1 = c(0, 0, 0, 0, 0, 0)
# prob2 = c(0, 0, 0, 0, 0, 0)
# prob3 = c(0, 0, 0, 0, 0, 0)
# prob4 = c(0, 0, 0, 0, 0, 0)
# 
# for (i in 1:length(datz)){
#   array = as.integer(strsplit(datz, ",")[[i]])
#   for (j in c(1:PS)) {
#     if(array[j] == 1) {
#       prob1[j] = prob1[j] + 1
#     } else if(array[j] == 2) {
#       prob2[j] = prob2[j] + 1
#     } else if(array[j] == 3) {
#       prob3[j] = prob3[j] + 1
#     } else if(array[j] == 4) {
#       prob4[j] = prob4[j] + 1
#     }
#   }
# }
# 
# prob1 = prob1/length(datz)
# prob2 = prob2/length(datz)
# prob3 = prob3/length(datz)
# prob4 = prob4/length(datz)
# 
# bound1 = prob1
# bound2 = prob1 + prob2
# bound3 = prob1 + prob2 + prob3
# 
# size = c(1, 2.8, 4.6, 6.4, 8.2, 10)
# 

size = c(1:11)
plot(size, 0:1, xlab="Element",
     ylab="Probability",
     xlim = range(1, 11),
     ylim=range(0 , 1), type="n")
# 
# lines(size, bound1, col="blue")
# lines(size, bound2, col="black")
# lines(size, bound3, col="red")
# 
# 
# setwd("~/Desktop/paretos/pareto7/mod")
# 
# PS = 7
# dat = read.table("pareto7-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# datz = gsub("\\[|\\]", "", c(dat[[3]]))
# 
# prob1 = c(0, 0, 0, 0, 0, 0, 0)
# prob2 = c(0, 0, 0, 0, 0, 0, 0)
# prob3 = c(0, 0, 0, 0, 0, 0, 0)
# prob4 = c(0, 0, 0, 0, 0, 0, 0)
# 
# for (i in 1:length(datz)){
#   array = as.integer(strsplit(datz, ",")[[i]])
#   for (j in c(1:PS)) {
#     if(array[j] == 1) {
#       prob1[j] = prob1[j] + 1
#     } else if(array[j] == 2) {
#       prob2[j] = prob2[j] + 1
#     } else if(array[j] == 3) {
#       prob3[j] = prob3[j] + 1
#     } else if(array[j] == 4) {
#       prob4[j] = prob4[j] + 1
#     }
#   }
# }
# 
# prob1 = prob1/length(datz)
# prob2 = prob2/length(datz)
# prob3 = prob3/length(datz)
# prob4 = prob4/length(datz)
# 
# bound1 = prob1
# bound2 = prob1 + prob2
# bound3 = prob1 + prob2 + prob3
# 
# size = c(1, 2.5, 4, 5.5, 7, 8.5, 10)
# 
# lines(size, bound1, col="blue", lty=2)
# lines(size, bound2, col="black", lty=2)
# lines(size, bound3, col="red", lty=2)
# 
# 
# setwd("~/Desktop/paretos/pareto8/mod")
# 
# PS = 8
# dat = read.table("pareto8-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# datz = gsub("\\[|\\]", "", c(dat[[3]]))
# 
# prob1 = c(0, 0, 0, 0, 0, 0, 0, 0)
# prob2 = c(0, 0, 0, 0, 0, 0, 0, 0)
# prob3 = c(0, 0, 0, 0, 0, 0, 0, 0)
# prob4 = c(0, 0, 0, 0, 0, 0, 0, 0)
# 
# for (i in 1:length(datz)){
#   array = as.integer(strsplit(datz, ",")[[i]])
#   for (j in c(1:PS)) {
#     if(array[j] == 1) {
#       prob1[j] = prob1[j] + 1
#     } else if(array[j] == 2) {
#       prob2[j] = prob2[j] + 1
#     } else if(array[j] == 3) {
#       prob3[j] = prob3[j] + 1
#     } else if(array[j] == 4) {
#       prob4[j] = prob4[j] + 1
#     }
#   }
# }
# 
# prob1 = prob1/length(datz)
# prob2 = prob2/length(datz)
# prob3 = prob3/length(datz)
# prob4 = prob4/length(datz)
# 
# bound1 = prob1
# bound2 = prob1 + prob2
# bound3 = prob1 + prob2 + prob3
# 
# size = c(1, 2.29, 3.58, 4.87, 6.16, 7.45, 8.74, 10)
# 
# lines(size, bound1, col="blue", lty=3)
# lines(size, bound2, col="black", lty=3)
# lines(size, bound3, col="red", lty=3)
# 
# 
# setwd("~/Desktop/paretos/pareto9/mod")
# 
# PS = 9
# dat = read.table("pareto9-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# datz = gsub("\\[|\\]", "", c(dat[[3]]))
# 
# prob1 = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
# prob2 = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
# prob3 = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
# prob4 = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
# 
# for (i in 1:length(datz)){
#   array = as.integer(strsplit(datz, ",")[[i]])
#   for (j in c(1:PS)) {
#     if(array[j] == 1) {
#       prob1[j] = prob1[j] + 1
#     } else if(array[j] == 2) {
#       prob2[j] = prob2[j] + 1
#     } else if(array[j] == 3) {
#       prob3[j] = prob3[j] + 1
#     } else if(array[j] == 4) {
#       prob4[j] = prob4[j] + 1
#     }
#   }
# }
# 
# prob1 = prob1/length(datz)
# prob2 = prob2/length(datz)
# prob3 = prob3/length(datz)
# prob4 = prob4/length(datz)
# 
# bound1 = prob1
# bound2 = prob1 + prob2
# bound3 = prob1 + prob2 + prob3
# 
# size = c(1, 2.125, 3.25, 4.375, 5.5, 6.625, 7.75, 8.875, 10)
# 
# lines(size, bound1, col="blue", lty=4)
# lines(size, bound2, col="black", lty=4)
# lines(size, bound3, col="red", lty=4)


setwd("~/Desktop/paretos/pareto11/mod")

PS = 11
dat = read.table("pareto11-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
datz = gsub("\\[|\\]", "", c(dat[[3]]))

prob1 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
prob2 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
prob3 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
prob4 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

for (i in 1:length(datz)){
  array = as.integer(strsplit(datz, ",")[[i]])
  for (j in c(1:PS)) {
    if(array[j] == 1) {
      prob1[j] = prob1[j] + 1
    } else if(array[j] == 2) {
      prob2[j] = prob2[j] + 1
    } else if(array[j] == 3) {
      prob3[j] = prob3[j] + 1
    } else if(array[j] == 4) {
      prob4[j] = prob4[j] + 1
    }
  }
}

prob1 = prob1/length(datz)
prob2 = prob2/length(datz)
prob3 = prob3/length(datz)
prob4 = prob4/length(datz)

bound1 = prob1
bound2 = prob1 + prob2
bound3 = prob1 + prob2 + prob3

size = c(1:PS)

plot(size, bound1, xlab="Element",
     ylab="Probability",
     xlim = range(1, 11),
     ylim=range(0 , 1), type="n")

lines(size, bound1, col="blue", lty=5)
lines(size, bound2, col="black", lty=5)
lines(size, bound3, col="red", lty=5)



# PS = 10
# dat = read.table("pareto10-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
# datz = gsub("\\[|\\]", "", c(dat[[3]]))
# 
# prob1 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
# prob2 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
# prob3 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
# prob4 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
# 
# for (i in 1:length(datz)){
#   array = as.integer(strsplit(datz, ",")[[i]])
#   for (j in c(1:PS)) {
#     if(array[j] == 1) {
#       prob1[j] = prob1[j] + 1
#     } else if(array[j] == 2) {
#       prob2[j] = prob2[j] + 1
#     } else if(array[j] == 3) {
#       prob3[j] = prob3[j] + 1
#     } else if(array[j] == 4) {
#       prob4[j] = prob4[j] + 1
#     }
#   }
# }
# 
# prob1 = prob1/length(datz)
# prob2 = prob2/length(datz)
# prob3 = prob3/length(datz)
# prob4 = prob4/length(datz)
# 
# bound1 = prob1
# bound2 = prob1 + prob2
# bound3 = prob1 + prob2 + prob3
# 
# size = c(1:PS)
# 
# lines(size, bound1, col="blue", lty=1)
# lines(size, bound2, col="black", lty=1)
# lines(size, bound3, col="red", lty=1)



elements = c(1:10)

elem1 = c(1, 2.8, 4.6, 4.6, 6.4, 6.4, 8.2, 8.2, 10, 10)
bound1_1 = c(0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01)
bound1_2 = c(0.02, 0.51, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02, 0.02)
bound1_3 = c(0.27, 0.76, 0.03, 0.03, 0.03, 0.03, 0.27, 0.27, 0.03, 0.03)

elem2 = c(1, 2.5, 4, 4, 5.5, 7, 7, 8.5, 10, 10)
bound2_1 = c(0.01, 0.11, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01)
bound2_2 = c(0.02, 0.44, 0.02, 0.02, 0.02, 0.02, 0.02, 0.57, 0.02, 0.02)
bound2_3 = c(0.03, 0.78, 0.35, 0.35, 0.24, 0.24, 0.24, 0.90, 0.03, 0.03)

elem3 = c(1, 2.29, 3.58, 4.87, 6.16, 6.16, 7.45, 8.74, 10, 10)
bound3_1 = c(0.01, 0.09, 0.18, 0.01, 0.01, 0.01, 0.01, 0.09, 0.01, 0.01)
bound3_2 = c(0.02, 0.55, 0.36, 0.02, 0.02, 0.02, 0.02, 0.45, 0.02, 0.02)
bound3_3 = c(0.03, 0.82, 0.73, 0.03, 0.11, 0.11, 0.47, 0.90, 0.03, 0.03)

elem4 = c(1, 2.125, 3.25, 4.375, 5.5, 6.625, 7.75, 8.875, 10, 10)
bound4_1 = c(0.01, 0.19, 0.19, 0.01, 0.01, 0.01, 0.06, 0.13, 0.01, 0.01)
bound4_2 = c(0.02, 0.31, 0.50, 0.07, 0.07, 0.02, 0.50, 0.31, 0.02, 0.02)
bound4_3 = c(0.08, 0.75, 0.69, 0.20, 0.26, 0.15, 0.75, 0.88, 0.03, 0.03)

elem5 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
bound5_1 = c(0.01, 0.12, 0.18, 0.18, 0.06, 0.06, 0.06, 0.18, 0.24, 0.01)
bound5_2 = c(0.02, 0.59, 0.71, 0.47, 0.07, 0.18, 0.18, 0.71, 0.35, 0.02)
bound5_3 = c(0.03, 0.71, 0.89, 0.53, 0.13, 0.29, 0.35, 0.99, 0.88, 0.03)

c1_1 = rep(0, 10)
c1_2 = rep(0, 10)
c1_3 = rep(0, 10)
c1_4 = rep(0, 10)
c1_5 = rep(0, 10)
c2_1 = rep(0, 10)
c2_2 = rep(0, 10)
c2_3 = rep(0, 10)
c2_4 = rep(0, 10)
c2_5 = rep(0, 10)
c3_1 = rep(0, 10)
c3_2 = rep(0, 10)
c3_3 = rep(0, 10)
c3_4 = rep(0, 10)
c3_5 = rep(0, 10)

for(i in elements) {
  c1_1[i] = get_side(i, elem1[i], bound1_1[i])
  c1_2[i] = get_side(i, elem2[i], bound2_1[i])
  c1_3[i] = get_side(i, elem3[i], bound3_1[i])
  c1_4[i] = get_side(i, elem4[i], bound4_1[i])
  c1_5[i] = get_side(i, elem5[i], bound5_1[i])
  
  c2_1[i] = get_side(i, elem1[i], bound1_2[i])
  c2_2[i] = get_side(i, elem2[i], bound2_2[i])
  c2_3[i] = get_side(i, elem3[i], bound3_2[i])
  c2_4[i] = get_side(i, elem4[i], bound4_2[i])
  c2_5[i] = get_side(i, elem5[i], bound5_2[i])
  
  c3_1[i] = get_side(i, elem1[i], bound1_3[i])
  c3_2[i] = get_side(i, elem2[i], bound2_3[i])
  c3_3[i] = get_side(i, elem3[i], bound3_3[i])
  c3_4[i] = get_side(i, elem4[i], bound4_3[i])
  c3_5[i] = get_side(i, elem5[i], bound5_3[i])
}

bound1 = (c1_1 + c1_2 + c1_3 + c1_4 + c1_5) / 5
bound2 = (c2_1 + c2_2 + c2_3 + c2_4 + c2_5) / 5
bound3 = (c3_1 + c3_2 + c3_3 + c3_4 + c3_5) / 5

#lines(size, bound1, col="brown")
#lines(size, bound2, col="orange")
#lines(size, bound3, col="green")

get_side = function(a, x, y) {
  alpha = atan(y/x)
  beta = deg2rad(90 - rad2deg(alpha))
  
  c = a*((sin(alpha))/(sin(beta)))
  
  return(c)
}