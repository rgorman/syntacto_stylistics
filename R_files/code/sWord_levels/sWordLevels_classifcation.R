

# script to test svm classification


chunk.ratios.m <- read.csv(file="Rresults/matrices/chunk_ratios_94per2000.csv", stringsAsFactors = FALSE)
chunk.ratios.m[1:90,2]

author.factor <- NULL
author.factor <- append(author.factor, rep("Xenophon", 4))


svm.results.l <- list()
svm.error.matrix.l <- list()
testing.classes.l <- list()

i <- 1


for (i in 1:1000) {
  
  
  
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
  
  
  
}


#combine all matrices contained in err.matr.l into one matrix for export to .csv file
a <- do.call(rbind, svm.error.matrix.l)

View(a)

sum(a[,7])

10000-413
write.csv(a, file="Rresults/svmError_matrix_Feb-6-2016.csv")




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
