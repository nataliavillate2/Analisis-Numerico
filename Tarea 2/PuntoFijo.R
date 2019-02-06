rm(list=ls())
gx = function(x) ((exp(x))/(pi))
fx = function(x) (exp(x)-pi*x)
y = function(x) x
x = seq(0,1,0.1);

puntoFijo = function(a,b,error) {
  
  
  if((gx(a)<a) || (gx(b)>b)){ 
    cat("El Intervalo: [ ", a,",", b , "] no es valido\n")
  }else{
    
    puntoMedio = (a+b)/2;
    iteraciones = 0;
    xInicial = puntoMedio
    funcionXInicial = gx(xInicial);
    check = 0;
    
    while(abs(xInicial-funcionXInicial)>error){
      iteraciones = iteraciones + 1
      
      if(xInicial < a){
        check = 1;
      }
      if(check == 0){
        xInicial = funcionXInicial;
        funcionXInicial = gx(xInicial);
      }else{
        funcionXInicial = xInicial;
        xInicial = y(funcionXInicial);
      }
      cat("x: ", xInicial, " con: ", iteraciones ," Iteraciones\n")
    }
    cat("Iteraciones =",iteraciones, "Resultado = ",xInicial,"\n")
  }
  
}

puntoFijo(0,1,10e-8)
curve(gx,-2,2, col="red")
curve(y,-2,2,col="blue", add = "TRUE")
matplot(x,cbind(gx(x),y(x),fx(x)),type="l",col=c("blue","red","orange"))
