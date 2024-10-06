/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje4;

/**
 *a. Implemente las clases necesarias teniendo en cuenta que los coros deberían crearse
con un director y sin ningún corista, pero sí sabiendo las dimensiones del coro.
 * @author maximosimonetti
 */
public abstract class Coros {
    private String nombre;
    private Director director;
    private int maxCantCoristas;
    private int cantidadCoristas=0;

    public Coros(Director director, int maxCantCoristas) {
        this.director = director;
        this.maxCantCoristas = maxCantCoristas;
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getMaxCantCoristas() {
        return maxCantCoristas;
    }

    public void setMaxCantCoristas(int maxCantCoristas) {
        this.maxCantCoristas = maxCantCoristas;
    }

    public int getCantidadCoristas() {
        return cantidadCoristas;
    }

    public void setCantidadCoristas(int cantidadCoristas) {
        this.cantidadCoristas = cantidadCoristas;
    }
    
    
    
    public abstract void inicializarCoro();
    
    public abstract void agregarUnCorista(Corista UnCorista);
    
    public abstract boolean estaLleno();
    
    public abstract boolean estaBienFormado();
    
    public abstract String toString();
    
}
