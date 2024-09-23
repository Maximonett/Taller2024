/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial_18_03_21;

/**
 *
 * @author maximosimonetti
 */
public class Parcial_18_03_21 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ConcursoBaile concurso = new ConcursoBaile(2);
        
        // Crear participantes
        Participante p1 = new Participante(123, "Juan", 25);
        Participante p2 = new Participante(456, "Ana", 30);
        Participante p3 = new Participante(789, "Luis", 22);
        Participante p4 = new Participante(321, "Marta", 35);

        // Crear parejas
        Pareja pareja1 = new Pareja("Salsa", p1, p2);
        Pareja pareja2 = new Pareja("Tango", p3, p4);

        // Agregar parejas al concurso
        concurso.agregarPareja(pareja1);
        concurso.agregarPareja(pareja2);

        // Obtener pareja con mayor diferencia de edad
        Pareja parejaMayorDiferencia = concurso.parejaConMayorDiferenciaEdad();
        
        if (parejaMayorDiferencia != null) {
            Participante[] pareja = parejaMayorDiferencia.getPareja();
            System.out.println("Pareja con mayor diferencia de edad: " + pareja[0].getNombre() + " y " + pareja[1].getNombre());
        }
    }
}