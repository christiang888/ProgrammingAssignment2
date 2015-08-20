## This function creates a matrix object that cache its inverse
## The given data must to be an invertible matrix
## It's like given example, changing "mean" by solve 

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
	set<-function(y){
	x<<-y
	m<<-NULL
	}
	get<-function()x
	setsolve<-function(solve)m<<-solve
	getsolve<-function()m
	list(set = set, get = get,
	setsolve = setsolve,
	getsolve = getsolve)
}

## This function computes the inverse of the special matrix

cacheSolve <- function(x, ...) {
       m<-x$getsolve()
	if(!is.null(m)){
		message("getting cache data")
		return(m)
	}
	data<-x$get()
	m<-solve(data,...)
	x$setsolve(m)
	m
}
