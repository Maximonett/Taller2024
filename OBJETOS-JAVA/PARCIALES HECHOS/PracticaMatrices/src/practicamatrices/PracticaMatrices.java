/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practicamatrices;

/**
 *
 * @author maximosimonetti
 */
import PaqueteLectura.GeneradorAleatorio;
public class PracticaMatrices {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        int[][] matriz=new int[3][5];
        
        int i,j;
        for (i=0;i<matriz.length;i++){
            for (j=0;j<matriz[i].length;j++){
                matriz[i][j]=GeneradorAleatorio.generarInt(9);
            }
        }
        
        
        /*int filas=matriz.length;//cantidad de filas(3)
        int columnas=matriz[0].length; //cantidad de columnas (5)
        */
        
        int filas=3;
        int columnas=5;
        
        for (int k=0;k<filas*columnas;k++){
            
            int fila=k/columnas;
            int columna=k%columnas;
            
            System.out.print(matriz[fila][columna]+" ("+fila+","+columna+") ");
                         
            if (columna==columnas-1){ 
                System.out.println();
            }
        }
        
    }
    
}
