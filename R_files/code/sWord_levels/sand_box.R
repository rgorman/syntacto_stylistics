
y[[1]][1]


sWord.nodes <- sapply(y[[1]], xmlChildren)
sWord.nodes
sWord.contents <- append(sWord.contents, paste(sapply(sWord.nodes[[1]][1], xmlValue), collapse = NULL))
xmlValue(sWord.nodes[[1]])

tester <- NULL
tester <- append(tester, xmlValue(sWord.nodes[[1]]))


sWord.nodes.l[[1]][1]
y <- sWord.nodes.l[[1]][1]
length(sWord.nodes.l[[1]][1])

sapply(sWord.nodes.l[[1]][1], xmlValue)
y
sWord.nodes[[1]]
xmlValue(sWord.nodes[[1]])

class(tester)






# the following nested loops extract the content from sWord elements

# create vector object to hold results
combined.content <- NULL

# set increment counter to 1
m <- 1

# loop for number of tokens in chunk (= length of sWord.nodes.l[[1]])
for (m in 1:length(sWord.nodes.l[[1]])) {
  
  # extract sWord nodes for 1 token at a tiime; result is an XML list object with content which
  # includes sWord xml tags.
  
  single.token <- sWord.nodes.l[[1]][m]
  
  # strip sWord level xml tags from data; result is a xml list object
  content.nodes <- sapply(single.token[[1]], xmlChildren)
  
  # create a loop to convert the content of the xml list object to a character vector
  # xmlValue extracts the data and append puts them in a vector
  
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

y
extracted.content.v
content.nodes
length(content.nodes)
xmlValue(content.nodes[[n]])
combined.content[length(combined.content)]
     


# !! begin here for test of script for chunks of sWord levels

library(XML)

source("code/corpusFunctions.R")
input.dir <- "../sWord_levels/files_with_sWords/VG_files"
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
  
  divisor <- length(word.nodes)/2000
  max.length <- length(word.nodes)/divisor
  x <- seq_along(word.nodes)
  chunks.l <- split(word.nodes, ceiling(x/max.length))
  
  
  # set up a loop to process each chunk produced by preceding code in matrix loop
  
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



#this function is applied to a list of lists of tables to convert to matrix
my.apply2 <- function(x){
  my.list <-mapply(data.frame, 
                   x, SIMPLIFY=FALSE,
                   MoreArgs=list(stringsAsFactors=FALSE))
  my.df <- do.call(rbind, my.list)
  return(my.df)
}

sWord.freq.table.list[[1]][1:10]
freqs.l[[1]][1:10]

freqs.l <-data.frame(sWord.freq.table.list[[1]], ID=seq_along(sWord.freq.table.list[[1]]), 
                     stringsAsFactors=FALSE )

i <- 1
for (i in 1:length(sWord.freq.table.list)) {
  
  freqs.l[[i]] <-data.frame(sWord.freq.table.list[[i]], ID=seq_along(sWord.freq.table.list[[i]]), 
                       stringsAsFactors=FALSE )
}


names(freqs.l[[1]])
row.names(freqs.l)
seq_along(sWord.freq.table.list[[1]])
View(freqs.l[[2]])

summary(sWord.freq.table.list)
names(sWord.freq.table.list[[1]])
freqs.l <- list()

#convert list into matrix object
#this code requires the user defined function "my.apply"
freqs.l <- lapply(sWord.freq.table.list, my.apply2)

summary(freqs.l)

freqs.df <- do.call(rbind, freqs.l)
#the result is a long form data frame

lengths(sWord.freq.table.list)
freqs.df[4070:4080,]

View(freqs.df)

dim(freqs.df)

# create .csv file for inspection (very optional!!)
write.csv(freqs.df, file="sWord_output/inspect1.csv")

#make name labels for the file
bookids.v <- gsub(".xml.\\d+", "", rownames(freqs.df))



      
lengths(sWord.freq.table.list)
         
         
   rm(list = ls())      
         