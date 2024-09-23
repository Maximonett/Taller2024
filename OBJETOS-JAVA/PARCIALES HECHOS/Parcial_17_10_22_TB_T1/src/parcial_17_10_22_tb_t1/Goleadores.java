/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_17_10_22_tb_t1;

/**
 *
 * @author maximosimonetti
 */
public class Goleadores {
    private String nombre;
    private String nombreEquipo;
    private int golesPorFecha;

    public Goleadores(String nombre, String nombreEquipo, int golesPorFecha) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.golesPorFecha = golesPorFecha;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    public int getGolesPorFecha() {
        return golesPorFecha;
    }

    @Override
    public String toString() {
        return "(" + nombre + ", " + nombreEquipo + ", " + golesPorFecha + " goles)";
    }
}

    
    

