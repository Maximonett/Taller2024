/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnof_10_10_24;

/**
 *
 * @author maximosimonetti
 */
public class Ticket {
    private int numeroDeTicket;
    private String dni;
    private int cantidadDeLibrosComprados;
    private double montoAbonado;
    private String medioDePago;

    public Ticket(int numeroDeTicket, String dni, int cantidadDeLibrosComprados, double montoAbonado, String medioDePago) {
        this.numeroDeTicket = numeroDeTicket;
        this.dni = dni;
        this.cantidadDeLibrosComprados = cantidadDeLibrosComprados;
        this.montoAbonado = montoAbonado;
        this.medioDePago = medioDePago;
    }

    public int getNumeroDeTicket() {
        return numeroDeTicket;
    }

    public void setNumeroDeTicket(int numeroDeTicket) {
        this.numeroDeTicket = numeroDeTicket;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public int getCantidadDeLibrosComprados() {
        return cantidadDeLibrosComprados;
    }

    public void setCantidadDeLibrosComprados(int cantidadDeLibrosComprados) {
        this.cantidadDeLibrosComprados = cantidadDeLibrosComprados;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    public String toString(){
        return "Nro: "+this.numeroDeTicket+"\n DNI del Cliente: "+this.dni
                +"\nCantidad de libros Comprados: "+this.cantidadDeLibrosComprados
                +"\nMonto Abonado: "+this.montoAbonado
                +"\nMedio de pago: "+this.medioDePago+"\n";
    }
}
