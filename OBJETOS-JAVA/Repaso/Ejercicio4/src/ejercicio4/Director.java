/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author tecno
 */
public class Director extends Persona {
    private int antiguedad;

    public Director(int antiguedad, int dni, int edad) {
        super(dni, edad);
        this.antiguedad = antiguedad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director" + " DNI=" + this.getDni() + " edad=" + this.getEdad() + " antiguedad=" + this.antiguedad;
    }
    
    
    
}
