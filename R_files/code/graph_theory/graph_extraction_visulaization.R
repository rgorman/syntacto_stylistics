# A script to extract data from treebanks and input it to igraph and associated routines.

require(igraph)
require(XML)

# this line reads an XML file into an R object
doc.object <- xmlTreeParse(file = "../graph_theory/source.xml")


# this line reads doc.object into an XML Node object which can be accessed through subsetting
top <- xmlRoot(doc.object)

length(top)
top[[1]]
top[[1]][1]
a <- xmlSApply(top[[1]], function(x) xmlGetAttr(x, "id"))
class(a)
a <- as.numeric(a)
b <- as.numeric(b)
b <- xmlSApply(top[[1]], function(x) xmlGetAttr(x, "head"))
c <- matrix(a, ncol = 1)
d <- cbind(c, b)

length(which(d[,2] > 0))
e <- matrix(nrow = length(which(d[, 2] >0)), ncol = 2)

e <- d[which(d[, 2] > 0), ]

class(e)
for (i in 1: nrow(d)) {
  if (d[i,2] > 0) {
    
    
  }

}


length(xmlSApply(top[[1]], function(x) xmlGetAttr(x, "id")))

i <- 7

for (i in i:length(top)) {
  a <- xmlSApply(top[[i]], function(x) xmlGetAttr(x, "postag"))
  a <- as.vector(a)
  # record number of verbs in vector "a"
  b <- length(grep("v", a))
  # record number of tokens in sentence less punctuation
  c <- length(a) - length(grep("u---", a))
  # ratio of number of verbs to total tokens (less punctuation)
  d <-append(d, b/c)
  # number of verbs in sentence
  e <- append (e, b)
  
}













########################

# read edge matrix in from csv file
a <- read.csv(file = "../graph_theory/testGraph_1.csv", header = FALSE)
b <- read.csv(file = "../graph_theory/testGraph_2.csv", header = FALSE)
a
b
plot.igraph(a.graph)
a.graph <- graph_from_edgelist(as.matrix(a), directed = FALSE)
a.tree <- as.tree
str(a)
as.matrix(a)
a.graph
delete.vertices(a.graph, 3)
a.tree <- as_tree(a.graph, root=2)
plot.igraph(a.tree)
class(a.graph)



# two steps to produce a tree graph from edge matrix
 
a.tree <- layout_(a.graph, as_tree(root = 2))           

class(a.tree)
plot(a.graph, layout = a.tree)


plot.igraph(a.graph)
b.graph <- graph_from_edgelist(as.matrix(b), directed = FALSE)
b.graph

b.tree <- layout_(b.graph, as_tree(root = 6))
plot(b.graph, layout = b.tree)

require(tkrplot)
tkplot(b.graph, layout = b.tree)
)

a.tree <- as_tree(a.graph, root=2)
plot.igraph(a.tree)
class(a.graph)


plot(a.graph, layout = as_tree(a.graph, root = 2))



a.tree <- layout_(a.graph, as_tree(root = 2))           

class(a.tree)
plot(a.graph, layout = a.tree)


# download arc diagram
require(devtools)

# download arcdiagram using "install_github'
install_github("arcdiagram", username = "gastonstat")

require(arcdiagram)

b.edges <- get.edgelist(b.graph)

arcplot(b.edges, las = 1, sorted = TRUE, lwd.arcs = 5)

