# R tips and tricks on subsetting

# Some of the examples use the builtin iris dataset:
library(datasets)
data(iris)
iris

# First of all, subset sucks. It's a convenience function only and thus cannot be used in scripts, see the subset documentation
# Therefore, we have to get good at using [, [[ and $.

## Selecting (aka keeping) Variables
# Here is a way to pick a subset of variables to make a smaller data.frame
alldata <- iris
myvariables <- c("Sepal.Length", "Petal.Length")
mydata <- iris[myvariables]

# Here is another way to pick a subset of variables, using a range instead of named variables
alldata <- iris
mydata <- iris[c(1, 3:4)]

## Selecting Observations (rows)
# Here is an easy way to select the first 5 observations
shortdata <- alldata[1:5,]

# Here is a way to select based on variable values:
portiondata <- alldata[ which(alldata$Species == "virginica" & alldata$Sepal.Length < 7.0), ]

# Logical subsetting
x[(x$var1 <= 3 & x$var3 > 11),]

# Dealing with missing values
X[which(X$var2 > 8),]

# Sorting

sort(X$var1)
sort(X$var1, decreasing = TRUE) # reverse order

# Ordering

x[order(x$var1),]
x[order(x$var1, x$var2),] # sort by var1 then by var 2


