/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje4;

/**
 *
 * @author maximosimonetti
 */
public class Corista extends Musico {
    private int tonoFundamental;

    public Corista(int tonoFundamental, String nombreDelMusico, String dni, int edad) {
        super(nombreDelMusico, dni, edad);
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
    
    
}
