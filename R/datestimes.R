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


# Operations on dates and times
x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x - y # gives an error because x and y are different classes:
class(x) # "Date"
class(y) # "POSIXlt" "POSIXt"
# but we can coerce x into a compatible format:
x <- as.POSIXlt(x)
x-y # Time difference of 356.2261 days


#even keeps track of leap years, leap seconds, daylight savings, and time zones.
# example:
x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x - y # Time difference of 2 days

xc <- as.POSIXct("2012-10-25 01:00:00")
yc <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
yc - xc # Time difference of -1 hours

xl <- as.POSIXlt("2012-10-25 01:00:00")
yl <- as.POSIXlt("2012-10-25 06:00:00", tz = "GMT")
yl - xl
