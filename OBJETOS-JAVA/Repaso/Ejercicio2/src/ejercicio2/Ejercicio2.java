/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author tecno
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Estacionamiento estacionamiento = new Estacionamiento("Estacionamiento el cachofas","47 y 551","7:00","21:30",3,10);
        Auto auto;
        GeneradorAleatorio.iniciar();
        for (int i=0;i<10;i++){
            estacionamiento.agregarAuto(new Auto(GeneradorAleatorio.generarString(6),GeneradorAleatorio.generarString(6)), (GeneradorAleatorio.generarInt(3)+1), (GeneradorAleatorio.generarInt(10))+1);
    }
    
        System.out.println(estacionamiento.toString());
        System.out.println("Ingrese numero de plaza: ");
        int plaza=Lector.leerInt();
        System.out.println("En la plaza hay "+estacionamiento.getCantAutosEnPlaza(plaza)+"autos");
        System.out.println("Ingrese patente: ");
        String patente=Lector.leerString();
        System.out.println(estacionamiento.findAuto(patente));      
    
    }
}
