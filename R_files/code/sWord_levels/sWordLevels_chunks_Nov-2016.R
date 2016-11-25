

# clean workspace
rm(list = ls())

# !! begin here for test of script for chunks of sWord levels

library(XML)

source("code/corpusFunctions.R")
input.dir <- "./working_input1"
files.v <- dir(path=input.dir, pattern=".*xml")


i <- 1

# create list object with no content. Vectors extracted from XML files will be stored here.
sWord.freq.table.list <- list()

# set up loop to process each file in source directory
for (i in 1:length(files.v)) {
  
  
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  # extract all <word> elements and children into XmlNodeList object
  word.nodes <- getNodeSet(doc.object, "//word")
  
  # here we must split files into chunks
  
  divisor <- length(word.nodes)/100
  max.length <- length(word.nodes)/divisor
  x <- seq_along(word.nodes)
  chunks.l <- split(word.nodes, ceiling(x/max.length))
  
  
  # set up a loop to process each chunk produced by preceding code in matrix 
  
  # set up list to store results of processsing 
  sWord.nodes.l <- list()
  
  
  # extract sWord elements from each chunk
  for (k in 1:length(chunks.l)) {
    
    sWord.nodes.l[[k]] <- sapply(chunks.l[[k]], xmlChildren)
    
    
    
    # create vector object to hold results
    combined.content <- NULL
    
    # set increment counter to 1
    m <- 1
    
    
    for (m in 1:length(sWord.nodes.l[[k]])) {
      
      
      # extract sWord nodes for 1 token at a tiime; result is an XML list object with content which
      # includes sWord xml tags.
      
      single.token <- sWord.nodes.l[[k]][m]
      
      # strip sWord level xml tags from data; result is a xml list object
      content.nodes <- sapply(single.token[[1]], xmlChildren)
      
      
      
      # create vector for output
      extracted.content.v <- NULL
      
      # set increment counter to 1
      n <- 1
      
      # iterate loop through each successive content.nodes object produced by matrix loop
      for (n in 1:length(content.nodes)) {
        
        # add successively extracted content to vector
        extracted.content.v <- append(extracted.content.v, xmlValue(content.nodes[[n]]))
        
        
      }
      
      # collect output of nested loop in vector of all sWords for each token in chunk
      combined.content <- append(combined.content, extracted.content.v)
      
      
    }
    
    
    
    
    
    
    
    # change sWord.contents vector to lower case
    combined.content <- tolower(combined.content)
    
    # create a contingency table of sWord.contents. The table lists nuber of occurences for all sWords.
    sWord.table <- table(combined.content)
    
    # normalize sWord.table by dividing by total sWords. Multiply by 100 to produce rate of sWord occurence per 100 sWords.
    sWord.freq.table <- 100*(sWord.table/sum(sWord.table))
    
    # insert sWord.freq.table into list
    sWord.freq.table.list[[length(sWord.freq.table.list)+1]] <- sWord.freq.table
    
    
    
  }
  
  k <- 1
  
}    



# !! stop here for evaluation


str(sWord.freq.table.list)
length(sWord.freq.table.list)
lengths(sWord.freq.table.list)
sum(lengths(sWord.freq.table.list))

mean(lengths(sWord.freq.table.list))
summary(lengths(sWord.freq.table.list))
sWord.freq.table.list[[10]][1]


# convert to list of matrices


i <- 1

freqs.l <- list()

for (i in 1:length(sWord.freq.table.list)) {
  
  freqs.l[[i]] <-data.frame(sWord.freq.table.list[[i]], ID=i, 
                            stringsAsFactors=FALSE )
}


# convert to single matrix

freqs.df <- do.call(rbind, freqs.l)
#the result is a long form data frame

object.size(freqs.df)

# divide freqs.df into smaller data frames so that we can cross tabulate without running out of memory
z <- ceiling(nrow(freqs.df)/5)
freqs.df[z,]
indexA <- which(freqs.df[,3] == freqs.df[z,3])
freqs.df1 <- freqs.df[1:indexA[length(indexA)],]

z <- 2 * (ceiling(nrow(freqs.df)/5))
freqs.df[z,]
indexB <- which(freqs.df[,3] == freqs.df[z,3])
freqs.df2 <- freqs.df[(indexA[length(indexA)]+1):indexB[length(indexB)],]

z <- 3 * (ceiling(nrow(freqs.df)/5))
freqs.df[z,]
indexC <- which(freqs.df[,3] == freqs.df[z,3])
freqs.df3 <- freqs.df[(indexB[length(indexB)]+1):indexC[length(indexC)],]

z <- 4 * (ceiling(nrow(freqs.df)/5))
freqs.df[z,]
indexD <- which(freqs.df[,3] == freqs.df[z,3])
freqs.df4 <- freqs.df[(indexC[length(indexC)]+1):indexD[length(indexD)],]

z <- 1 + indexD[length(indexD)]
freqs.df[z,]
freqs.df5 <- freqs.df[z:nrow(freqs.df),]


# check sums
sum(nrow(freqs.df1), nrow(freqs.df2), nrow(freqs.df3), nrow(freqs.df4), nrow(freqs.df5)) == nrow(freqs.df)

# if sums are correct, clean memory
rm(freqs.df, chunks.l, doc.object, freqs.l, sWord.freq.table.list, sWord.nodes.l)

# make list of data frames as input for loop
freqs.df.list <- list()
freqs.df.list[[5]] <- freqs.df5


i <- 1
# run a loop to cross tablulate and save results
for (i in 1:5)  {
  
  result <- xtabs(Freq ~ ID+combined.content, data=freqs.df.list[[i]])
  save(result, file = paste("result", i, ".R", sep = ""))
  rm(result)
  
}


# or run xtab by hand
result1 <- xtabs(Freq ~ ID+combined.content, data=freqs.df1)
save(result1, file = "result1.R")
rm(result1)

result2 <- xtabs(Freq ~ ID+combined.content, data=freqs.df2)
save(result2, file = "result2.R")
rm(result2)

result3 <- xtabs(Freq ~ ID+combined.content, data=freqs.df3)
save(result3, file = "result3.R")
rm(result3)

result4 <- xtabs(Freq ~ ID+combined.content, data=freqs.df4)
save(result4, file = "result4.R")
rm(result4)

result5 <- xtabs(Freq ~ ID+combined.content, data=freqs.df5)
save(result5, file = "result5.R")
rm(result5)
# remove data frames to free up memory
rm(freqs.df1, freqs.df2, freqs.df3, freqs.df4, freqs.df5)

dim(result5)

# reopen saved files and convert to data frames 

load(file = "result5.R")

rm(result5)

final.df <- as.data.frame.matrix(result1)

final.df2 <- as.data.frame.matrix(result5)

final.df <- rbind(final.df, final.df2)

object.size(final.df)

rm(final.df2)

# remove .xml suffix  from file names and store result in vector for generation of row labels
bookids.v <- gsub(".xml", "", files.v)


# these loops  will create a vector of the proper id tags

# this loop gives us the number of chunks from each file and stores the results in chunk.total
# note that chunk length must be same as in the above extraction loop
chunk.total <- NULL

i <- 1

for (i in 1:length(files.v))  {
  
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  # extract all <word> elements and children into XmlNodeList object
  word.nodes <- getNodeSet(doc.object, "//word")
  
  # here we must split files into chunks
  
  divisor <- length(word.nodes)/100
  max.length <- length(word.nodes)/divisor
  x <- seq_along(word.nodes)
  chunks.l <- split(word.nodes, ceiling(x/max.length))
  
  chunk.total <- append(chunk.total, length(chunks.l))
  
  
  
}

# check to make sure final.df has correct number of rows
sum(chunk.total) == nrow(final.df)






# this series of nested loops uses chunk.total to produce a vector (ID.holder) containing the correct set of chunk
#identifier tags






i <- 1
chunk.number <- NULL
ID.holder <- NULL
n <- 1



for (i in 1:length(chunk.total)) {
  
  chunk.number <- seq_along(1:chunk.total[i])
  # chunk.number corresponds to the different file names to used in row IDs
  
  for (j in 1:length(chunk.number)) {
    
    single.name <- paste(bookids.v[i], chunk.number[j], sep = "-", collapse = NULL)
    ID.holder <- append(ID.holder, single.name)
    n <-n+1
    
  }
  
  j <- 1
  
}

# replace row names in final.df with names of chunks from ID.holder

row.names(final.df) <- ID.holder

# take a look
View(final.df[, 1:5])

# free up some memory
rm(final.df2, freqs.df1, freqs.df2, freqs.df3, freqs.df4, freqs.df5)

#reduce the feature set

# extract the mean of each column; slice the file so that only a portion is processed at one time to allow sufficient memory
freq.means.v6 <- colMeans(final.df[,400001:425022])

#combine the freq.means.v vectors into one vector
freq.mean.v <- append(freq.means.v1, c(freq.means.v2, freq.means.v3, freq.means.v4, freq.means.v5, freq.means.v6))

#collect column means of a given magnitude
keepers.v <- which(freq.mean.v >=.005)



#use keepers.v to make a smaller data frame object for analysis
smaller.df <- final.df[, keepers.v]


dim(smaller.df)




# order columns by column mean, largest to smallest and create object with results
ordered.df <- smaller.df[, order(colMeans(smaller.df), decreasing=TRUE)]
View(ordered.df)



#save data frame object to .csv file
write.csv(ordered.df, file = "Results_Nov-2016/AllGreekFiles_100tokens_Nov-24.csv")
save(final.df, file = "Results_Nov-2016/AllGreekFiles_100tokens_Nov-24.R")

# memory should be scribbed and a sWord-levels_classification script run
rm(final.df, freq.means.v1,  freq.means.v2, freq.means.v3, freq.means.v4, freq.means.v5, freq.means.v6 )


