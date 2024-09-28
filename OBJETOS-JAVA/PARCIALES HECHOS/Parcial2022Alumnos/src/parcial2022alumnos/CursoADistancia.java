/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2022alumnos;

/**
 *
 * @author maximosimonetti
 */
public class CursoADistancia extends Curso {
    private String link;

    public CursoADistancia(String link, int añocursada, int maximoCantAlumnos) {
        super(añocursada, maximoCantAlumnos);
        this.link = link;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
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
        if (alumno.getCantAutoelvaluacionesAprobadas()>=3 && alumno.getCantAsistencias()>=1){            
            return true;
        }else{            
            return false;
        }
    }
    
    public int cantidadDeAlumnosQuePuedenRendir(){
        int cantidad=0;
        int indice=super.getIndiceCurso(); //obtengo el indice
        Alumno[] curso= getCurso();  // obtengo el arreglo de alumnos
        
        for (int i=0; i<indice;i++){
            Alumno alumno=curso[i]; //creo una objeto alumno y le asigno el alumno que estoy recorriendo
            if(puedeRendir(alumno)){
                cantidad++;
            }
        }
        return cantidad;
    }
    
}
