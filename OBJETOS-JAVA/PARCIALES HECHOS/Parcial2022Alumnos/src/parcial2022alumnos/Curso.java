/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2022alumnos;

/**
 *
 * @author maximosimonetti
 */
public abstract class Curso {
    private int  añocursada;
    private int maximoCantAlumnos;
    private int indiceCurso;
    private Alumno[] curso;

    public Curso(int añocursada, int maximoCantAlumnos) {
        this.añocursada = añocursada;
        this.maximoCantAlumnos = maximoCantAlumnos;
        this.curso=new Alumno[maximoCantAlumnos];
        
    }

    public Alumno[] getCurso() {
        return curso;
    }

    public void setCurso(Alumno[] curso) {
        this.curso = curso;
    }
    
    
    public int getAñocursada() {
        return añocursada;
    }

    public void setAñocursada(int añocursada) {
        this.añocursada = añocursada;
    }

    public int getMaximoCantAlumnos() {
        return maximoCantAlumnos;
    }

    public void setMaximoCantAlumnos(int maximoCantAlumnos) {
        this.maximoCantAlumnos = maximoCantAlumnos;
    }

    public int getIndiceCurso() {
        return indiceCurso;
    }

    public void setIndiceCurso(int indiceCurso) {
        this.indiceCurso = indiceCurso;
    }
    
    
    
    public boolean agregarAlumno(Alumno alumno){
        if (indiceCurso<maximoCantAlumnos){
            curso[indiceCurso]=alumno;
            indiceCurso++;
            return true;
        }else{
            return false;
        }            
    }
    
    public void incrementarAsistencias(int dni){
        for (int i=0;i<indiceCurso;i++){
            if (curso[i].getDNI()==dni){
                int asistencias= curso[i].getCantAsistencias();
                curso[i].setCantAsistencias(asistencias+1);
                System.out.println("Se incremento correctamente las asistencias del alumno con DNI "+dni);
            }                                       
        }
    }
    
    public void aprobarAutoevalucion(int dni){
        for (int i=0;i< indiceCurso;i++){
            if (curso[i].getDNI()==dni){
                int autoevalucion=curso[i].getCantAutoelvaluacionesAprobadas();
                curso[i].setCantAutoelvaluacionesAprobadas(autoevalucion+1);
                System.out.println("Se increment con existo la cantidad de autoevalciones aprobadas por el alumno DNI "+dni);
            }
        }
    }
    
    public abstract boolean puedeRendir(Alumno alumno);
    
    public abstract int cantidadDeAlumnosQuePuedenRendir();
    
}
