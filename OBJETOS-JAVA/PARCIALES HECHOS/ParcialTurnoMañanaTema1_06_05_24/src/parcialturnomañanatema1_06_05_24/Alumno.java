/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnomañanatema1_06_05_24;

/**
 *
 * @author maximosimonetti
 */
public class Alumno {
    private String dni;
    private String nombre;
    private String lugarDeResidencia;

    public Alumno(String dni, String nombre, String lugarDeResidencia) {
        this.dni = dni;
        this.nombre = nombre;
        this.lugarDeResidencia = lugarDeResidencia;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLugarDeResidencia() {
        return lugarDeResidencia;
    }

    public void setLugarDeResidencia(String lugarDeResidencia) {
        this.lugarDeResidencia = lugarDeResidencia;
    }
    
    public String toString(){
        return "DNI: "+getDni()+" Nombre: "+getNombre()+" Lugar: "+getLugarDeResidencia()+"\n";
    }
}
