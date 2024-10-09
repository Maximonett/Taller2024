/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciarturnoctema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Surtidor {
    private String tipoCombustible;
    private double precioXLitro;
    private Venta[] ventas;
    private int maxVentas;
    private int cantidadDeVentas=0;

    public Surtidor(String tipoCombustible, double precioXLitro) {
        this.tipoCombustible = tipoCombustible;
        this.precioXLitro = precioXLitro;
        this.maxVentas=100;
        this.ventas=new Venta[maxVentas];
        inicializarVentas();
    }
    
    public void inicializarVentas(){
        for (int i=0; i< maxVentas;i++){
            ventas[i]=null;
        }    
    }
    
    public void agregarVenta(Venta unaVenta){
        if (ventas[cantidadDeVentas]==null && cantidadDeVentas<maxVentas){
            ventas[cantidadDeVentas]=unaVenta;
            cantidadDeVentas++;
        }else{
            System.out.println("Por el momento no hay mas ventas posibles.");
        }    
    }
    
    public String getTipoCombustible() {
        return tipoCombustible;
    }

    public void setTipoCombustible(String tipoCombustible) {
        this.tipoCombustible = tipoCombustible;
    }

    public double getPrecioXLitro() {
        return precioXLitro;
    }

    public void setPrecioXLitro(double precioXLitro) {
        this.precioXLitro = precioXLitro;
    }

    public Venta[] getVentas() {
        return ventas;
    }

    public void setVentas(Venta[] ventas) {
        this.ventas = ventas;
    }

    public int getMaxVentas() {
        return maxVentas;
    }

    public void setMaxVentas(int maxVentas) {
        this.maxVentas = maxVentas;
    }

    public int getCantidadDeVentas() {
        return cantidadDeVentas;
    }

    public void setCantidadDeVentas(int cantidadDeVentas) {
        this.cantidadDeVentas = cantidadDeVentas;
    }
    
    
    
    
}
