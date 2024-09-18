/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Ejercicio2 {
    public static void main(String[] args) {
        Jugador j1= new Jugador(20, 10, "El Gaucho", 90000.00, 10);
        
        Entrenador e1=new Entrenador(20, "Guillermo", 50000.00, 10);
       
        System.out.println(j1.calcularEfectividad());
        System.out.println(e1.calcularEfectividad());
        System.out.println(e1.toString());
        System.out.println(j1.toString());
    }
}
