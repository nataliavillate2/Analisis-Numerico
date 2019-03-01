library(pracma)
library(Matrix)

# Remueve todos los objetos creados
rm(list=ls())

  #### Matriz Original ####
A = matrix(c(  4, -1, -1, -1,
              -1,  4, -1, -1,
              -1, -1,  4, -1,
              -1, -1, -1,  4), nrow=4, byrow=TRUE)
b = matrix(c(-exp(1),5,6,0), nrow=4, byrow=TRUE)


#### Matriz Modificada ###
MODI = matrix(c(  4, -1, -1, -1,
               -1.15,  4, -1, -1,
               -1, -1,  4, -1,
               -1, -1, -1,  4), nrow=4, byrow=TRUE)

#### Resultado Matriz Original ###
solve(A,b)
print(norm(D," F"))
#### Resultado Matriz Modificada ##
tol = 1e-9
sol = itersolve(A, b, tol=0.001 , method = "Gauss-Seidel")
print(sol)

##Cota para el error de la solucion 
Cota = matrix(c(MODI-A), nrow=4, byrow=4)
c= norm(A)

##Norma del Error relativo de la matriz
print(Cota)
#Numero de Condicion
condi=cond(A)

eRela=0.15/c
round(eRela,6)
cat("Error Relativo:", eRela)
cots=condi*eRela
cat("La cota para el error relativo de la solucion es de:" , cots, "\n")






