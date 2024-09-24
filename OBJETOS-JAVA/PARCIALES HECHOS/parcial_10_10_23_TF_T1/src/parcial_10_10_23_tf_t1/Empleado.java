/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_10_10_23_tf_t1;

/**
 *
 * @author maximosimonetti
 */
public abstract class Empleado {
    private String nombre;
    private String DNI;
    private int anoingreso;
    private double basico;

    public Empleado() {
    }

    public Empleado(String nombre, String DNI, int anoingreso, double basico) {
        super();
        this.nombre = nombre;
        this.DNI = DNI;
        this.anoingreso = anoingreso;
        this.basico = basico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getAnoingreso() {
        return anoingreso;
    }

    public void setAnoingreso(int anoingreso) {
        this.anoingreso = anoingreso;
    }

    public double getBasico() {
        return basico;
    }

    public void setBasico(double basico) {
        this.basico = basico;
    }
    
    public int antiguedad(){
        int anoActual=2024;
        return anoActual-anoingreso;
    }
    public abstract double sueldoAcobrar();
    
    public String toString(){
        String aux= "Nombre: " + this.nombre+" DNI: "+this.DNI +" Sueldo a Cobra: "+ sueldoAcobrar() ;
        
        return aux;
    
    }
   
}
