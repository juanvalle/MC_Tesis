setwd("~/backup/antenna_main/paretos/pareto12/mod")

pareto = read.table("pareto12-12mod.csv", header = FALSE, stringsAsFactors=FALSE, sep=",")
seqs = gsub("\\[|\\]", "", c(pareto[[3]]))

for (i in 1:length(seqs)){
  array = as.integer(strsplit(seqs, ",")[[i]])
  count = table(array)
  print(i-1)
  print(count)
} 
