/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class MainVisorModificado {
    public static void main(String[] args) {
        
        VisorFigurasModificado visor=new VisorFigurasModificado();
        
        Cuadrado c1=new Cuadrado(20, "rojo", "verde");
        Cuadrado c2=new Cuadrado(20, "rojo", "verde");
        Rectangulo r1=new Rectangulo(20, 30, "rosa", "rojo");
        Triangulo t1=new Triangulo(10, 20, 40, "azul", "rojo");
        
        
        visor.guardar(c1);
        visor.guardar(r1);
        visor.guardar(c2);
        
        visor.mostrar();
        
        
        
    }
}
