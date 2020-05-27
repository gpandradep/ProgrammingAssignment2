## Put comments here that give an overall description of what your functions do

## This function create a list to stock the matrix, and the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  ima <- NULL
  set <- function(y){ # create objects in the global enviroment
    x<<- y
    ima <<- NULL
  }
get <- function() x
setinverse <- function(solve) ima<<-solve(x) #function that compute the inverse
getinverse <- function() ima # matrix inverse object
list(set=set, get=get,
     setinverse=setinverse, getinverse=getinverse) #list of objetcts
}


## calculate the inverse from cache object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  ima <- x$getinverse()
  if(!is.null(ima)){
    message("getting cache data")
    return(ima)
  }
  data <- x$get()
  ima <- solve(data, ...)
  x$setinverse(ima)
  ima
}

