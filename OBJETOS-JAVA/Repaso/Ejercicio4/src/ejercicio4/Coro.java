/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author tecno
 */
public abstract class Coro {
    private String nombreCoro;
    private Director director;

    public Coro(String nombreCoro, Director director) {
        this.nombreCoro = nombreCoro;
        this.director = director;
    }

    public abstract void agregarCorista(Corista corista);
    
    public abstract boolean estaLleno();
    
    public abstract boolean estaBienFormado();
    
    public abstract String toString();

    public String getNombreCoro() {
        return nombreCoro;
    }

    public void setNombreCoro(String nombreCoro) {
        this.nombreCoro = nombreCoro;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
}
