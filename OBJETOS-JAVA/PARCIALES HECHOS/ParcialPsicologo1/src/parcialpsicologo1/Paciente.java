/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialpsicologo1;

/**
 *
 * @author maximosimonetti
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costoSecion;

    public Paciente(String nombre, boolean obraSocial, double costoSecion) {
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costoSecion = costoSecion;
    }

    public Paciente() {
    }

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public double getCostoSecion() {
        return costoSecion;
    }

    public void setCostoSecion(double costoSecion) {
        this.costoSecion = costoSecion;
    }
    
    
      
}
