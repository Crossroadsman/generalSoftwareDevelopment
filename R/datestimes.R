## Dates and Times

# dates and times SUCK in R.

# R has developed a "special" representation of dates and times
#
# - Dates are represented by the Date class
# - Times are represented by the POSIXct or POSIXlt class
# - Dates are stored internally as the number of days since 1970-01-01
# - Times are stored internally as the number of seconds since 1970-01-01

# Dates are represented by the Date class and can be coerced from a character string using the as.Date() function.

y <- "1979-05-19"
yd <- as.Date(y)
y
yd
class(y)  # "character"
class(yd) # "Date"

# Times are represented using the POSIXct or POSIXlt class
#   - POSIXct is just a very large integer, useful when you want to store times in something like a data.frame
#   - POSIXlt is a list, which also stores other useful information like, day of week, day of the year, etc

# There are some generic functions that work on dates and times
#   - weekdays: give the day fo teh week
#   - months
#   - quarters

x <- Sys.time()
x
xc <- as.POSIXct(x)
xl <- as.POSIXlt(x)
xc
xl
class(xc)
class(xl)
names(unclass(xc))
names(unclass(xl))
xl$sec # 34.91126 (i.e., the number of seconds elapsed in the current minute)
xl[1] # same as just xl
xl$min # 14 (i.e., the current minute in the hour)
xl$gmtoff # -25200 (i.e., the number of seconds offset from GMT)

unclass(xc) #1424124875 (integer representing number of seconds since 1970-01-01)

# strptime
# for when the dates are in a different format
# the formatting strings are hard to remember so just lookup ?strptime to be reminded
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x

