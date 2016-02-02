library(XML)

source("code/corpusFunctions.R")
input.dir <- "../sWord_levels/files_with_sWords/VG_files"
files.v <- dir(path=input.dir, pattern=".*xml")






# The following loop extracts the sWords from each file in the given directory and inserts them as character vectors
# into the appropriate element in a list object.

# set incremental varaible to 1
i <- 1

# create list object with no content. Vectors extracted from XML files will be stored here.
sWord.freq.table.list <- list()

for (i in 1:length(files.v))  {
  
  # read xml structure from file to .R object
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[1]), useInternalNodes=TRUE)
  # extract all <word> elements and children into XmlNodeList object
  word.nodes <- getNodeSet(doc.object, "//word")
  
  # here we must split files into chunks
  
  divisor <- length(word.nodes)/2000
  max.length <- length(word.nodes)/divisor
  x <- seq_along(word.nodes)
  chunks.l <- split(word.nodes, ceiling(x/max.length))
  chunks.l[[1]][1]
  sWord.nodes[[1]]
  length(sWord.nodes)
  
  sWord.nodes.l <- list()
  # construct a loop to extract sWord elements
  for (k in 1:length(chunks.l)) {
    
    sWord.nodes.l[[k]] <- sapply(chunks.l[[k]], xmlChildren)
    
    
  }
  
  
  
  
  
  # extract all <sWord> elements from word,nodes. The result is an XMLNodeList object.
  # sWord.nodes <- sapply(word.nodes, xmlChildren)
  
  
  # The following loop extracts contents of all <sWord> elements, i.e., extracts the sWords themselve srom the XML.
  
  # set incremetal variable for loop
  j <- 1
  
  # create vector object sWord,contents with no content.
  sWord.contents <- NULL
  
  for (j in 1:length(sWord.nodes)) {
    
    
    # extract contents of all <sWord> elements. Result is a charcter vector object.
    sWord.contents <- append(sWord.contents, paste(sapply(sWord.nodes[[j]], xmlValue), collapse = NULL))
    
    
  }
  
  # change sWord.contents vector to lower case
  sWord.contents <- tolower(sWord.contents)
  
  # create a contingency table of sWord.contents. The table lists nuber of occurences for all sWords.
  sWord.table <- table(sWord.contents)
  
  # normalize sWord.table by dividing by total sWords. Multiply by 100 to produce rate of sWord occurence per 100 sWords.
  sWord.freq.table <- 100*(sWord.table/sum(sWord.table))
  
  # insert sWord.freq.table into list
  sWord.freq.table.list[[i]] <- sWord.freq.table
  
}





#the following script calls the user-defined function "getSwordChunkMaster).
#this function will return a list of lists of tables, each table with a maximum of words = the second variable

book.freqs.l <- list()
for(i in 1:length(files.v)){
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  chunk.data.l <- getSwordChunkMaster(doc.object, 2000)
  book.freqs.l[[files.v[i]]] <-chunk.data.l
  
}






summary(book.freqs.l)
freqs.l <- list()

#convert list into matrix object
#this code requires the user defined function "my.apply"
freqs.l <- lapply(book.freqs.l, my.apply)

summary(freqs.l)

freqs.df <- do.call(rbind, freqs.l)
#the result is a long form data frame

dim(freqs.df)

# create .csv file for inspection (very optional!!)
write.csv(freqs.df, file="sWord_output/inspect1.csv")

#make name labels for the file
bookids.v <- gsub(".xml.\\d+", "", rownames(freqs.df))




#make book-with-chunk id labes

book.chunk.ids <- paste(bookids.v, freqs.df$ID, sep="_")


#replace the ID column in freqs.df
freqs.df$ID <- book.chunk.ids


#cross tabulate data
result.t <- xtabs(Freq ~ ID+Var1, data=freqs.df)
dim(result.t)

# read in index of short chunk row  numbers
short.chunks <- read.csv (file="Rresults/short_chunks2.csv")
View(short.chunks)
skip.v <-as.vector(short.chunks[,2])




# save original result.t
reserve.t <- result.t

# remove rows indicated by skip.v
result.t <- result.t[-skip.v,] 

dim(result.t)
dim(reserve.t)

#convert to a data frame
final.df <- as.data.frame.matrix(result.t)



#make author vector and strip work name and book numbers from it
author.v <- gsub("_.+", "", rownames(final.df))

head(author.v)
unique(author.v)
length(author.v)
author.v


#reduce the feature set
freq.means.v <- colMeans(final.df[, ])

#collect column means of a given magnitude
keepers.v <- which(freq.means.v >=.00015)


#use keepers.v to make a smaller data frame object for analysis
smaller.df <- final.df[, keepers.v]


dim(smaller.df)


# order columns by column mean, largest to smallest and create object with results
ordered.df <- smaller.df[, order(colMeans(smaller.df), decreasing=TRUE)]
View(ordered.df)

# reseve full ordered.df and smaller.df for backup
ordered.df.backup <- ordered.df
smaller.df.backup <- smaller.df

# reduce variables from ordered.df (180 for rel-pos files is the sweet spot)
smaller.df <- ordered.df[, 1:180]

View(smaller.df)
