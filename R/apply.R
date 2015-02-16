library(datasets)
## apply ##

# What and why does apply exist?

# from: https://nsaunders.wordpress.com/2010/08/20/a-brief-introduction-to-apply-in-r/
#
#   At any R Q&A site, you'll frequently see an exchange like this one:
#
#     Q: How can I use a loop to [...insert task here...]?
#     A: Don't. Use one of the apply functions

# Apply functions:
# apply     Apply functions over array margins
# by        Apply a function to a data frame split by factors
# eapply    Apply a function over values in an environment
# lapply    Apply a function over a list or vector
# mapply    Apply a function to multiple list or vector arguments
# rapply    Recursively apply a function over a list
# sapply    Like lapply but try to simplify the result
# tapply    Apply a function over a ragged array

# Note: "margin" is just fancy speak for rows or columns or rows and columns
# Note: "list" is a generic vector containing other objects. Think of it as an array that can have any object (number, string, arrays, data.frames, etc) as its elements.

## lapply
# lapply takes three arguments (1) a list "x", (2) a function (or the name of a function) "fun", (3) other arguments

# example:
x <- list(a = 1:5, b = rnorm(10)) # rnorm gives n random deviates in a normal distribution
lapply (x, mean)
# here the data input is the list x, and the function is mean so the output is a list, the same length as the input list, with the function applied to each of the members of the list

## apply
# apply is used to evaluate a function (often an anonymous one) over the margins of an array
# often used to apply a function to teh rows or columsn of a matrix

# example:
#x is an array
#1/2/ margins to keep (1 rows, 2 columns)
#function
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)

# for very large datasets there are some specialized quick col/row sums/means functions
rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)

# mapply
# a multivariate apply which applies a function in parallel over a set of arguments
#FUN is the function
#... contains args


# tapply
# used to apply a function over subsets of a vector.
# for example, you can use it to take group means
#x is a vector
#index is a factor or list of factors
#fun is a function
#example (using mtcars):

# with a data.frame listing cars, with mpg, cyl, etc variables:
# the first variable is the vector (the data range we want to actually apply the function to) so here we want to provide the mean of mpg values
# the second variable is the factor (the data range we want to group by, here by cylinders)
# the third variable is the function to apply (here mean)
tapply(mtcars$mpg, mtcars$cyl, mean) 

# an alternate way of expressing the same function is:
with(mtcars, tapply(mpg, cyl, mean))



