

# set variables for loop

i <- 5 # index variable for loop
rows.v <- 50000 # number of rows to be used in xtab
total.rows.v <- nrow(freqs.df)
y <-     floor(nrow((freqs.df))/rows.v)
seg.v <- seq_along(1:y)
row.counter.v <- NULL
  

timestamp()
for (i in 1:y) {
  
  if (i == 1) {
    
    indexA <- which(freqs.df[,3] == freqs.df[(seg.v[i] * rows.v),3])
    input.df <- freqs.df[1:indexA[length(indexA)],]
    row.counter.v <- append(row.counter.v, nrow(input.df))
    
    nam <- paste("result", i, ".R", sep = "")
    
    
    output.df <-  xtabs(Freq ~ ID+combined.content, data=input.df)
    rm(input.df)
    
    
    save(output.df, file = nam)
    print("fuck")
    
    
    rm(nam, output.df)
    
    
  }
  
  else {
    
    if (i != length(seg.v)) {
      
      indexA <- which(freqs.df[,3] == freqs.df[(((seg.v[i] - 1) * rows.v) + 1),3])
      indexB <- which(freqs.df[,3] == freqs.df[((seg.v[i]) * rows.v) ,3])
      input.df <- freqs.df[indexA[1]:indexB[length(indexB)],]
      row.counter.v <- append(row.counter.v, nrow(input.df))
      
      
      
      nam <- paste("result", i, ".R", sep = "")
      
      
      output.df <-  xtabs(Freq ~ ID+combined.content, data=input.df)
      rm(input.df)
      
      save(output.df, file = nam)
      print("piss")
      
      rm(nam, output.df)
      
      
    }
    
   else {
     
     indexA <- which(freqs.df[,3] == freqs.df[((seg.v[i] - 1) * rows.v),3])
     input.df <- freqs.df[indexA[1]: total.rows.v, ]
     row.counter.v <- append(row.counter.v, nrow(input.df))
     
     
     
     nam <- paste("result", i, ".R", sep = "")
     
     
     output.df <-  xtabs(Freq ~ ID+combined.content, data=input.df)
     rm(input.df)
     
     save(output.df, file = nam)
     print("poop")
     
     rm(nam, output.df)
     
     
   }
    
  }
  
  
}  
 
timestamp()


sum(row.counter.v)
row.counter.v


freqs.df[indexA[(length(indexA) - 1)],]
         
freqs.df[indexB[length(indexB)],]

freqs.df[indexA[1], ]
freqs.df[length(freqs.df),]
