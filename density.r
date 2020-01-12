  setwd("~/paretos/pareto12/mod")
  
  pareto = read.table("pareto12-0mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
  seqs = gsub("\\[|\\]", "", c(pareto[[3]]))
  sll = as.double(gsub("\\[|\\]", "", c(pareto[[1]])))
  fnbw = as.double(gsub("\\[|\\]", "", c(pareto[[2]])))
  
  M = matrix(c(c(sll), c(fnbw)), nrow=length(sll), ncol=2, byrow=FALSE)
  
  #cmeans(M, 3, iter.max = 1000, verbose = FALSE,
  #       dist = "euclidean", method = "cmeans", m = 2,
  #       rate.par = NULL, weights = 1, control = list())
  
  
  clust = kmeans(M, 3, iter.max = 10000, nstart = 1,
         algorithm = c("Hartigan-Wong", "Lloyd", "Forgy",
                       "MacQueen"), trace=FALSE)
  
  for (i in 1:length(seqs)) {
    array = as.integer(strsplit(seqs, ",")[[i]])
    windowsize = trunc(length(array)/3)
  }
  
  sizes = clust[[1]]
  elem = sizes[1]
  dig = sizes[1]
  count1 = 1
  
  while(elem == dig){
    count1 = count1 + 1
    dig = sizes[count1]
  }
  
  elem = sizes[count1]
  dig = sizes[count1]
  count2 = count1
  
  while(elem == dig){
    count2 = count2 + 1
    dig = sizes[count2]
  }
  
  print(c(count1-1, ((count2)-count1)))
