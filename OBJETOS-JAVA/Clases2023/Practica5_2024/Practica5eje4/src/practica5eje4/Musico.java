/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje4;

/**
 *
 * @author maximosimonetti
 */
public abstract class Musico {
    private String nombreDelMusico;
    private String dni;
    private int edad;

    public Musico(String nombreDelMusico, String dni, int edad) {
        this.nombreDelMusico = nombreDelMusico;
        this.dni = dni;
        this.edad = edad;
    }

    public String getNombreDelMusico() {
        return nombreDelMusico;
    }

    public void setNombreDelMusico(String nombreDelMusico) {
        this.nombreDelMusico = nombreDelMusico;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    
}
