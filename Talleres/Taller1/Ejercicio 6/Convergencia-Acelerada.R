rm(list=ls())
xa = seq(-5,5,0.1);
numero = readline("Ingrese el numero al cual desea conocer la raiz: ")
num = as.double(numero)

valorInicial = readline("Ingrese el Valor de n : ")
val= as.double (valorInicial)

fx <- function(x) (x^val-num)
gx <- function(x) (val*x^(val-1))

newton <- function(a,b,error) {
  
  puntoMedio = (a+b)/2;
  iteraciones = 0
  la = 0
  iteracion2 = 0
  
  repeat{
    cc = fx(puntoMedio)/gx(puntoMedio)
    x = puntoMedio - cc
    dx = abs(cc)
    puntoMedio = x
    iteraciones = iteraciones+1
    if(dx <= error ) break;
    la[[iteraciones]] = puntoMedio
    
  }
  
  i = 1
  while(iteracion2 <= length(la)-6 ){
    
    terminoA = la[iteracion2]
    terminoB = la[iteracion2+1]
    terminoC = la[iteracion2+2]
    
    p = terminoA-((terminoB-terminoA)^2/(terminoC-2*terminoB+terminoA))
    
    i[iteracion2] = p
    
    cat(p,"\n")
    
    iteracion2 = iteracion2+1
  
  }
  cat("Iteraciones = ", iteracion2, "\n")
  cat("Resultado = ", x, " es la raiz ", val, "de el numero", num, "\n")
}

matplot(xa,cbind(gx(xa),fx(xa)),type="l",col=c("blue","red"))
newton(0,1,10e-8)
