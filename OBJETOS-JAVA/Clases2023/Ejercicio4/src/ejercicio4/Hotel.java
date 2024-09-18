/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

/**
 *
 * @author maximosimonetti
 */
public class Hotel {
    private Habitacion[] habitaciones;

    public Hotel(int cantidadHabitaciones) {
        habitaciones = new Habitacion[cantidadHabitaciones];
        for (int i = 0; i < cantidadHabitaciones; i++) {
            habitaciones[i] = new Habitacion(i + 1); // Números de habitaciones desde 1 hasta N
        }
    }

    public void ingresarClienteEnHabitacion(Cliente cliente, int numeroHabitacion) {
        if (numeroHabitacion > 0 && numeroHabitacion <= habitaciones.length) {
            habitaciones[numeroHabitacion - 1].ingresarCliente(cliente);
        } else {
            System.out.println("Número de habitación inválido.");
        }
    }

    public void aumentarPrecios(double monto) {
        for (int i=0;i<habitaciones.length;i++)
        {
            habitaciones[i].setCosto(habitaciones[i].getCosto()+monto);
        }
       
    }

    @Override
    public String toString() {
        String resultado = "";
        for (int i = 0; i < habitaciones.length; i++) {
            resultado += habitaciones[i].toString() + "\n"; // Concatenar directamente
        }
        return resultado;
    }
}
