
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos

import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        
        double[] vector;
        
        //Paso 3: Crear el vector para 15 double 
        
        vector=new double[15];
       
        //Paso 4: Declarar indice y variables auxiliares a usar
        
        int i;
        double sumaAlturas =0;
        double promedio;
        int cantArribaAlturas=0;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        
        System.out.println("Ingrese las alturas de los jugadores: ");
        for (i=0;i<15;i++) {
            System.out.println("Altura de Jugador "+(i+1)+" : ");
            vector[i]=Lector.leerDouble();
            sumaAlturas +=vector[i];
            
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        promedio=sumaAlturas/15;
        System.out.println("El promedio de alturas es : "+ promedio);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
     
        for (i=0;i<15;i++){
            if (vector[i]>promedio){
            cantArribaAlturas++;
            }
        }
        
        //Paso 9: Informar la cantidad.
        
        System.out.println("La cantidad de jugadores con alturas mayor al promedio son: "+ cantArribaAlturas);
    }
    
}
