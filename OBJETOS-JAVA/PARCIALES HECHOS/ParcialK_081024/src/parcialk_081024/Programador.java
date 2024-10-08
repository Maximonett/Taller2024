/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialk_081024;

/**
 *
 * @author maximosimonetti
 */
public class Programador {
    private String nombre;
    private String dni;
    private double basico;
    private int cantLineasXHora;
    private String lenguajePreferido;

    public Programador(String nombre, String dni, double basico, int cantLineasXHora, String lenguajePreferido) {
        this.nombre = nombre;
        this.dni = dni;
        this.basico = basico;
        this.cantLineasXHora = cantLineasXHora;
        this.lenguajePreferido = lenguajePreferido;
    }
    
    
    public double sueldo(){
        double sueldo= this.basico;
        if (this.cantLineasXHora>200){
            basico+=50000;
        }
        return sueldo;
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

    public double getBasico() {
        return basico;
    }

    public void setBasico(double basico) {
        this.basico = basico;
    }

    public int getCantLineasXHora() {
        return cantLineasXHora;
    }

    public void setCantLineasXHora(int cantLineasXHora) {
        this.cantLineasXHora = cantLineasXHora;
    }

    public String getLenguajePreferido() {
        return lenguajePreferido;
    }

    public void setLenguajePreferido(String lenguajePreferido) {
        this.lenguajePreferido = lenguajePreferido;
    }

    @Override
    public String toString() {
        String aux= "Programador: "+ this.nombre +" DNI: "+this.dni+" Lenguaje dePreferencia: "
                +this.lenguajePreferido+ " Suledo Final: "+sueldo();
        return aux;         
    }
    
    
    
    
    
}
