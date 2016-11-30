

z <- ceiling(nrow(freqs.df)/50000)
freqs.df[z,]
indexA <- which(freqs.df[,3] == freqs.df[z,3])
input.df <- freqs.df1[1:indexA[length(indexA)],]


i <- 41 # index variable for loop
rows.v <- 50000 # number of rows to be used in xtab
total.rows.v <- nrow(freqs.df)
  
y <- ceiling(nrow((freqs.df))/rows.v) # number of files to be produced
     floor(nrow((freqs.df))/rows.v)

41*50000

seg.v <- seq_along(1:y)


for (i in 1:y) {
  
  if (i == 1) {
    
    indexA <- which(freqs.df[,3] == freqs.df[(seg.v[i] * z),3])
    input.df <- freqs.df[1:indexA[length(indexA)],]
    
    
    nam <- paste("result", i, ".R", sep = "")
    
    
    output.df <-  xtabs(Freq ~ ID+combined.content, data=input.df)
    rm(input.df)
    
    save(output.df, file = nam)
    
    
    rm(nam, output.df)
    
    
  }
  
  else {
    
    if (i != length(seg.v)) {
      
      indexA <- which(freqs.df[,3] == freqs.df[(seg.v[i] * z),3])
      input.df <- freqs.df[indexA[1]:indexA[length(indexA)],]
      
      
      nam <- paste("result", i, ".R", sep = "")
      
      
      output.df <-  xtabs(Freq ~ ID+combined.content, data=input.df)
      rm(input.df)
      
      save(output.df, file = nam)
      
      
      rm(nam, output.df)
      
      
    }
    
   else {
     
     indexA <- which(freqs.df[,3] == freqs.df[(seg.v[i] * z),3])
     input.df <- freqs.df[indexA[1]: total.rows.v, ]
     
     
     nam <- paste("result", i, ".R", sep = "")
     
     
     output.df <-  xtabs(Freq ~ ID+combined.content, data=input.df)
     rm(input.df)
     
     save(output.df, file = nam)
     print("poop")
     
     rm(nam, output.df)
     
     
   }
    
  }
  
  
}  

total.rows.v

