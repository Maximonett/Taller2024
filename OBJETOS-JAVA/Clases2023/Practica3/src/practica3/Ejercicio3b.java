/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica3;

/**
 *
 * @author maximosimonetti
 */
public class Ejercicio3b {
    
    public static void main(String[] args) {
        
        Estante estante=new Estante();
        
        Autor autor = new Autor("Miguel", "Doctor en Filosofía", "Austriaco");
        Libro l1 = new Libro("Lalala", "Editorial X", 1984, autor, "123456789", 200.00);
        
        Libro l2 = new Libro("Mujercitas", "Editorial X", 1984, autor, "123456789", 200.00);
        
        Libro l3 = new Libro("Cien Años de Soledad", "Editorial X", 1984, autor, "123456789", 200.00);
        
        estante.agregarLibro(l2);
        estante.agregarLibro(l1);
        estante.agregarLibro(l3);
        
        System.out.println(estante.toString());
    }
    
}
