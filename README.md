### Introduction

This second programming assignment will require you to write an R function is able to cache potentially time-consuming computations. If the contents of a matrix are not changing, it may make sense to cache the value of the inverse so that when we need it again, it can be looked up in the cache rather than recomputed.

### Caching the Inverse of a Matrix

Below are two functions that are used to create a
special object that stores a matrix and cache's its inverse. 

The first function, `makeCacheMatrix` creates a special "matrix"", which is really a list containing a function to

1.  set the contents of the matrix
2.  get the contents of the matrix
3.  set the contents of the inverse matrix
4.  get the contents of the inverse matrix

<!-- -->

    makeCacheMatrix <- function() {
            # not shown
    }

The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it `get`s the inverse matrix from the cache and skips the computation. Otherwise, it calculates the inverse of the matrix and stores the inverted matrix in the cache via the `setinverse` function.

    cacheSolve <- function(x, ...) {
            # not shown
    }

Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.

The script provides the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. If the inverse has already been calculated and the matrix has not changed, then the `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can only be performed on a square invertible matrix. The function `cacheSolve` assumes the matrix supplied is always invertible.

### Example

    amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
    amatrix$get()         # Returns original matrix
    cacheSolve(amatrix)   # Computes, caches, and returns    matrix inverse
    amatrix$getinverse()  # Returns matrix inverse
    cacheSolve(amatrix)   # Returns cached matrix inverse using previously computed matrix inverse

    amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix
    cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse
    amatrix$get()         # Returns matrix
    amatrix$getinverse()  # Returns matrix inverse
