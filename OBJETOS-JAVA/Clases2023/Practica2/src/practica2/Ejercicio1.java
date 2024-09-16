/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica2;

/*Realice un programa que cree un objeto persona con datos leídos desde teclado. 
Luego muestre en consola la representación de ese objeto en formato String.
*/

import PaqueteLectura.Lector;
/**
 *
 * @author maximosimonetti
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Persona p1;
        p1=new Persona();
        
        System.out.println("Ingrese un nombre: ");
        p1.setNombre(Lector.leerString());
        
        System.out.println("Ingrese un DNI: ");
        p1.setDNI( Lector.leerInt());
        
        System.out.println("Ingrese la edad: ");
        p1.setEdad(Lector.leerInt());
            
        
        System.out.println(p1);
        
       
    }
    
}
