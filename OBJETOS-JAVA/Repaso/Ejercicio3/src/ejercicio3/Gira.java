/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author Alumno
 */
public class Gira extends Recital {
    private String nombreGira;
    private Fecha[] fechas;
    private int maxFechas;
    private int cantFechas;
    private int actual;

    public Gira(String nombreGira, int maxFechas, String nombreBanda, int maxTemas) {
        super(nombreBanda, maxTemas, 30000.0);
        this.nombreGira = nombreGira;
        this.maxFechas = maxFechas;
        this.actual = 0;
        this.cantFechas = 0;
        fechas = new Fecha[maxFechas];

    }

    public double calcularCosto(){
        return cantFechas*this.getCosto();
    }
    
    public void agregarFecha(Fecha fecha){
        if (cantFechas<maxFechas){
            fechas[cantFechas]=fecha;
            cantFechas++;
        }
    }
    
    public void actuar(){
        if (actual<maxFechas){
        System.out.println("Buenas noches "+fechas[actual].getCiudad()+"!");
        this.imprimirTemas();
        actual++;
        }
    }
    
    public String getNombre() {
        return nombreGira;
    }

    public void setNombre(String nombre) {
        this.nombreGira = nombre;
    }
    
}
