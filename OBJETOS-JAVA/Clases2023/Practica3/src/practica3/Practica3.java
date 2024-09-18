/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica3;

/**
 *
 * @author maximosimonetti
 */
public class Practica3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Triangulo tri= new Triangulo(60.5,20.8,80.9,"Rojo","Verde");
        
        System.out.println("El area del triangulo es "+tri.calcularArea());
        System.out.println("El Perimetro del triangulo es "+tri.calcularPerimetro());
        
        Autor autor = new Autor("Miguel", "Doctor en Filosofía", "Austriaco");
        Libro libro = new Libro("Lalala", "Editorial X", 1984, autor, "123456789", 200.00);
        
        
        System.out.println("Detalles del libro");
        
        System.out.println(libro.toString());
        
        
    }
    
}
