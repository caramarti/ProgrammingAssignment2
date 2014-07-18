## These are a pair of functions that cache the inverse of a matrix.

## This function creates a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

  i<- NULL
  
  ##Set matrix
  set <- function(matrix) {
    m <<- matrix
    i <<- NULL
  }
  
  ##Get matrix
  get <- function( ) {
    ##Returns the matrix
    m
  }
  
  ##Set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  ##Get the inverse of the matrix
  getInverse <- function() {
    ## Returns the inverse
    i
  }
  
  ##Return a list of methods
  list(set = set, get = get, setInverse = setInverse,
       getInverse = getInverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix
## above. If the inverse has already been calculated (and the matrix has not changed),
## then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ##Return the inverse if already set
  if (!is.null(m)) {
    return(m)
  }
  
  ## Get the matrix
  Data <- x$get()
  
  ## Calculate the inverse
  m <- solve(Data)
  
  ## Set the inverse
  x$setInverse(m)
  
  ## Return the matrix
  m
}
