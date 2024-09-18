/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica3;

/**
 *
 * @author maximosimonetti
 */

public class Triangulo {
    private  double ladoUno;
    private  double ladoDos;
    private  double ladoTres;
    private String colorRelleno;
    private String coloLinea;

    public Triangulo(double ladoUno, double ladoDos, double ladoTres, String colorRelleno, String coloLinea) {
        this.ladoUno = ladoUno;
        this.ladoDos = ladoDos;
        this.ladoTres = ladoTres;
        this.colorRelleno = colorRelleno;
        this.coloLinea = coloLinea;
    }
    
    public double calcularPerimetro()
    {
       return ladoUno+ladoDos+ladoTres;                    
        
    }
    
    public double calcularArea()
    {
        double p=calcularPerimetro();
        double s=p/2;
        return  Math.sqrt(s*(s-ladoUno)*(s-ladoDos)*(s-ladoTres));
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

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColoLinea() {
        return coloLinea;
    }

    public void setColoLinea(String coloLinea) {
        this.coloLinea = coloLinea;
    }
      
    
    
    
}
