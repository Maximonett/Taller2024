/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2022alumnos;

/**
 *
 * @author maximosimonetti
 */
public class Alumno {
    private int DNI;
    private String nombre;
    private int cantAsistencias=0;
    private int cantAutoelvaluacionesAprobadas=0;

    public Alumno(int DNI, String nombre) {
        this.DNI = DNI;
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantAsistencias() {
        return cantAsistencias;
    }

    public void setCantAsistencias(int cantAsistencias) {
        this.cantAsistencias = cantAsistencias;
    }

    public int getCantAutoelvaluacionesAprobadas() {
        return cantAutoelvaluacionesAprobadas;
    }

    public void setCantAutoelvaluacionesAprobadas(int cantAutoelvaluacionesAprobadas) {
        this.cantAutoelvaluacionesAprobadas = cantAutoelvaluacionesAprobadas;
    }
    
    
}
