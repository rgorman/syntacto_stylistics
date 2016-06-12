# This script compares sWord levels and sWord geodesics to see how effective they are in supervised classification.

# clean workspace to ensure maximum working memory
rm(list = ls())


# load XML package
library(XML)

# load pre-written functions
source("code/corpusFunctions.R")

# input to object the path of the directory with the relevant xml files.  These files should contain all sWord Levels as separate children
# of <word> elements.
input.dir <- "../sWord_levels/files_with_sWords/VG_files"
# make vector of file names from input.dir
files.v <- dir(path=input.dir, pattern=".*xml")

# set increment to 1 for loop that will process each file
i <- 1

# create list object with no content. Vectors extracted from XML files will be stored here.
sWord.freq.table.list <- list()
geodesic.freq.table.list <- list()

for (i in 1:length(files.v)) {
  
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  
  # input all <word> elements into object "words"
  words <- getNodeSet(doc.object, "//word")
    
  # input all geodesics (i.e., full sWords) into object "geodesics".
  geodesics <- getNodeSet(doc.object, "//word/*[last()]")
  
  
  # here we  split object "words" into chunks; 
  
  divisor <- length(words)/1000 # this divisor indicates size of word chunks; the result it the real number representing
  # the number of x-length chunks in "words"
  
  # a wrapper for use in ceiling(); it is the same as the integer supplied above.
  max.length <- length(words)/divisor
  
  # create a vector of integers corresponding to each <word> element in "words"
  x <- seq_along(words)
  
  # create a list object of vectors each with no more than selected chunk size of words (the last vector in list will be smaller
  # unless the number of words in file is evenly divisible). The function ceililng() is used to ensure an integer for the argument of
  # the function split().
  chunks.l <- split(words, ceiling(x/max.length))
  
  
  # the following loop extracts content of the children of the <word> elements
  
  # set up list to store results of processsing 
  sWord.nodes.l <- list()
  
  
  for (j in 1:length(chunks.l)) {
    
    sWord.nodes.l[[j]] <- sapply(chunks.l[[j]], xmlChildren)
    
    
    
    
    # create vector object to hold results
    combined.content <- NULL
    
    # set increment counter to 1
    m <- 1
    
    
    for (m in 1:length(sWord.nodes.l[[j]])) {
      
      
      # extract sWord nodes for 1 token at a tiime; result is an XML list object with content which
      # includes sWord xml tags.
      
      single.token <- sWord.nodes.l[[j]][m]
      
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
        
        
        
      } # end of loop n
      
      # collect output of nested loop in vector of all sWords for each token in chunk
      combined.content <- append(combined.content, extracted.content.v)
      
      
    } # end of loop m
    
    
    
    
    
    
    
    # change sWord.contents vector to lower case
    combined.content <- tolower(combined.content)
    
    # create a contingency table of sWord.contents. The table lists nuber of occurences for all sWords.
    sWord.table <- table(combined.content)
    
    # normalize sWord.table by dividing by total sWords. Multiply by 100 to produce rate of sWord occurence per 100 sWords.
    sWord.freq.table <- 100*(sWord.table/sum(sWord.table))
    
    # insert sWord.freq.table into list
    sWord.freq.table.list[[length(sWord.freq.table.list)+1]] <- sWord.freq.table
    
    
    
    
  } # end of loop j
  
  # reset increment for loop
  j <- 1
  
} # end of loop i


length(sWord.freq.table.list[[2]])
sWord.freq.table.list[[1]][1-100]
