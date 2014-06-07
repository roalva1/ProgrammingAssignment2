## My functions mainly are the cached vector code converted to get inversed matrix
##

## This is the first function that create the special matrix with 4 methods:
## set, get, setsolve and getsolve

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setsolve <- function(solved) i <<- solved
  getsolve <- function() i
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Here is where we calculate the inverse matrix or we get that from the cache

cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getsolve()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setsolve(i)
  i
}

mat <- matrix(data = c(4,3,3,2), nrow =2, ncol=2)
mat_cache <- makeCacheMatrix(mat)
# Calculating 1st inverse matrix
mat_cache_solve <- cacheSolve(mat_cache)
# Getting cached data
mat_cache_solve_cached <- cacheSolve(mat_cache)
