## R Programming - Quiz 02

## Question 01
## Suppose I define the following function in R:
cube <- function(x, n) {
        x^3
}
## What is the result of running:
cube(3)
## in R after defining this function?
## A: 27. Because of the lazy evaluation, if R can run the function without using an undeffined argument, it will not return an error.


## Question 02
## The following code will produce a warning in R.
x <- 1:10
if(x > 5) {
        x <- 0
}
## Why?
## A: 'x' is a vector of length 10 and 'if' can only test a single logical statement.


## Question 03
## Consider the following function
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}
## If I then run in R
z <- 10
f(3)
## What value is returned?
## A: 10.  


## Question 05
## Consider the following R function:
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
## Which symbol in the above function is a free variable?
## A: 'f' is the free variable. 'h' is the function, 'x' is user defined, 'y' is 'NULL', d is '3L', 'z' is 'cbind(x, d)' and 'g' is 'x + y / z'.


## Question 06
## What is an environment in R?
## A: A collection of symbol/value pairs.


## Question 07
## The R language uses what type of scoping rule for resolving free variables?
## A: Lexical scoping.


## Question 08
## How are free variables in R functions resolved?
## A: The values of free variables are searched for in the environment in which the function was defined.


## Question 09
## What is one of the consequences of the scoping rules used in R?
## A: All objects must be stored in memory.


## Question 10
## In R, what is the parent frame?
## A: It is the environment in which a function was defined.