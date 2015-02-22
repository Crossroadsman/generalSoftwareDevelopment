# Merging Data
# See: http://www.statmethods.net/management/merging.html

# Adding Columns
# To merge two data frames horizontally, use the merge function.
# In most cases, you join two data frames by one or more key variables (i.e., an "inner join")

# merge two data frames by ID
total <- merge(data frameA, data frameB, by ="ID")

# merge two data frames by ID and Country
total <- merge(data frameA, data frameB, by = c("ID", "Country"))



# Adding Rows
# To join two data frames vertically, use the rbind function. 
# The two data frames must have the same variables, but they do not need to be in the same order.
total <- rbind(data frameA, data frameB)

# If the dataFrame A has variables missing from dataFrame B then two options:
#   1. delete the extra variables in frame A (subset); or
#   2. create the additional variables in B and set them to NA before joining.


# To delete some columns from the dataset, you can use the following:
> dat <- mtcars
> colnames(dat)
[1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
[11] "carb"
> dat[,c("mpg","cyl","wt")] <- list(NULL)
> colnames(dat)
[1] "disp" "hp"   "drat" "qsec" "vs"   "am"   "gear" "carb"
# You can refer to unnamed columns as "X.1", "X.2", etc

# To add headings
#1. create a vector of headings (where the length of the vector is the same as number of columns in the dataset):
headings <- c("name", "address", "etc")
#2. name the dataset columns with the vector
names(mydataframe) <- headings

# Maybe you got factors instead of numbers in a column?
# you can check by asking:
class(mymerge$Rank)
# if column Rank is factors instead of numbers, you can do this:
mymerge$Rank <- as.numeric(as.character(mymerge$Rank))


