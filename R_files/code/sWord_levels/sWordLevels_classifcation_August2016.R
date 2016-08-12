

# script to test svm classification

require(e1071)
require(gmodels)
require(klaR)

# rename ordered.df as smaller.df to fit in following script
smaller.df <- ordered.df

# remove ordered.df from memory
rm(ordered.df)



chunk.ratios.m <- read.csv(file="Rresults/matrices/sWordLevels_Sample_25tokens_rowNames.csv", stringsAsFactors = FALSE, header = TRUE)
chunk.ratios.m[,2]
View(chunk.ratios.m)


# we must have a list naming the author for each chunk; this should be automated
# author.factor <- NULL
# author.factor <- append(author.factor, rep("Thucydides", 24))

# read in author.v for list of levels
author.factor <- chunk.ratios.m[, 1]
unique(author.factor)

svm.results.l <- list()
svm.error.matrix.l <- list()
testing.classes.l <- list()

i <- 1


for (i in 1:100) {
  
  
  
  #create vector of random integers = 10% of obs in smaller.df
  testing.index.v <- sample (seq (1, nrow(smaller.df)), 260, prob = chunk.ratios.m[, 2])
  
  
  #create training and testing data matrices using testing.index.v and its inverse
  testing.data <- smaller.df[testing.index.v, ]
  training.data <- smaller.df[-testing.index.v, ]
  
  #create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
  training.classes <- as.factor(author.factor[-testing.index.v])
  testing.classes <- as.factor(author.factor[testing.index.v])
  
  
  model.svm <- svm(training.data, training.classes, kernel = "linear", scale = FALSE)
  
  svm.results.l[[i]] <- predict(model.svm, testing.data)
  svm.error.matrix.l[[i]] <- errormatrix(testing.classes, svm.results.l[[i]])
  
  
  
}


#combine all matrices contained in err.matr.l into one matrix for export to .csv file
a <- do.call(rbind, svm.error.matrix.l)

View(a)

sum(a[,7])


sum(a[,7])/2

10000-(sum(a[,6])/2)

(26000-(sum(a[,7])/2))/26000


length(svm.error.matrix.l)
svm.error.matrix.l[[1]]
svm.results.l[[1]]
recheck <- svm(training.data, training.classes, kernel = "linear", scale = FALSE)

predict(model.svm, testing.data)


predict(recheck, testing.data)

10000-323
write.csv(a, file="Rresults/svmError_matrix_2022Vasr_Sample_50tokens_Aug-2-2016.csv")

retest <- naiveBayes(smaller.df, author.factor)
predict(retest, testing.data)


retest
str(retest)


save(svm.error.matrix.l, file="Rresults/svm_predictions/svmErrorMatrix_Sample_50token_Aug-2-2016.R")




