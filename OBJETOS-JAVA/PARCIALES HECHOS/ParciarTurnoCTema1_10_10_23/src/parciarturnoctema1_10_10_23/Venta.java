/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciarturnoctema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Venta {
    private String dniCliente;
    private int cantidadLitrosCargados;
    private double montoAbonado;
    private String medioDePago;

    public Venta(String dniCliente, int cantidadLitrosCargados, double montoAbonado, String medioDePago) {
        this.dniCliente = dniCliente;
        this.cantidadLitrosCargados = cantidadLitrosCargados;
        this.montoAbonado = montoAbonado;
        this.medioDePago = medioDePago;
    }

    public Venta(String dniCliente, int cantidadLitrosCargados, String medioDePago) {
        this.dniCliente = dniCliente;
        this.cantidadLitrosCargados = cantidadLitrosCargados;
        this.medioDePago = medioDePago;
    }
    
    
    

    public String getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(String dniCliente) {
        this.dniCliente = dniCliente;
    }

    public int getCantidadLitrosCargados() {
        return cantidadLitrosCargados;
    }

    public void setCantidadLitrosCargados(int cantidadLitrosCargados) {
        this.cantidadLitrosCargados = cantidadLitrosCargados;
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
        return "DNI "+this.dniCliente+" Cantidad de Litros Cargados: "+this.cantidadLitrosCargados
                +" Monto Abonado: "+this.montoAbonado+"\n";
    }
    
}
