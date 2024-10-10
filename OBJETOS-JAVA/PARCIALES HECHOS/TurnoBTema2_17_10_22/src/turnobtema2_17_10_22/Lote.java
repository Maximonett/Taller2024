/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package turnobtema2_17_10_22;

/**
 *
 * @author maximosimonetti
 */
public class Lote {
    private double precio=50000;
    private Comprador comprador;

    public Lote(double precio) {
        this.precio = precio;
        this.comprador=null;
    }
    
    public Lote(){
    }
    
    public void incrementarPrecioPorcentaje(double porcentaje){
        this.precio+= this.precio*((1+porcentaje)/100);
    }
    

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Comprador getComprador() {
        return comprador;
    }

    public void setComprador(Comprador comprador) {
        this.comprador = comprador;
    }
    
    
    
}
