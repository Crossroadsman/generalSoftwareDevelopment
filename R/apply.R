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





