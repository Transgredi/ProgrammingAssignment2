## Function makes a cache of an inverted matrix 
## calculated by the cacheSolve function
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL #create empty object for inverted matrix
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x #function to obtain parameter
  setinv <- function(solve) inv <<- solve #function to set variable to inv matrix
  getinv <- function() inv #function to get inverted matrix
  
  #return a list with four elements to be used by cacheSolve
  list(set = set, 
       get = get,
       setinv = setinv,
       getinv = getinv)
}


## Using the function: cacheSolve(makeCacheMatrix(yourMatrix))
## where yourMatrix is a matrix created by the user
cacheSolve <- function(x) {
  inv <- x$getinv() #get the matrix stored in makeCacheMatrix
  
  #Check if the inverted matrix already exist. If yes - return results
  if(!is.null(inv)) { 
    message("extracting cached matrix")
    return(inv)
  }
  
  data <- x$get() #get the matrix for inversion
  inv <- solve(data) #invert the matrix
  x$setinv(inv) #store inverted matrix in a makeCacheMatrix list element
  inv ## Return a matrix that is the inverse of 'x'
}
