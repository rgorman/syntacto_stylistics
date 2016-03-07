# Script to find Dependency Distance for words and sentences.

require(XML)

# this line reads an XML file into an R object
doc.object <- xmlTreeParse(file = "../Projectivity/projectivity_test1.xml")



# this line reads doc.object into an XML Node object which can be accessed through subsetting
top <- xmlRoot(doc.object)

# for example, this line accesses the second word of the first sentence (there are 3 other elements before sentence 1)
top[[4]][2]

xmlGetAttr(a, "lemma")

a <- top[[4]][2]

a <- xmlNode(top[[4]][2])
a
class(a)
xmlAttrs(top[[4]][1])

getNodeSet(top[[4]], "//word[1]")


xmlApply(top[[4]], function(x) xmlGetAttr(x, "head"))
