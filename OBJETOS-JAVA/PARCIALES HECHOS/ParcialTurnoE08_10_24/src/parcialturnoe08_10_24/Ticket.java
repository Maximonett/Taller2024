/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe08_10_24;

/**
 *
 * @author maximosimonetti
 */
public class Ticket {
    private int numero;
    private String cuitCliente;
    private int cantidadProductosComprados=0;
    private double monto=0;
    private String medioDePago;

    public Ticket(int numero, String cuitCliente, String medioDePago) {
        this.numero = numero;
        this.cuitCliente = cuitCliente;
        this.medioDePago = medioDePago;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCuitCliente() {
        return cuitCliente;
    }

    public void setCuitCliente(String cuitCliente) {
        this.cuitCliente = cuitCliente;
    }

    public int getCantidadProductosComprados() {
        return cantidadProductosComprados;
    }

    public void setCantidadProductosComprados(int cantidadProductosComprados) {
        this.cantidadProductosComprados = cantidadProductosComprados;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    public String toString(){
        String aux=" Nro: "+this.numero+" CUIT del cliente: "+this.cuitCliente+" Cantidad de productos: "
                +this.cantidadProductosComprados+" Monto abonado: $"+this.monto+" Medio de pago: "+this.medioDePago;
        return aux;            
    }
    
    
}
