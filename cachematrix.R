## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
#The following two functions can be used to create a matrix and calculate its 
#inverse with the ability to cache the inverse matrix if the original matrix remains
#unchanged.



#This function provides the following functionality 
#Creates a list with 4 functions as follows:
#1. get() 
#2. set() 
#3. setinverse() 
#4. getinverse()
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        
        #set() function enables the user to enter a valid matrix
        set <- function(y) {
                if(class(y)!="matrix")
                {
                        message("Input is not a matrix! Please enter a valid matrix")
                }
                else
                {
                        x <<- y
                        i <<- NULL
                }
        }
        
        #get() function enables the user to retrieve the value of the matrix
        get <- function() x
        
        #setinverse() function is used by the cachesolve() function to cache the value of the inverse matrix
        setinverse <- function(inverse) i <<- inverse
        
        #getinverse() function is used by the cachesolve() function to retrieve the value of the cached inverse matrix
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
}



#The cacheSolve() function is used to calculate the inverse of the matrix created using the makeCacheMatrix() function.
#This function returns a cached value of the inverse matrix if the original matrix remains unchanged.

cacheSolve <- function(x, ...) {
        
        #Inverse of the matrix stored using makeCacheMatrix() is calculated        
        i <- x$getinverse()
        
        #condition to check whether the original matrix has been modified
        if(!is.null(i)) {
                message("getting cached data")
                
                #CONDITION IS TRUE: the cached value of the inverse matrix is returned
                return(i)
        }
        
        data <- x$get()
        
        #CONDITION IS FALSE: inverse of the given matrix is calulated anew
        i <- solve(data, ...)
        x$setinverse(i)
        
        #the inverse matrix is returned
        i
}## Put comments here that give an overall description of what your
## functions do

## Stores a matrix x in a list
## List includes functions to
##     set the cahced matrix
##     get the cahced matrix
##     get the inverse of the cahced matrix
##     set the inverse of the cahced matrix

makeCacheMatrix <- function(x = matrix()) {

    xinv<- NULL
    set<-function(y) {
        x<<-matrix(y)
        xinv<<- NULL
    }
    get <- function() x
    setinv<- function(matinv) xinv<<-matinv
    getinv<- function() xinv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## Function that solves for the inverse
## first determines if inverse has already been calculated and cached
## if not calculates inverse using solve()
## if already calculate retrieves cached inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    xinv <- x$getinv()
    if (!is.null(xinv)) {
        message("Getting cached data ...")
        return(xinv)
    }
    data <-x$get()
    xinv<-solve(data)
    x$setinv(xinv)
    xinv
}
