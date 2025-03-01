# makeCacheMatrix: Se crea un objeto "matriz especial" que puede almacenar en caché su inverso.
makeCacheMatrix <- function(x = matrix()) {
  # Inicializa la variable para almacenar el inversa como NULL
  inv <- NULL
  
  # Función set: Permite establecer o cambiar la matriz
  set <- function(y) {
    x <<- y          # Asigna la nueva matriz
    inv <<- NULL     # Invalida el caché del inverso cuando la matriz cambia
  }
  
  # Función get: Devuelve la matriz almacenada
  get <- function() x
  
  # Función setInverse: Almacena el inverso calculada en caché
  setInverse <- function(inverse) inv <<- inverse
  
  # Función getInverse: Devuelve el inversa almacenada en caché
  getInverse <- function() inv
  
  # Retorna una lista con las funciones definidas
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# cacheSolve: Esta función calcula el inverso de la "matriz especial" creada por makeCacheMatrix.
# Si el inverso ya ha sido calculado, recupera la inversa de la caché.
cacheSolve <- function(x, ...) {
  # Obtiene la inversa almacenada en caché
  inv <- x$getInverse()
  
  # Si el inverso ya está en la caché, lo devuelve y termina la función
  if (!is.null(inv)) {
    message("Obteniendo la inversa almacenada en caché")
    return(inv)
  }
  
  # Si el inverso no está en la caché, obtiene la matriz
  data <- x$get()
  
  # Calcula el inverso usando la función solve
  inv <- solve(data, ...)
  
  # Almacena el inverso calculado en caché
  x$setInverse(inv)
  
  # Devuelve el inverso calculado
  inv
}