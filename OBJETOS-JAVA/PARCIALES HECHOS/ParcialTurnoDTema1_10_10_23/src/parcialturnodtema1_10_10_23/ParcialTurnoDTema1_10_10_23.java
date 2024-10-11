/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnodtema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class ParcialTurnoDTema1_10_10_23 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Estacionamiento e1=new Estacionamiento(" 48 y 22", 3000, 4, 5);
        
        Vehiculo v1=new Vehiculo("AD 019 YU", 10, "FIAT", "Punto");
        Vehiculo v2=new Vehiculo("AD 020 YU", 10, "FIAT", "Punto");
        Vehiculo v3=new Vehiculo("AD 021 YU", 10, "FIAT", "Punto");
        Vehiculo v4=new Vehiculo("AD 022 YU", 10, "FIAT", "Punto");
        
        e1.registresrUnVehiculo(3, 2, v1);
        e1.registresrUnVehiculo(1, 2, v2);
        e1.registresrUnVehiculo(2, 2, v3);
        e1.registresrUnVehiculo(3, 3, v4);
        
        
        
        
        System.out.println(e1.toString());
        
        System.out.println(e1.liberarTodosLosLugares(3, "FIAT"));
        
        System.out.println(e1.toString());
        
        
        
        System.out.println("El sector que recudo mas fue el "+e1.sectorQueRecaudoMas());
        
    }
    
}
