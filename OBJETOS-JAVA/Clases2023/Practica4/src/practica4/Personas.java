/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Personas extends Persona{

    public Personas(String nombre, int dni, int edad) {
        super(nombre, dni, edad);
    }

    public String toString(){
        String aux;
        aux= super.toString();
        return aux;
    }
}
