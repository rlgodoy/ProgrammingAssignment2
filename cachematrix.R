## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##creates a special matrix, which containing value of the vector and value of the mean

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
                x <<- y
                m <<- NULL
        }

##assign inverse with solve()

        get <- function() solve(x)
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
##assign to x its inverse with solve()
        
	x<-solve(x)
	m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
