/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialenunciado6;

/**
 *
 * @author maximosimonetti
 */
public class Cliente {
    private String nombre;
    private String DNI;

    public Cliente(String nombre, String DNI) {
        this.nombre = nombre;
        this.DNI = DNI;
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
    
    
    public String toString(){
        String aux= " Nombre "+this.nombre+" DNI: "+this.DNI +" - ";
        
        return aux;
    
    }
    
}
