### R Programming - Programming Assignment 2

### Date: 04-21-2014
### By: Vern
### This code based on the 'makeVector' and 'cachemean' functions
### Branched from: https://github.com/rdpeng/ProgrammingAssignment2

## The 'makeCacheMatrix' and 'cacheSolve' functions are used to
## create a special object that allows for the computing and caching
## of the inverse of an invertible matrix
##
## Given that computing the inverse of a significantly large matrix 
## may be computationally expensive, the above two functions allow 
## for the caching of the solution for future use. If the matrix is 
## invertible and generally static, then the solved inverted matrix
## may be retrieved from the cache

## NB: we assume the matrix is always invertible

# makeCacheMatrix:
# Creates the special matrix object that is a list containing
# the following four functions:
# set the value of the matrix
# get the value of the matrix
# set the value of the inverted (solved) matrix
# get the value of the inverted (solved) matrix

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     set <- function(y) {
          x <<- y
          m <<- NULL
     }
     
     get <- function() x
     setsolve <- function(solve) m <<- solve
     getsolve <- function() m
     list(set = set, get = get, setsolve = setsolve,
          getsolve = getsolve)
}

# cacheSolve:
# Computes, caches, and returns the inverse of the special
# matrix created by 'makeCacheMatrix'
# If the inverse already has been calculated (and the matrix
# has not changed), then the fucntion returns the cached
# inverted matrix

cacheSolve <- function(x, ...) {
     m <- x$getsolve()
     if(!is.null(m)) {
          message("getting cached data")
          return(m)
     }
     
     data <- x$get()
     m <- solve(data, ...)
     x$setsolve(m)
     m
}
