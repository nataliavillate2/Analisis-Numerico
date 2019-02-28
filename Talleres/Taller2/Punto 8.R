rm(list=ls())
library(pracma)
library(Matrix)

A = matrix(c(-8.1, -7, 6.123, -2,
             -1, 4,-3, -1,
             0, -1, -5, 0.6,
             -1, 0.33, 6, 1/2), nrow=4, byrow=TRUE)
b = matrix(c(1.45,3,5.12,-4), nrow=4, byrow=TRUE)

N <- 3
A <- Diag(rep(3,N)) + Diag(rep(-2, N-1), k=-1) + Diag(rep(-1, N-1), k=1)
x0 <- rep(0, N)
b = c(4,5,6)

itersolve(A, b, tol=1e-9 , method = "Gauss-Seidel")
