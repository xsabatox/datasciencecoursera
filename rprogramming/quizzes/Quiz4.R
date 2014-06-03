## R Programming - Quiz 04


## Question 01
## What is produced at the end of this snippet of R code?
set.seed(1)
rpois(5, 2)
## A: 1 1 2 4 1


## Question 02
## What R function can be used to generate standard Normal random variables?
?rnorm
## A: rnorm.


## Question 03
## When simulating data, why is using the set.seed() function important?
?set.seed
## A: It ensures that the sequence of random numbers is reproducible.


## Question 04
## Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?
?qpois
## A: qpois.


## Question 05
## What does the following code do?
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
plot(x, y)
## A: Generate data from a Normal linear model.


## Question 06
## What R function can be used to generate Binomial random variables?
?rbinom
## A: rbinom.


## Question 07
## What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?
## A: The function call stack.


## Question 08
## Consider the following R code
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
## (Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the 'lm' function, based on the 'by.total' method of normalization shown in 'summaryRprof()'?
## A: 100%.


## Question 09
## When using 'system.time()', what is the user time?
## A: It is the time spent by the CPU evaluating an expression.


## Question 10
## If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using 'system.time()'?
## elapsed time is less than the user time.