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
public class Corista extends Persona{;
    private int tonoFundamental;

    public Corista(int tonoFundamental, int dni, int edad) {
        super(dni, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
    @Override
    public String toString() {
        return "Corista" + " DNI=" + this.getDni() + " edad=" + this.getEdad() + " tono fundamental=" + this.tonoFundamental;
    }
    
    
    
}
