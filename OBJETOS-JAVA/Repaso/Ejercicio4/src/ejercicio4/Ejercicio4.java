/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author tecno
 */
import PaqueteLectura.Lector;
public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //CORO SEMICIRCULAR
        System.out.println("|||||||||||||CORO SEMICIRCULAR|||||||||||||");
        System.out.println("Ingrese cantidad de coristas: ");
        int cantCoristas=Lector.leerInt();
        System.out.println("Ingrese nombre del coro:");
        String nombreCoro=Lector.leerString();
        System.out.println("Ingrese dni del director:");
        int dniDirector=Lector.leerInt();
        System.out.println("Ingrese edad del director:");
        int edadDirector=Lector.leerInt();
        System.out.println("Ingrese antiguedad del director:");
        int antiguedadDirector=Lector.leerInt();        
        CoroSemicircular coroSemicircular = new CoroSemicircular(cantCoristas,nombreCoro,new Director(antiguedadDirector,dniDirector,edadDirector));
        //Ingreso de coristas
        System.out.println("Esta lleno:"+coroSemicircular.estaLleno());
        for (int i=0;i<cantCoristas;i++){
            System.out.println("Ingrese dni del corista:");
            int dniCorista=Lector.leerInt();
            System.out.println("Ingrese edad del corista:");
            int edadCorista=Lector.leerInt();
            System.out.println("Ingrese tono fundamental del corista:");
            int tonoFundamental=Lector.leerInt();
            coroSemicircular.agregarCorista(new Corista(tonoFundamental,dniCorista,edadCorista));
        }
        System.out.println("Esta lleno:"+coroSemicircular.estaLleno()); 
        System.out.println("Esta bien formado:"+coroSemicircular.estaBienFormado());
        System.out.println(coroSemicircular.toString());
        
        
        //CORO POR HILERAS
        System.out.println("|||||||||||||CORO POR HILERAS|||||||||||||");
        System.out.println("Ingrese cantidad de filas: ");
        int filas=Lector.leerInt();
        System.out.println("Ingrese cantidad de columnas: ");
        int columnas=Lector.leerInt();        
        System.out.println("Ingrese nombre del coro:");
        nombreCoro=Lector.leerString();
        int dimf=filas*columnas;
        System.out.println("Ingrese dni del director:");
        dniDirector=Lector.leerInt();
        System.out.println("Ingrese edad del director:");
        edadDirector=Lector.leerInt();
        System.out.println("Ingrese antiguedad del director:");
        antiguedadDirector=Lector.leerInt();        
        CoroPorHileras coroPorHileras = new CoroPorHileras(filas,columnas,nombreCoro,new Director(antiguedadDirector,dniDirector,edadDirector));
        //Ingreso de coristas
        System.out.println("Esta lleno:"+coroPorHileras.estaLleno());
        for (int i=0;i<dimf;i++){
            System.out.println("Ingrese dni del corista:");
            int dniCorista=Lector.leerInt();
            System.out.println("Ingrese edad del corista:");
            int edadCorista=Lector.leerInt();
            System.out.println("Ingrese tono fundamental del corista:");
            int tonoFundamental=Lector.leerInt();
            coroPorHileras.agregarCorista(new Corista(tonoFundamental,dniCorista,edadCorista));
        }
        System.out.println("Esta lleno:"+coroPorHileras.estaLleno()); 
        System.out.println("Esta bien formado:"+coroPorHileras.estaBienFormado());
        System.out.println(coroPorHileras.toString());
    }
    
}
