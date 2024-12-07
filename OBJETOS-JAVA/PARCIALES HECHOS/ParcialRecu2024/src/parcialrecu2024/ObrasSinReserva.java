/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialrecu2024;

/**
 *
 * @author maximosimonetti
 */
public class ObrasSinReserva extends Obra{
    private int cantEntradasVendidas;
    private double precioEntrada;

    public ObrasSinReserva(int cantEntradasVendidas, double precioEntrada, String nombre, String nombreDirector, int cantActores, int maxEspectadores) {
        super(nombre, nombreDirector, cantActores, maxEspectadores);
        this.cantEntradasVendidas = cantEntradasVendidas;
        this.precioEntrada = precioEntrada;
    }

    public int getCantEntradasVendidas() {
        return cantEntradasVendidas;
    }

    public void setCantEntradasVendidas(int cantEntradasVendidas) {
        this.cantEntradasVendidas = cantEntradasVendidas;
    }

    public double getPrecioEntrada() {
        return precioEntrada;
    }

    public void setPrecioEntrada(double precioEntrada) {
        this.precioEntrada = precioEntrada;
    }
    
    public void vaciarObra(){
        this.setCantEntradasVendidas(0);
    }
    
}
