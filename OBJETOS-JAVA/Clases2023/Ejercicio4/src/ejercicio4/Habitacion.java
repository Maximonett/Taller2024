/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

/**
 *
 * @author maximosimonetti
 */
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private boolean ocupada = false;
    private int numero;
    private double costo;
    private Cliente cliente;

    public Habitacion(int numero) {
        this.numero = numero;
        this.costo = GeneradorAleatorio.generarDouble(8000) + 2000;
        this.ocupada = false;
        this.cliente = null;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public void ingresarCliente(Cliente cliente) {
        if (!ocupada) {
            this.cliente = cliente;
            this.ocupada = true;
            System.out.println("Cliente ingresado en la habitación " + numero);
        } else {
            System.out.println("La habitación ya está ocupada.");
        }
    }

    @Override
    public String toString() {
        if (ocupada) {
            return "Habitacion{" + "numero=" + numero + ", costo=" + costo + ", ocupada=" + ocupada + ", cliente=" + cliente + '}';
        } else {
            return "Habitacion{" + "numero=" + numero + ", costo=" + costo + ", ocupada=libre}";
        }
    }
}

