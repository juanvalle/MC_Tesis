setwd("~/Documents/scripts/R/antenna/paretos_clust")

library(cluster)
library(factoextra)
library(e1071)

family <- read.csv("pareto10-0mod_clust.csv")
cm <- cmeans(family, 3, iter.max = 50000, m = 2, method="cmeans", verbose=TRUE)
fviz_cluster(list(data = family, cluster=cm$cluster), 
               ellipse.type = "norm", ellipse.level = 0.8,
               palette = "Set2", ggtheme = theme_minimal())
