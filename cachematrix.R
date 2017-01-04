## This function cache the inversion of a matrix

## This function creates a special matrix to cache the inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setsolve<-function(solve) m <<- solve
  getsolve<-function() m
  list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
}


## This function computes the inverse of the special matrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m<-x$getsolve()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data,...)
  x$setsolve(m)
  m
} 
