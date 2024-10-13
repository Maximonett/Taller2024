/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialobjetos17_07_21;
import java.util.ArrayList;
import java.util.Random;
/**
 *
 * @author maximosimonetti
 */
public class Fecha {
    private Sala[] salas;
    private int cantidadDeSalas=0;
    private int maxSalas;

    public Fecha(int N) {
        this.maxSalas = N;
        this.salas=new Sala[N];
        inicializarSalas();
    }
    
    public void inicializarSalas(){
        for (int i=0;i<maxSalas;i++){
            salas[i]=null;
        }        
    }
    
    public void agregarSala(Sala unaSala){
        if(cantidadDeSalas<maxSalas){
            salas[cantidadDeSalas]=unaSala;                       
        }
    }
    
    public void agregarAlumnoEnSalaX(Alumno unAlumno, Sala salaX) {
        // Verificamos si la sala es null
        if (salaX != null) {
            // Verificamos si la sala tiene espacio
            if (salaX.getCantidadDeAlumnos() < salaX.getMaxCantidadAlumnos()) {
                salaX.agregarAlumno(unAlumno);
            } else {
                System.out.println("La sala está llena.");
            }
        } else {
            System.out.println("La sala no existe.");
        }
    }

    
    public void asignarTemaAtodasLasSalas(){
        for (int i=0;i<cantidadDeSalas;i++){
            if (salas[i]!=null){
                salas[i].asignarUnTema();
            }                    
        }
    }
    
    public String toString(int T){
        String aux="Informacion de los alumnos con Tema: "+T+"\n";
        for (int i=0;i<cantidadDeSalas;i++){
            if(salas[i]!=null){
                aux+="\n"+salas[i].toString(T)+"\n";
            }
        }
        return aux;
    }
    
    public Sala[] getSalas() {
        return salas;
    }

    public void setSalas(Sala[] salas) {
        this.salas = salas;
    }

    public int getCantidadDeSalas() {
        return cantidadDeSalas;
    }

    public void setCantidadDeSalas(int cantidadDeSalas) {
        this.cantidadDeSalas = cantidadDeSalas;
    }

    public int getMaxSalas() {
        return maxSalas;
    }

    public void setMaxSalas(int maxSalas) {
        this.maxSalas = maxSalas;
    }
    
    
    
}
