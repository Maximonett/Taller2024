/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_17_10_22_tb_t1;

/**
 *
 * @author maximosimonetti
 */
public class Torneo {
    private String nombre;
    private Fechas[] fechas;

    public Torneo(String nombre, int nFechas, int maximoGoleadores) {
        this.nombre = nombre;
        this.fechas = new Fechas[nFechas];
        for (int i = 0; i < nFechas; i++) {
            fechas[i] = new Fechas(maximoGoleadores);
        }
    }

    public boolean agregarGoleador(int fecha, Goleadores goleador) {
        if (fecha >= 1 && fecha <= fechas.length) {
            return fechas[fecha - 1].agregarGoleador(goleador);
        }
        return false;
    }

    public Goleadores obtenerGoleadorConMenosGoles(int fecha) {
        if (fecha >= 1 && fecha <= fechas.length) {
            return fechas[fecha - 1].goleadorConMenosGoles();
        }
        return null;
    }

    public int contarGoleadoresTotales() {
        int total = 0;
        for (Fechas fecha : fechas) {
            total += fecha.getCantidadGoleadores();
        }
        return total;
    }

    @Override
    public String toString() {
        String resultado = "Torneo: " + nombre + "\n";
        for (int i = 0; i < fechas.length; i++) {
            resultado += "Fecha #" + (i + 1) + " / " + fechas[i].toString() + "\n";
        }
        return resultado;
    }
}
