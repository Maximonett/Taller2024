/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnohtema1_17_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Concierto {
    private String nombreDelArtista;
    private double precioDeLaEntrada;
    private int cantidadDeEntradasVendidas=0;

    public Concierto(String nombreDelArtista, double precioDeLaEntrada) {
        this.nombreDelArtista = nombreDelArtista;
        this.precioDeLaEntrada = precioDeLaEntrada;
    }

    public String getNombreDelArtista() {
        return nombreDelArtista;
    }

    public void setNombreDelArtista(String nombreDelArtista) {
        this.nombreDelArtista = nombreDelArtista;
    }

    public double getPrecioDeLaEntrada() {
        return precioDeLaEntrada;
    }

    public void setPrecioDeLaEntrada(double precioDeLaEntrada) {
        this.precioDeLaEntrada = precioDeLaEntrada;
    }

    public int getCantidadDeEntradasVendidas() {
        return cantidadDeEntradasVendidas;
    }

    public void setCantidadDeEntradasVendidas(int cantidadDeEntradasVendidas) {
        this.cantidadDeEntradasVendidas = cantidadDeEntradasVendidas;
    }
    
    public String toString(){
    
        return " Nombre del Artista: "+this.nombreDelArtista+", precio de la entrada: $"+this.precioDeLaEntrada
                +", cantidad de entradas vendidas: "+this.cantidadDeEntradasVendidas+"\n";
    }
    
    
}
