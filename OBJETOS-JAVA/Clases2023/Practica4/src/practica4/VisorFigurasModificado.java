/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;
    
    
    public VisorFigurasModificado(){
        // Inicializa el array de figuras 
        //con la capacidad máxima y establece guardadas en 0
        vector = new Figura[capacidadMaxima];
        guardadas = 0;
    }
    
    
    public void guardar(Figura f){
        if (quedaEspacio()){
            vector[guardadas]=f;
            guardadas++;
        }else{
            System.out.println("No queda mas espacio");
        }
    }
    
    public boolean quedaEspacio(){
        return guardadas<capacidadMaxima;
    }
    
    
    public void mostrar(){
        for (int i=0;i<guardadas;i++){
            System.out.println(vector[i].toString());
        }
    }
    
    public int getGuardadas() {
        return guardadas;
    }
}
