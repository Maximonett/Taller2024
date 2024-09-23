/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_17_10_22_tb_t1;

/**
 *
 * @author maximosimonetti
 */
public class Fechas {
    private int maximoGoleadores;
    private Goleadores[] goleadores;
    private int cantidadGoleadores;

    public Fechas(int maximoGoleadores) {
        this.maximoGoleadores = maximoGoleadores;
        this.goleadores = new Goleadores[maximoGoleadores];
        this.cantidadGoleadores = 0;
    }

    // Método para agregar un goleador
    public boolean agregarGoleador(Goleadores goleador) {
        if (cantidadGoleadores < maximoGoleadores) {
            goleadores[cantidadGoleadores] = goleador;
            cantidadGoleadores++;
            return true;
        } else {
            System.out.println("No hay más lugar para goleadores en esta fecha.");
            return false;
        }
    }

    // Obtener el goleador con menos goles
    public Goleadores goleadorConMenosGoles() {
        if (cantidadGoleadores == 0) return null;
        Goleadores menor = goleadores[0];
        for (int i = 1; i < cantidadGoleadores; i++) {
            if (goleadores[i].getGolesPorFecha() < menor.getGolesPorFecha()) {
                menor = goleadores[i];
            }
        }
        return menor;
    }

    public int getCantidadGoleadores() {
        return cantidadGoleadores;
    }

    @Override
    public String toString() {
        String resultado = "Cantidad de goleadores de la fecha: " + cantidadGoleadores + " | Goleadores: ";
        for (int i = 0; i < cantidadGoleadores; i++) {
            resultado += goleadores[i].toString() + " ";
        }
        return resultado;
    }
}
