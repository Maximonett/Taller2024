/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2022alumnos;

/**
 *
 * @author maximosimonetti
 */
public class CursoPresencial extends Curso {
    private int numeroAula;

    public CursoPresencial(int numeroAula, int añocursada, int maximoCantAlumnos) {
        super(añocursada, maximoCantAlumnos);
        this.numeroAula = numeroAula;
    }
    
    
    
    public int getNumeroAula() {
        return numeroAula;
    }

    public void setNumeroAula(int numeroAula) {
        this.numeroAula = numeroAula;
    }
    
    public boolean agregarAlumno(Alumno alumno){
        return super.agregarAlumno(alumno);
    }
    
    
    public void incrementarAsistencias(int dni){
        super.incrementarAsistencias(dni);
        
    }
    
    public void aprobarAutoevalucion(int dni){
        super.aprobarAutoevalucion(dni);
    }
    
    
    public boolean puedeRendir(Alumno alumno){
        if (alumno.getCantAsistencias()>=3){
            System.out.println("El alumno cumple con las condiciones,puede rendir");
            return true;            
        }else{
            System.out.println("El alumno NO cumple con las condiciones, NO puede Rendir");
            return false;
        }
    }
    
    public int cantidadDeAlumnosQuePuedenRendir(){
        int cantidad=0;
        int indice=super.getIndiceCurso(); //obtengo el indice
        Alumno[] curso=getCurso();  // obtengo el arreglo de alumnos
        
        for (int i=0; i<indice;i++){
            Alumno alumno=curso[i]; //creo una objeto alumno y le asigno el alumno que estoy recorriendo
            if(puedeRendir(alumno)){
                cantidad++;
            }
        }
        return cantidad;
    }
    
}
