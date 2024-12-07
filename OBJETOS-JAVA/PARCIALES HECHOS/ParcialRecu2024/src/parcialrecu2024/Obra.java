/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialrecu2024;

/**
 *
 * @author maximosimonetti
 */
public abstract class Obra {
    private String nombre;
    private String nombreDirector;
    private int cantActores;
    private int maxEspectadores;

    public Obra(String nombre, String nombreDirector, int cantActores, int maxEspectadores) {
        this.nombre = nombre;
        this.nombreDirector = nombreDirector;
        this.cantActores = cantActores;
        this.maxEspectadores = maxEspectadores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public int getCantActores() {
        return cantActores;
    }

    public void setCantActores(int cantActores) {
        this.cantActores = cantActores;
    }

    public int getMaxEspectadores() {
        return maxEspectadores;
    }

    public void setMaxEspectadores(int maxEspectadores) {
        this.maxEspectadores = maxEspectadores;
    }
    
    public abstract void  vaciarObra();
    
}
