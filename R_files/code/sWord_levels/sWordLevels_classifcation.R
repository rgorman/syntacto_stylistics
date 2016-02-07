

# script to test svm classification


chunk.ratios.m <- read.csv(file="Rresults/matrices/chunk_ratios_500.csv", stringsAsFactors = FALSE)
chunk.ratios.m[,2]


# we must have a list naming the author for each chunk; this should be automized
author.factor <- NULL
author.factor <- append(author.factor, rep("Thucydides", 48))


short.chunks.index <- c(5,21,35,40,46,62,64,78,82,91:94)
no.short.smaller.df <- smaller.df[-(short.chunks.index),]
nrow(no.short.smaller.df)


svm.results.l <- list()
svm.error.matrix.l <- list()
testing.classes.l <- list()

i <- 1


for (i in 1:1000) {
  
  
  
  #create vector of random integers = 10% of obs in smaller.df
  testing.index.v <- sample (seq (1, nrow(smaller.df)), 35, prob = chunk.ratios.m[, 2])
  
  
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

sum(a[,6])


sum(a[,6])/2

10000-(sum(a[,7])/2)

(35000-(sum(a[,6])/2))/35000


length(svm.error.matrix.l)
svm.error.matrix.l[[1]]
svm.results.l[[1]]
recheck <- svm(training.data, training.classes, kernel = "linear", scale = FALSE)

predict(model.svm, testing.data)


predict(recheck, testing.data)

10000-323
write.csv(a, file="Rresults/svmError_matrix_500_Feb-6-2016.csv")

retest <- naiveBayes(smaller.df, author.factor)
predict(retest, testing.data)


retest
str(retest)


save(svm.error.matrix.l, file="Rresults/svm_predictions/svmErrorMatrix_Oct25.R")





#create vector of random integers = 10% of obs in smaller.df
testing.index.v <- sample (seq (1, 90), 10, prob=chunk.ratios.m[1:90,2])


#create training and testing data matrices using testing.index.v and its inverse
testing.data <- smaller.df[testing.index.v, ]
training.data <- smaller.df[-testing.index.v, ]

#create vectors of factors giving classes (here = authors) of each row in testing.data and training.data
training.classes <- as.factor(author.factor[-testing.index.v])
testing.classes <- as.factor(author.factor[testing.index.v])


model.svm <- svm(training.data, training.classes, kernel = "linear")

svm.results.l[[i]] <- predict(model.svm, testing.data)
svm.error.matrix.l[[i]] <- errormatrix(testing.classes, svm.results.l[[i]])




predicted

errormatrix(testing.classes, predicted)

author.factor
