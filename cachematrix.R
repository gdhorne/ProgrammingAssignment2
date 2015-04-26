## Matrix inversion is typically a costly computation which can benefit
## from caching the invverse of the matrix rather than repeatedly computing it.


## Example:
## amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2)) # Create new matrix
## amatrix$get()         # Returns original matrix
## cacheSolve(amatrix)   # Computes, caches, and returns matrix inverse
## amatrix$getinverse()  # Returns matrix inverse
## cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse
## amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
## cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
## amatrix$get()         # Returns matrix
## amatrix$getinverse()  # Returns matrix inverse


## Creates a special matrix with the ability to cache its inverse.
##
## set() creates the matrix
## get() retrieves the existing matrix
## setinverse() caches the matrix inverse computed by cacheSolve
## getinverse() retrieves the existing matrix inverse or NULL

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(mtrx) m <<- mtrx
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Computes the inverse of the special matrix created by makeCacheMatrix.
## If the matrix inverse has already been calculated and the original matrix is unchanged,
## then return the cached value. Otherwise, calculate the matrix inverse and return it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

# This update merely is a test of Git integration with RStudio
# running on Microsoft Windows 7. This assignment has been resubmitted
# solely as an integration functionality test. This comment is the only addition.