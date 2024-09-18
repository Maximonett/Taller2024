/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        return (Math.PI*(getRadio())*getRadio());
    }
    
    public double calcularPerimetro(){
        return (Math.PI)*2*(getRadio());
    }
    
    public void despintar(){
        setColorLinea("Negro");
        setColorRelleno("Blanco");
    }
    
    public String toString(){
        String aux = "Radio: " + getRadio() + super.toString();
        return aux;
    }
}
