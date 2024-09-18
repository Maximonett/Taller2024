/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Trabajador extends Persona{
    private String tareaEspecifica;

    public Trabajador(String tareaEspecifica, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.tareaEspecifica = tareaEspecifica;
    }

    public String getTareaEspecifica() {
        return tareaEspecifica;
    }

    public void setTareaEspecifica(String tareaEspecifica) {
        this.tareaEspecifica = tareaEspecifica;
    }
    
    public String toString(){
        String aux;
        aux= super.toString()+ " .Soy "+this.tareaEspecifica;
        return aux;
    }
}
