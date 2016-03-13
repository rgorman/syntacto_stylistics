# script to extract part of speech metrics from treebank xml files.


require(XML)

# this line reads an XML file into an R object
doc.object <- xmlTreeParse(file = "../Projectivity/working/DD_Xen_Cyr1.xml")



# this line reads doc.object into an XML Node object which can be accessed through subsetting
top <- xmlRoot(doc.object)
top[[7]]

class(top[[7]][1])
a <- xmlSApply(top[[7]], function(x) xmlGetAttr(x, "postag"))
as.vector(a)
grep("v", a)
grep("u---", a)


xmlGetAttr(top[[7]][1], "postag")

# A loop to extract @head and @id attributes from word elements and use them to compute Dependency Distance.
# The loop should start with the subset of "top" which represents the first sentence element.

# wrapper varaibles for processing
a <- NULL
b <- NULL
c <- NULL
d <- NULL
# Sets increment variable to first <sentence> element in file.
i <- 7

for (i in i:length(top))  {
  
  # uses xmlSApply() to loop through the <word> elements of each sentence.
  # xmlSApply() calls the function xmlGetAttr() and outputs a vector of contents of @head attributes.
  # The output is stored in variable "a". as.numeric() converts output from character vector to numbers
  a <- as.numeric(xmlSApply(top[[i]], function(x) xmlGetAttr(x, "head")))
  
  # The same extraction applied to the @id attribute of each <word> element.
  # The result is stored in variable "b".
  b <- as.numeric(xmlSApply(top[[i]], function(x) xmlGetAttr(x, "id")))
  
  # These lines use which() to remove @head=0 items from "a" and "b".
  # The results are stored in variables "c" and "d".
  c <- a[-which(a == 0)]
  d <- b[-which(a == 0)]
  
  # Uses addAttributes() to add @DepDist attribute and value to each <seentence> element in "top".
  # Computes mean of absolute value of difference of corresponding @head and @id
  # from vectors in variables "c" and "d". Result is rounded to 4 decimal places.
  top[[i]] <- addAttributes(top[[i]], DepDist = round(mean(abs(c-d)),4))
  
  
}







#############################################
#remove objects from memory
rm(list = ls())
