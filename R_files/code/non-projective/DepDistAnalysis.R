# script to extraxt DepDist from xm; file and store in vector object

require(XML)

# this line reads an XML file into an R object
doc.object <- xmlTreeParse(file = "../Projectivity/working/Result_DD_Combined.xml")




# this line reads doc.object into an XML Node object which can be accessed through subsetting
top <- xmlRoot(doc.object)
top[[7]]

###########################

# A loop to extract @head and @id attributes from word elements and use them to compute Dependency Distance.
# The loop should start with the subset of "top" which represents the first sentence element.

# wrapper varaibles for processing
a <- NULL
b <- NULL
c <- NULL
d <- NULL
# Sets increment variable to first <sentence> element in file.
i <- 7



for (i in i:length(top)) {
  a <- as.numeric(xmlGetAttr(top[[i]], "DepDist"))
  b <- append(b, a)
  
  c <- as.numeric(xmlGetAttr(top[[i]], "id"))
  d <- append(d, c)
  
}

which (is.na(b))


###############
# This section reads in time data on file and looks for correlations

time_dataframe <- read.csv(file = "../Projectivity/working/Times_Combined.csv")



View(time_dataframe)


# add dep dist column to data frame
time_dataframe$DepDist <- b

# add sentence numbers in top object to make sure sentences line up with depdist
time_dataframe$topSentNum <- d

# test for skewness
require(e1071)
skewness(time[index])
  
##############################
#######  here we run some test looking for correlations

colnames(time_dataframe)

# create vector objects to store variables for easier processing
time <- time_dataframe$depPerWord # our independent varaible
log_tiime <- log(time_dataframe$depPerWord) # log() of time to compensate for skew

# store dependent variable in vector for testing
depVar <- time_dataframe$DepDist 

# examine rough contours of data
summary(time)
summary(log_tiime)

# visualize data
hist(time)
hist(log_tiime)

# plot some data to see if any correlations are visible
plot(time_dataframe$depPerWord, time_dataframe$words)
lines(lowess(time_dataframe$depPerWord, time_dataframe$words), col="blue") # lowess line (x,y)

cor(time_dataframe$depPerWord, time_dataframe$words)
summary(time_dataframe$words)

plot(time_dataframe$depPerWord, time_dataframe$DepDist)
lines(lowess(time_dataframe$depPerWord, time_dataframe$DepDist), col="blue") # lowess line (x,y)

cor(time_dataframe$depPerWord, time_dataframe$DepDist)
summary(time_dataframe$DepDist)


plot(time[index], test_variable[index])
lines(lowess(time[index], test_variable[index]), col="blue") # lowess line (x,y)


# create vectors to simplify testing
time <- time_dataframe$depPerWord
test_variable <- time_dataframe$DepDist

hist(time)
hist(test_variable)

hist(test_variable[index])
hist(time[index])
# test for correlation
cor(time[index], test_variable[index])

summary(time)
summary(time[index])
summary(test_variable[index])

index <- which(time_dataframe$depPerWord < 3.63)

cor(time_dataframe$words, time_dataframe$DepDist)

#######################################
# this line will save file as .xml
saveXML(top, file = "../Projectivity/working/XXXX.xml", prefix = '<?xml version="1.0" encoding="UTF-8"?>\n')
# save dataframe to csv file
write.csv(time_dataframe, file = "../Projectivity/working/working_Combined.csv")

d

# clear all objects from memory
rm(list = ls())
