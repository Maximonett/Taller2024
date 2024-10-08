/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialk_081024;

/**
 *
 * @author maximosimonetti
 */
public class Empresa {
    private String nombreEmpresa;
    private ProgramadorLider lider;
    private int maxProgramadores;
    private int cantidadProgramadores=0;
    Programador[] programadores;

    public Empresa(String nombreEmpresa, ProgramadorLider lider, int maxProgramadores) {
        this.nombreEmpresa = nombreEmpresa;
        this.lider = lider;
        this.maxProgramadores = maxProgramadores;
        this.programadores=new Programador[maxProgramadores];
        inicializarProgramadores();
    }
    
    public void inicializarProgramadores(){
        for (int i=0;i<maxProgramadores;i++){
            programadores[i]=null;
        }    
    }
    
    public void agregarProgramador(Programador unProgramador){
        if (cantidadProgramadores<maxProgramadores){
            programadores[cantidadProgramadores]=unProgramador;
            cantidadProgramadores++;
            System.out.println("Se agregado Existosamente un Programador.");
        }else{
            System.out.println("No se puede agregar mas Programadores");
        }
    }
    
    public double montoEnSueldosAbonar(){
        double montoTotal=lider.sueldo();
        for(int i=0;i<cantidadProgramadores;i++){
            if(programadores[i]!=null){
                montoTotal+= programadores[i].sueldo();
            }
        }
        return montoTotal;
    }
    
    public void incrementarBasico(double M){
        
        double basicoLider=this.lider.getBasico();
        this.lider.setBasico(basicoLider+M);
        
        for (int i=0;i<cantidadProgramadores;i++){
            double newBasico=programadores[i].getBasico();
            programadores[i].setBasico(newBasico+M);                    
        }
        System.out.println("Basicos de todos los empleados actualizado.");
    }
    
    public String toString(){
        String aux= "Empresa: "+ this.nombreEmpresa+"\n";
                    aux+= lider.toString()+"\n";
                    for (int i=0;i<cantidadProgramadores;i++){
                        aux+=programadores[i].toString()+"\n";                    
                    }                    
                    
                    
          return aux;          
    }
    
}
