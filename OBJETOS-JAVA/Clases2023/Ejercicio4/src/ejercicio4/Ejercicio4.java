/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio4;

/**
 *
 * @author maximosimonetti
 */
public class Ejercicio4 {

    public static void main(String[] args) {
        Hotel hotel = new Hotel(5); // Creamos un hotel con 5 habitaciones

        Cliente cliente1 = new Cliente("Juan Perez", 12345678, 35);
        Cliente cliente2 = new Cliente("Maria Garcia", 87654321, 28);

        hotel.ingresarClienteEnHabitacion(cliente1, 1); // Ingresamos a Juan en la habitación 1
        hotel.ingresarClienteEnHabitacion(cliente2, 3); // Ingresamos a Maria en la habitación 3

        System.out.println("Estado del hotel:");
        System.out.println(hotel.toString());

        hotel.aumentarPrecios(500); // Aumentamos el precio de todas las habitaciones en 500

        System.out.println("Estado del hotel después del aumento de precios:");
        System.out.println(hotel.toString());
    }
}

    

