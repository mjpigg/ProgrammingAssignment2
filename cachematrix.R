## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## this function should create a "matrix" object
## that can cache its inverse

## usage example:
##> x<-matrix(c(2,3,1,7),2,2)
##> b<-makeCacheMatrix(x)
##> cacheSolve(b)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,setmatrix = setmatrix,mgetmatrix = getmatrix)  
}


## Write a short comment describing this function
## this mirrors the cachemean function from the 
## example ...
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}
