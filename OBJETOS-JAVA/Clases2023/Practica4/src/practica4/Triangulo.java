/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Triangulo extends Figura{
    private double ladoUno;
    private double ladoDos;
    private double ladoTres;

    public Triangulo(double ladoUno, double ladoDos, double ladoTres, String unCR, String unCL) {
        super(unCR, unCL);
        this.ladoUno = ladoUno;
        this.ladoDos = ladoDos;
        this.ladoTres = ladoTres;
    }
    
    public double getLadoUno() {
        return ladoUno;
    }

    public void setLadoUno(double ladoUno) {
        this.ladoUno = ladoUno;
    }

    public double getLadoDos() {
        return ladoDos;
    }

    public void setLadoDos(double ladoDos) {
        this.ladoDos = ladoDos;
    }

    public double getLadoTres() {
        return ladoTres;
    }

    public void setLadoTres(double ladoTres) {
        this.ladoTres = ladoTres;
    }

    public double calcularArea(){
        return (getLadoUno()*getLadoDos())/2;
    }

    public double calcularPerimetro(){
        return getLadoUno()+getLadoDos()+getLadoTres();
    }
    
    public void despintar(){
        setColorRelleno("Blanco");
        setColorLinea("Negro");
    }
    

    public String toString(){
        String aux=super.toString() 
                + "Lado 1: "+getLadoUno()+" Lado 2: "+getLadoDos()+" Lado 3: "+getLadoTres() ;
        return aux;
    }
}
