/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialenunciado6;

/**
 *
 * @author maximosimonetti
 */
public class ParcialEnunciado6 {

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) {
        Hotel hotel = new Hotel(4, 2); // 4 pisos y 2 habitaciones por piso
        
        Cliente c1 = new Cliente("Juan", "12345678");
        Cliente c2 = new Cliente("Ana", "87654321");
        Cliente c3 = new Cliente("Carlos", "11223344");
        
        Habitacion h1=new Habitacion(0, 1);
        Habitacion h2=new Habitacion(0, 2);
        Habitacion h3=new Habitacion(0, 3);
        
        // Ingresar clientes a las habitaciones
        hotel.ingresarCliente(h1, c1, 0, 0); // Primer piso, primera habitación
        hotel.ingresarCliente(h2, c2, 1, 1); // Segundo piso, segunda habitación
        hotel.ingresarCliente(h3, c3, 2, 0); // Tercer piso, primera habitación

        // Imprimir el piso con mayor recaudación
        int pisoMayor = hotel.calcularPisoMayorRecaudacion();
        System.out.println("El piso con mayor recaudación es el: " + pisoMayor);
        
        System.out.println(h1.toString());
        
        System.out.println(hotel.toString());
    }
}
