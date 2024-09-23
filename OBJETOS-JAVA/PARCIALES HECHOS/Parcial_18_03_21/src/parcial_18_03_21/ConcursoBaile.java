/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_18_03_21;

/**
 *
 * @author maximosimonetti
 */
public class ConcursoBaile {
    private int maxParejas; //maxima cantidad de parejas o dimF
    private int N; //cantida de parejas 
    private Pareja[] concurso;

    public ConcursoBaile(int maxParejas) {
        this.maxParejas = maxParejas;
        this.N = 0; //inicializo en 0 
        this.concurso = new Pareja[maxParejas]; // construyo el vector                
    }

    public void agregarPareja(Pareja unaPareja){
        if(N<maxParejas){
            concurso[N]=unaPareja;
            N++;            
        }else{
            System.out.println("No hay mas lugar en el concurso.");
                    
        }    
    }
    
    public Pareja parejaConMayorDiferenciaEdad(){
        if (N==0) return null;
        
        Pareja mayorDiferencia= concurso[0];
        
        for (int i=0;i<N;i++){
        
            if (concurso[i].diferenciaDeEdad()>mayorDiferencia.diferenciaDeEdad()){
                mayorDiferencia=concurso[i];
            }
        }
        return mayorDiferencia;
    
    }
    
    
}
