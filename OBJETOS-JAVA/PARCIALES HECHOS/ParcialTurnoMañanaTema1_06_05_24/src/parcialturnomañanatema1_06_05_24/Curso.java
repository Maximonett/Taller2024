/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnomañanatema1_06_05_24;

import javax.imageio.ImageIO;

/**
 *
 * @author maximosimonetti
 */
public class Curso {
    private String descripcion;
    private Turno turnoOnline;
    private Turno turnoPresencial;

    public Curso(String descripcion, Turno turnoOnline, Turno turnoPresencial) {
        this.descripcion = descripcion;
        this.turnoOnline = turnoOnline;
        this.turnoPresencial = turnoPresencial;
    }
    
    public void agregarAlumnoAlCurso(Alumno unAlumno){        
        if (unAlumno.getLugarDeResidencia().equals("La Plata")){
            turnoPresencial.ingresarAlumno(unAlumno);
        }else{
            turnoOnline.ingresarAlumno(unAlumno);
        }
    
    }
    
    public double ganaciaMensualDelCurso(){
        return turnoOnline.ganaciaDelTurno()+turnoPresencial.ganaciaDelTurno();
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Turno getTurnoOnline() {
        return turnoOnline;
    }

    public void setTurnoOnline(Turno turnoOnline) {
        this.turnoOnline = turnoOnline;
    }

    public Turno getTurnoPresencial() {
        return turnoPresencial;
    }

    public void setTurnoPresencial(Turno turnoPresencial) {
        this.turnoPresencial = turnoPresencial;
    }
    
    public String toString(){
        String aux= "\n"+getDescripcion()+" La ganacia mensual es $"+ganaciaMensualDelCurso()+"\n";
        
        aux+="\n"+turnoOnline.toString();
        
        aux+="\n"+turnoPresencial.toString();
        
        return aux;
        
    }
}
