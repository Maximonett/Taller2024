/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio
            GeneradorAleatorio.iniciar();
	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
            
        int[][] matriz;
        matriz= new int[5][5];
        
        int i=0;
        int j=0;
        for (i=0;i<5;i++){
            for(j=0;j<5;j++){
                matriz[i][j]= GeneradorAleatorio.generarInt(100); 
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        
        System.out.println("Mostrar contenido de la matriz");
        
        for (i=0;i<5;i++){
            for (j=0;j<5;j++){
                System.out.print(matriz[i][j]+ " ");
            }
            System.out.println();
        }
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        
        int sumaFila1=0;
        for (j=0; j<5;j++){
            sumaFila1+=matriz[0][j];
        }
        
        
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición 
        // j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int[] sumaColumnas= new int[5]; //vector
        
        for (j=0;j<5;j++){
            int sumaColumna=0; //entero 
            for ( i=0;i<5;i++){
                sumaColumna += matriz[i][j];
            }
            sumaColumnas[j]= sumaColumna;
        }
        // Imprimir el vector de sumas de columnas
        System.out.println("Suma de elementos de cada columna:");
        for (j = 0; j < 5; j++) {
            System.out.println("Columna " + j + ": " + sumaColumnas[j]);
        }

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. 
        //En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".

            System.out.println("Ingrese un valor entero para buscar: ");
            int valor=Lector.leerInt();
            
            boolean encontrado= false;
            
            for (i=0;i<5;i++){
                for (j=0;j<5;j++){
                    if (matriz[i][j]==valor){
                        System.out.println("Elemento encontrado en la posicion: Fila "+i+" Columna "+j);
                        encontrado=true;
                        break;
                    }
                }
                if (encontrado)break;
            }
            if (!encontrado){
                System.out.println("No se encontro el elemnto");
            }
           
    }
}
