/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialgnc;

/**
 *
 * @author maximosimonetti
 */
public class Venta {
    private String dniCliente;
    private double cantM3cargados;
    private double montoAbonado;
    private String medioDePago;

    public Venta(String dniCliente, double cantM3cargados, String medioDePago) {
        this.dniCliente = dniCliente;
        this.cantM3cargados = cantM3cargados;
        this.montoAbonado = 0;
        this.medioDePago = medioDePago;
    }

    public String getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(String dniCliente) {
        this.dniCliente = dniCliente;
    }

    public double getCantM3cargados() {
        return cantM3cargados;
    }

    public void setCantM3cargados(double cantM3cargados) {
        this.cantM3cargados = cantM3cargados;
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

    @Override
    public String toString() {
        return "\n DNI del cliente: "+getDniCliente()
                +" Cantidad de M3 cargados: "+getCantM3cargados()
                +" Monto Abonado: $"+getMontoAbonado()+"\n";
    }
    
    
}
