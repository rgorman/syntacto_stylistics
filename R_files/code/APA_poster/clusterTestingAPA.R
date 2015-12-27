library(XML)
library(tm)
library(dendextend)

source("code/corpusFunctions.R")

# input from  files (location: C:\Users\rgorm\Documents\syntacto_stylistics\Leipzig_Dec15\rel_pos_files)
input.dir <- "../Leipzig_Dec15/rel_pos_files"
files.v <- dir(path=input.dir, pattern=".*xml")




book.freqs.l <- list ()
for (i in 1:length(files.v)) {
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  swords <-getNodeSet(doc.object, "//sWord", )
  sword.content <- paste(sapply(swords, xmlValue), collapse = NULL)
  sword.content <-tolower(sword.content)
  book.freqs.t <-table(sword.content)
  book.freqs.rel.t <- 100*(book.freqs.t/sum(book.freqs.t))
  
  book.freqs.l[[files.v[i]]] <-book.freqs.rel.t
  
}




#function to make n-grams of sword elements ; takes uploaded xml file as argument (called "doc.object)
#use xmlTreeParse to generate "doc.object"
getSwordNgramTableList <- function(doc.object) {
  swords <-getNodeSet(doc.object, "//sWord", )
  sword.content <- paste(sapply(swords, xmlValue), collapse = NULL)
  sword.ngrams <- make.ngrams(sword.content, ngram.size=1)
  sword.ngrams <-tolower(sword.ngrams)
  book.freqs.t <-table(sword.ngrams)
  book.freqs.rel.t <- 100*(book.freqs.t/sum(book.freqs.t))
  
  return(book.freqs.rel.t)
}







#converting an R list into a Data Matrix
freqs.l <- mapply(data.frame, ID=seq_along(book.freqs.l),
                  book.freqs.l, SIMPLIFY=FALSE, MoreArgs=list(stringsAsFactors=FALSE))


freqs.df <- do.call(rbind, freqs.l)

# check names of data frame to provide parameters for conversion to wide format table
names(freqs.df)

#convert from long form table to wide format
result <- xtabs(Freq ~ ID+sword.content, data=freqs.df)

#convert wide format table to matrix object
final.m <- apply(result, 2, as.numeric)

dim(final.m)

# make names for rows
names_for_files.v <- gsub (".xml", "", files.v)


#substitute files names for row numbers
rownames(final.m) <-names_for_files.v

rownames(final.m)



dim(final.m)

#reduce data matrix to features with largest means (most common features)
smaller.m <- final.m[, apply(final.m,2,mean)>=.0025]

#check size of reduced feature set
dim(smaller.m)


#create distance object as input to hclust algorithm. Possible methods are "euclidian", "maximum", "manhattan", "canberra", "binary" or "minkowski". Default is "euclidian".
dist.smaller.m <- dist(smaller.m)


# run hclust and get result in object (available methods are "ward.D", "ward.D2", "single", "complete" "average", "mcquitty", "median", or "centroid")
groups <- hclust(dist.smaller.m, method="ward.D2")

# plot the results
plot(groups, hang=-1, xlab="Perseus Treebank")


