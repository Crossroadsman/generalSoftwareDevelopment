## List
# Note: "list" is a generic vector containing other objects. Think of it as an array that can have any object (number, string, arrays, data.frames, etc) as its elements.

# here is an example
library(datasets)
data(mtcars)

numbers <- c(1, 2, 3, 5)
chars <- c("a", "l", "e", "x", "alex")
df <- mtcars

stuff <- list(numbers, chars, df)

stuff[1] # returns the numbers vector
stuff[3] # returns the data frame
