/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial_17_10_22_tb_t1;

/**
 *
 * @author maximosimonetti
 */
public class Parcial_17_10_22_TB_T1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Crear un torneo
        Torneo torneo = new Torneo("Torneo 2022", 3, 5);

        // Agregar algunos goleadores
        torneo.agregarGoleador(1, new Goleadores("Juan", "Equipo A", 2));
        torneo.agregarGoleador(1, new Goleadores("Pedro", "Equipo B", 1));
        torneo.agregarGoleador(2, new Goleadores("Luis", "Equipo C", 3));

        // Imprimir el torneo
        System.out.println(torneo.toString());
    }
}
    

