
# This script creates a list of lists which contains the @cite information for
# each sWord; the information is divided into chunks that should correspond to
# the chunks created for classification prediction PROVIDED THE CHUNK SIZE IS THE SAME.

library(XML)
library(stylo)
source("code/corpusFunctions.R")
input.dir <- "../rel_pos_prose"
files.v <- dir(path=input.dir, pattern=".*xml")


# this loop creates a list ("cite.l") which contains metadata for each sWord in each file

#create an emty list to contain data
cite.l <- list()

for(i in 1:length(files.v)){
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE) # create object containing xml for each file
  chunk.size <-1000 # set size of chunks into which to divide file
  sword.cite <- getNodeSet(doc.object, "//sWord/@cite") # extract @cite attribues from each sWord element in file
  cite.v <- paste(sword.cite, collapse=NULL) # extract content from the @cite attribues
  
  
  divisor <- length(cite.v)/chunk.size 
  max.length <- length(cite.v)/divisor
  x <- seq_along(cite.v)
  
  
  cite.l[[i]] <- split(cite.v, ceiling(x/max.length))
  
  
}

summary(cite.l)


# the following loop creates vector object "xyz" containing metadata for first sWord in each chunk
# object "chunk.name.l" redundantly holds metadata for first and last sWord in each chunk, along with number of sWords in chunk


# set increment counter and create empty objects to be used by loop:
i <- 1
holder.l <- list()
chunk.name.l <- list()
xyz <- NULL # this vector hold the chunk names for later use.
metadata.l <- list()

for (i in 1:length(files.v)) {
  j <- 1
  for (j in j:length(cite.l[[i]])) {
    holder.l <- cite.l[[i]][j]
   
    
    xyz <- append(xyz, holder.l[[1]][1])
    metadata.l[[i]] <- append(xyz, holder.l[[1]][1])
   chunk.name.l[[i]] <- rbind(df, c(holder.l[[1]][1], holder.l[[1]][length(holder.l[[1]])], length(holder.l[[1]])))
    
  }
  
  
}



# a loop create list of files names for all chunks to be extracted. This loop uses object "xyz" as basis.


authors.v <-  gsub(" ", "_", xyz) # replace white spance with underscores
authors.v <- gsub("\\.|:", "", authors.v) # eleminate dots and colons
suffix <- ".txt" # create object with suffix for text files





# function to remove white space
underscore.f <- function(x) {
  gsub(" ", "_", x)
  
}

metadata.l <- lapply(metadata.l, underscore.f)

#function to eliminate dots and colons

dots.f <- function(x) {
  gsub("\\.|:", "", x)
  
}

metadata.l <- lapply(metadata.l, dots.f)


# function to add suffix
suffix.f <- function(x) {
  paste(x, suffix, sep="")
  
  
}

metadata.l <- lapply(metadata.l, suffix.f)

metadata.l[[1]]

# create vector object to contain file names for each chunk created by the appropriate loop
names_for_chunks <- NULL

# set incrementizer to 1
i <-1
for (i in 1:length(authors.v)) {
  
  names_for_chunks <- append(names_for_chunks, paste(authors.v[i], suffix, sep=""))
  
  
}




# the next step is to extract sWord content for each chunk created above


# the following script extracts the sword content from each chunk

sWord.l <- list() # create empty list object to contain output
i <- 1 # set incrementizer to 1
for(i in 1:length(files.v)) {
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE) # make R object of xml file
  chunk.size <-1000 # set chunk size
  sword.content <- getNodeSet(doc.object, "//sWord") # create vector and populate with <sWord> elements
  sWord.v <- paste(sapply(sword.content, xmlValue), sep=" ", collapse=NULL) # populate vector with content of sWord elements
  sWord.v <- tolower(sWord.v) # change contents of vector to lower case
  
  
  divisor <- length(sWord.v)/chunk.size
  max.length <- length(sWord.v)/divisor
  x <- seq_along(sWord.v)
  
  
  sWord.l[[i]] <- split(sWord.v, ceiling(x/max.length))
  
  
}

str(sWord.l[[2]][1])


# the following loop associated chunk contents with metadata and writes chunks as text files to disk

i <- 1
for (i in 1:length(sWord.l)) {
  
  
  
  
  
}






