# Crear una matriz
mat <- matrix(c(4, 3, 3, 2), nrow = 2, ncol = 2)

# Crear el objeto "matriz especial"
cacheMatrix <- makeCacheMatrix(mat)

# Calcular la inversa (no está en caché todavía)
inverse <- cacheSolve(cacheMatrix)
print(inverse)

# Obtener la inversa desde la caché (ya está almacenada)
cachedInverse <- cacheSolve(cacheMatrix)
print(cachedInverse)
