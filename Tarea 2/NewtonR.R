rm(list=ls())
xa = seq(-5,5,0.1);
fx <- function(x) ((exp(x)) - (pi*x))
gx <- function(x) ((exp(x))/pi)

newton <- function(a,b,error) {
  
  puntoMedio = (a+b)/2;
  iteraciones = 0
  
  repeat{
    cc = fx(puntoMedio)/gx(puntoMedio)
    x = puntoMedio - cc
    dx = abs(cc)
    puntoMedio = x
    iteraciones = iteraciones+1
    if(dx <= error ) break;
    cat("x: ", x, " con: ", iteraciones ," Iteracion\n")
  }
  cat("Iteraciones = ", iteraciones, " Resultado = ", x, "\n")
}

matplot(xa,cbind(gx(xa),fx(xa)),type="l",col=c("blue","red"))
newton(0,1,10e-8)