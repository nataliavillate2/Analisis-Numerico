f <- function(x){
  tan(pi*x)-sin(pi*x)
}

Algoritmo=function(x0){
  error=1000; 
  
  x0=x0-0.1; 
  x2=x0+1;   
  x1=x0+0.5;
  
  cont=0;
  while( error > 1e-9 && cont <= 100 ){
    x0 = x1 - ( (f(x1) * (x1-x2)) / ((f(x1)-f(x2))) )
    
    error = abs(x0-x1) 
    x2=x1 
    x1=x0
    cont=cont+1
  }
  if (cont < 100)
    cat( "Raiz Obtenida: ",x0, " Iteraciones = ",cont, "\n")
  else
    cat ("No es posible obtener el calculo")
}

x=seq(0,2,length=20)

Algoritmo(0)
Algoritmo(2)
title("Grafica de las funciones")
plot(x,f(x),type="l",col="orange",lwd=3)


newtonAitken<-function(r,tol){
  i<-0
  error<-1
  while(i<=3 && error>tol){
    if(r!=0){ 
      bef=r
      r<-r-((Fx(r))/Dx(r))
      error<-(abs(bef-r))/abs(bef)
      cat("R=",r,"\t Error:",error,"i:",i,"\n")
      if(i==1)
      {
        x0=r
      }
      else
      {
        if(i==2)
        {
          x1=r
        } 
        else
        {
          x2=r
        }
      }
    }
    i=i+1
  }
  
  while(error>tol){
    if(r!=0){
      x3=x2-(((x2-x1)^2)/(x2-(2*x1)+x0))
      x0=x1
      x1=x2
      error<-(abs(x2-x3))/abs(x2)
      cat("R=",x3,"\t Error:",error,"iteracion:",i,"\n")
      r<-r-((Fx(r))/Dx(r))
      x2=r
    }
    i=i+1
  }
}
##El otro algoritmo aplicado
newtonAitken(1.3,1.e-9)
