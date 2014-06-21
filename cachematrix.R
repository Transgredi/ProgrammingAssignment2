## Function is going to calculate and then cache an inverted matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
  
}


## How to use the function: cacheSolve(makeCacheMatrix(yourMatrix))
## where yourMatrix is a matrix created by the user

cacheSolve <- function(x) {
  inv <- x$getinv()
  
  #Check if the inverted matrix already exist. If yes - return results
  if(!is.null(inv)) { 
    message("extracting cached matrix")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinv(inv)
  inv ## Return a matrix that is the inverse of 'x'
}
