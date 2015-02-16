## List
library(datasets)
data(mtcars)

numbers <- c(1, 2, 3, 5)
chars <- c("a", "l", "e", "x", "alex")
df <- mtcars

stuff <- list(numbers, chars, df)

stuff[1] # returns the numbers vector
stuff[3] # returns the data frame
