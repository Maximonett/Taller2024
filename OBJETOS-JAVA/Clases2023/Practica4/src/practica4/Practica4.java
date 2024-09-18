/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Practica4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Circulo  c1=new Circulo(20, "Rojo", "Verde");
        
        System.out.println(c1.toString());
        
        Triangulo t1= new Triangulo(10, 20, 40, "uzul","blanco");
        
        System.out.println(t1.toString());
        
        t1.despintar();
        c1.despintar();
        
        System.out.println(c1.toString());
        System.out.println(t1.toString());
        
        
        
    }
    
}
