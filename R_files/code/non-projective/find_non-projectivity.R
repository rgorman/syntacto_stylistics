
# Script to find non-projective sentences
require(XML)

doc.object <- xmlTreeParse(file = "../Projectivity/projectivity_test1.xml")


top <- xmlRoot(doc.object)
top[[4]][["word"]]
top[["sentence"]]
names(top)
xmlName(top)
names(top[[4]])
length(names(top[[4]]))

geodesics.list <- xmlApply(top[[4]], xmlValue)
length(geodesics.list)
geodesics.v <- NULL
i <- 1

for (i in 1:length(geodesics.list)) {
  a <- geodesics.list[[i]]
  b <- unlist(strsplit(a, " "))
  c <- as.numeric(b)
  geodesics.v <- append(geodesics.v, c)
  
  
}


geodesics.list2 <- list()
i <- 1

for (i in 1:length(geodesics.list)) {
  a <- geodesics.list[[i]]
  b <- unlist(strsplit(a, " "))
  c <- as.numeric(b)
  geodesics.list2[[i]] <- c
  
}

geodesics.list3 <- list()
i <- 1

for (i in 1:length(geodesics.list)) {
  a <- geodesics.list[[i]]
  b <- unlist(strsplit(a, " "))
  c <- sort(as.numeric(b))
  geodesics.list3[[i]] <- c
  
}


length(geodesics.list2[[1]])

top[[4]]
geodesics.v
subroots <- sort(unique(geodesics.v))

b <- geodesics.list[[1]]
c <- unlist(strsplit(b, " "))
d <- as.numeric(c)

sum(b)
unlist(a)

class(a)
a <- 1

is.vector(a)

str(a)

class(as.vector(a))

lapply(geodesics.list, strsplit, " ")
geodesics.list2 <- lapply(geodesics.list, as.numeric(unlist(strsplit, " ")))
unlist(geodesics.list2[[1]][1])

which(names(top) =="sentence")
min(which(names(top) =="sentence"))
max(which(names(top) =="sentence"))
