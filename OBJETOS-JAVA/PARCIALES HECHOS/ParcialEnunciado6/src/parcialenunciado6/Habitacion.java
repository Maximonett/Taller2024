/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialenunciado6;

/**
 *
 * @author maximosimonetti
 */
public class Habitacion {
    private double costoPorDia;
    private boolean ocupada;
    private Cliente cliente;

    public Habitacion(double costoPorDia, int piso) {
        this.costoPorDia = 800 + 100 * piso; // Costo por día según el piso
        this.ocupada = false; // Inicialmente desocupada
        this.cliente = null; // Sin cliente asignado
    }

    public double getCostoPorDia() {
        return costoPorDia;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
        this.ocupada = cliente != null; // Si hay un cliente, la habitación está ocupada
    }

    @Override
    public String toString() {
        String estado = ocupada ? "Ocupada" : "Desocupada";
        return "Costo por día: " + costoPorDia + ", Estado: " + estado +
               (ocupada ? ", Cliente: " + cliente.toString() : "");
    }
}
