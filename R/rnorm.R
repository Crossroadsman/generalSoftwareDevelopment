# Generating random numbers

#rnorm
#   generate random Normal variates with a given mean and standard deviation
# rnorm(n, mean = 0, sd =1)
rnorm(100, 20, 2) # generates 100 variates with a mean of 20 and a SD of 2

#dnorm
#   evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)

#pnorm
#   evaluate the cumulative distribution function for a Normal distribution

#rpois
#   generate random Poisson variates with a given rate



# Typically probability distribution function usually have four associated functions, prefixed with:
# d - density
# r - random number generation
# p - cumulative distribution
# q - quantile function

# If ϕ is the cumulative distribution function for a standard Normal distribution, then:
# pnorm(q) = ϕ(q)
# and
# qnorm(p) = ϕ^-1 (p)


# Always set the random number seed when conducting a simulation.
set.seed(1)
rnorm(5)
rnorm(5) # different because takes the next 5 random numbers
set.seed(1) # resets the seed
rnorm(5) # gives the same output as the first call


# Generating Poisson data
rpois(10, 1) # 10 items with a rate of 1
ppois(2, 2) # cumulative distribution Pr(x <= 2)



# Generating random numbers from a linear model:
# Suppose we want to simulate from the following linear model
#       y = β0 + β1 + ε
#   where ε ~ N(0, 2^2). Assume x ~ N(0,1^2), β0 = 0.5, β1 = 2
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)


