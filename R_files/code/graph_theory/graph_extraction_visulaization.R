
require(igraph)

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

