# R tips and tricks on subsetting

# Some of the examples use the builtin iris dataset:
library(datasets)
data(iris)
iris

# First of all, subset sucks. It's a convenience function only and thus cannot be used in scripts, see the subset documentation
# Therefore, we have to get good at using [, [[ and $.

# Here is a way to pick a subset of variables to make a smaller data.frame
alldata <- iris
myvariables <- c("Sepal.Length", "Petal.Length")
mydata <- iris[myvariables]

# Here is another way to pick a subset of variables, using a range instead of named variables
alldata <- iris
mydata <- iris[c(1, 3:4)]


