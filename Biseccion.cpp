#include <iostream>
#include <cmath>

const double euler = std::exp(1.0);
const double pi = M_PI;

double funcion(double x);
double biseccion(double a, double b, double err, double &it);

int main(){

	double result = 0;
	double iterRealizadas;
	result = biseccion(0,2,10e-8,iterRealizadas);

	if(result == 0)
    {
        std::cout<< " --  ";
    }
    else
    {

    std::cout<<"Raiz Buscada: "<<result<<std::endl;
    std::cout<<"Iteraciones Realizadas: "<< iterRealizadas <<std::endl;

    }

    return 0;
}


double Solucionar(double x)
{
    return (((x)*(pow(euler,x)))-pi);
}

double biseccion(double a,double b,double error, double &it){

	double intervaloInferior = a;
	double intervaloSuperior = b;
	double puntoMedio= 0;
	double pM2 = 0;
	double iteracion = 0;
	double resultado = Solucionar(b);

	while (error < fabs(resultado))
	{
		iteracion++;
		if((Solucionar(intervaloInferior)*Solucionar(intervaloSuperior))<0){
			puntoMedio = (intervaloSuperior+intervaloInferior)/2;
			pM2 = Solucionar(puntoMedio);

			if(fabs(pM2) < error){
				break;

			}else{
				if((Solucionar(intervaloInferior)*pM2)>0){
					intervaloInferior =  puntoMedio;
				}else{
					intervaloSuperior = puntoMedio;
				}
			}

		}else{
			std::cout<<"El intervalo dado: [";
			std::cout<<intervaloInferior;
			std::cout<< ",";
			std::cout<<intervaloSuperior ;
			std::cout<<"] no es valido" <<std::endl;
			return 0;
		}
	}
	it = iteracion;
	return puntoMedio;
}
