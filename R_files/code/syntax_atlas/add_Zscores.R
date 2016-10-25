

smaller.m
zscores.m <- scale(smaller.m)
zscores.m <- scale(ordered.df)

# combine the two matrices by columns
m <- cbind(smaller.m, zscores.m)

m <- cbind(rawOrdered.df, ordered.df, zscores.m)
m[, 990:1000]

dim(m)

# Reorder the columns to interleave them
# the concatinate function -- c() -- appatently conjoins rows 1 and 2 of each column
m <- m[, c(matrix(1:ncol(m), nrow = 2, byrow = T))]  
m <- m[, c(matrix(1:ncol(m), nrow = 3, byrow = T))] 


# make matrix of labels for columns
label.a <- matrix(rep("Rel. Freq. per 100 tokens", 1000), ncol = 1000)
label.b <- matrix(rep("Z-Score", 1000), ncol = 1000)

# combine matrices
labels.ab <- cbind(label.a, label.b)
# reorder columns to interleave

index <- c(matrix(1:ncol(labels.ab), nrow = 2, byrow = TRUE))
labels.ab <- labels.ab[, index]
labels.ab <- matrix(labels.ab, nrow = 1)

# loop to make rank labels
i <- 1
rank <- NULL
for (i in 1:1000)  {
  rank <- append(rank, rep(i, 2))
  
  
}

# convert "rank" to matrix
rank.m <- matrix(rank, nrow = 1)

#combine the label matrices by row
combined.m <- rbind(rank.m, labels.ab)
combined.m <- rbind(combined.m, m)


# save as csv file
write.csv(combined.m, file = "working_output1/rel_pos_1-Level_withZ-Scores_Oct-24-2016_1243AM.csv")
