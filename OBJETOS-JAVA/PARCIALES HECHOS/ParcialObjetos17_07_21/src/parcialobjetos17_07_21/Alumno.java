/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialobjetos17_07_21;

import java.util.ArrayList;
import java.util.Random;
/**
 *
 * @author maximosimonetti
 */
public class Alumno {
    private String nombre;
    private String dni;
    private int numeroDeTema=-1;

    public Alumno(String nombre, String dni) {
        this.nombre = nombre;
        this.dni = dni;
        this.numeroDeTema = numeroDeTema;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getNumeroDeTema() {
        return numeroDeTema;
    }

    public void setNumeroDeTema(int numeroDeTema) {
        this.numeroDeTema = numeroDeTema;
    }

    @Override
    public String toString() {
        return "Alumno " + getNombre() + ", DNI: " + getDni() + ", numeroDeTema: " + getNumeroDeTema()+"\n";
    }
    
    
}
