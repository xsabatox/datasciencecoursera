## Cache Matrix

## Description
## 'cachematrix' is actually two functions that calculate the inverse of
## a given square matrix and store the result in memory so that future 
## requests for that result can be served faster (a.k.a. caching).

## A) Make Cache Matrix
## The 'makeCacheMatrix' function creates a special "matrix", which is
## really a list containing a function to: 
## 1) set the value of the matrix passed as argument, using set();
## 2) get the stored value of the matrix, using get();
## 3) set the value of the inverse of the matrix, using setinverse();
## 4) get the stored value of the inverse of the matrix, using getinverse().
## Read the comments after each line of code to obtain more info about 
## this function.

## B) Cache Solve
## The 'cacheSolve' function calculates the inverse of the special 
## "matrix" created with the 'makeCacheMatrix' function. However, it 
## first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache using getinverse() and skips
## the computation. Otherwise, it gets the matrix using get(), calculates
## the inverse of the matrix using solve(), stores the value of the
## inverted matrix in the cache using setinverse() and finally prints the
## inverted matrix.

## Data
## 'makeCacheMatrix' and 'cacheSolve' work only with square invertible 
## matrices.

## Usage
## makeCacheMatrix(x = matrix())
## cacheSolve(x = list())

## Arguments
## 'x' in 'makeCacheMatrix' is a square invertible matrix.
## 'x' in 'cacheSolve' is the special "matrix", which is really a list
## containing 4 elements created by 'makeCacheMatrix'.

## 'makeCacheMatrix' Function
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL                                     ## This creates an object called 'i' with an undefined value.

        set <- function(y) {                          ## set() function sets a new value to the 'x' matrix, overwriting 
                x <<- y                               ## the value in the parent environment of set() with the new 
                i <<- NULL                            ## matrix passed to the makeCacheMatrix() function. It also 
        }                                             ## overwrites the value of 'i' in the parent environment of set()
                                                      ## with an undefined value.
        
        get <- function() x                           ## get() function prints the value of 'x', i.e. the matrix passed 
                                                      ## to the makeCacheMatrix() function.

        setinverse <- function(inverse) i <<- inverse ## setinverse() function sets a new value to 'i' in the parent 
                                                      ##  environment. The new value is the result of solve() over the 
                                                      ## matrix passed to the makeCacheMatrix() function.
        
        getinverse <- function() i                    ## getinverse() function prints the value of 'i', the result of
                                                      ## solve() over the matrix passed to the makeCacheMatrix() function.

        list(set = set, get = get,                    ## This line just organizes the makeCacheMatrix() "subfunctions",
             setinverse = setinverse,                 ## grouping them into a single object (a list).
             getinverse = getinverse)
}

## 'cacheSolve' Function
cacheSolve <- function(x, ...) {
        i <- x$getinverse()                           ## First, cacheSolve() function reads the 'i' object,
        if(!is.null(i)) {                             ## if 'i' was defined previously (i.e. is not NULL)
                message("getting cached data")        ## cacheSolve() gets the cached 'i' value (i.e. the
                return(i)                             ## previously defined inverse of 'x') and prints it.
        }
        data <- x$get()                               ## If 'i' is undefined (i.e. is NULL)
        i <- solve(data, ...)                         ## cacheSolve() calculates the inverse of the
        x$setinverse(i)                               ## matrix passed to the makeCacheMatrix() function,
        i                                             ## sets this result as the new 'i' value and prints it.
}

## Examples
## source("cachematrix.R")

## > m1 <- matrix(1:4, 2, 2)
## > ex1 <- makeCacheMatrix(m1)
## > cacheSolve(ex1) ## 1st time
##      [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5
## > cacheSolve(ex1) ## 2nd time
## getting cached data
##     [,1] [,2]
## [1,]   -2  1.5
## [2,]    1 -0.5

## > m2 <- matrix(rnorm(1:1000000, 1), 1000, 1000)
## > ex2 <- makeCacheMatrix(m2)
## > start <- Sys.time()
## > cacheSolve(ex2)
## > end <- Sys.time()
## > end - start ## 1st Time: Time difference of ~ 2.3 secs
## > start <- Sys.time()
## > cacheSolve(ex2)
## > end <- Sys.time()
## > end - start ## 2nd Time: Time difference of ~ 0.3 secs

## End of Cache Matrix