library(partitions)

plot(-1, -1, xlim = c(1,2), ylim = c(1, 100), xlab = "", ylab = "%")

solcount = 0;
sols = c();

for(n in c(11:11)){
  setwd(paste("~/backup/antenna_main/paretos/pareto",n,"/mod", sep = ""))
  
  for(p in c(0:9)){
    comp = compositions(n, 4)
    pareto = read.table(paste("pareto",n,"-",as.character(p),"mod.csv", sep=""), header = FALSE, stringsAsFactors=FALSE, sep=",")
    seqs = gsub("\\[|\\]", "", c(pareto[[3]]))
    
    solcount = length(seqs);
    sols = c(sols, solcount);
    
    count = 1
    offset = 0
    t_offset = 0
    
    compo_vect = c()
    
    for (i in 1:length(seqs)){
      array = as.integer(strsplit(seqs, ",")[[i]])
      tarray = table(array)
      
      if(length(tarray) == 4){
        
        print(tarray)
    
        for(j in c(1:(length(comp)/4))){
          if(tarray[[1]] == comp[1+offset] && tarray[[2]] == comp[2+offset] && 
             tarray[[3]] == comp[3+offset] && tarray[[4]] == comp[4+offset]){
            print(j)
            compo_vect = c(compo_vect, j)
          }
          offset = offset + 4
        }
        
      } else{
        for(l in c(1:(length(comp)/4))){
          c = 0
          for(m in c(1:length(tarray))){
            sub = as.integer(names(tarray[m]))
            if(tarray[[m]] == comp[sub+t_offset]){
              c = c + 1
            }
          }
          
          if(c == length(tarray)){
            print(tarray)
            print(l)
            compo_vect = c(compo_vect, l)
          }
          t_offset = t_offset + 4
        }
      }
      
      offset = 0
      t_offset = 0
    }
    
    compo_vect = sort(compo_vect)
    per = compo_vect/((length(comp)/4)) * 100
    print(per)
    #points(per)
    #clust <- kmeans(compo_vect, 4, nstart = 20)
    for(line in per){
      #lines(c(1,60), c(line, line))
    }
    #grid()
  }
}
