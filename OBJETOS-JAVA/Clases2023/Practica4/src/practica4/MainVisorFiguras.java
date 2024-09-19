/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class MainVisorFiguras {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
        
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa"); 
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste"); 
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        Circulo cir=new Circulo(56, "verde", "azul");
        Triangulo tri =new Triangulo(10, 20, 30, "rosa", "nergo");
        
        visor.mostrar(c1); 
        visor.mostrar(r); 
        visor.mostrar(c2);
        visor.mostrar(cir);
        visor.mostrar(tri);
        
        System.out.println(visor.getMostradas()); }

}
