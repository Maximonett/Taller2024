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
public class Sala {
    private int cantidadDeAlumnos=0;
    private int maxCantidadAlumnos;
    private Alumno[] alumnos;

    public Sala(int M) {
        this.maxCantidadAlumnos = M;
        this.alumnos=new Alumno[M];
        inicializarALumnos();
    }
    
    public void inicializarALumnos(){
        for (int i=0;i<maxCantidadAlumnos;i++){
            alumnos[i]=null;
        }
    }
    
    public void agregarAlumno(Alumno unAlumno){
        if (cantidadDeAlumnos<maxCantidadAlumnos){
            alumnos[cantidadDeAlumnos]=unAlumno;
            cantidadDeAlumnos++;
        }
    }
    
    
    
    public void asignarUnTema(){
        Random random=new Random();
        
        for (int i=0;i<cantidadDeAlumnos;i++){            
            int randomNumber=random.nextInt((getMaxCantidadAlumnos())+1);
            alumnos[i].setNumeroDeTema(randomNumber);
        }
    }

    public int getCantidadDeAlumnos() {
        return cantidadDeAlumnos;
    }

    public void setCantidadDeAlumnos(int cantidadDeAlumnos) {
        this.cantidadDeAlumnos = cantidadDeAlumnos;
    }

    public int getMaxCantidadAlumnos() {
        return maxCantidadAlumnos;
    }

    public void setMaxCantidadAlumnos(int maxCantidadAlumnos) {
        this.maxCantidadAlumnos = maxCantidadAlumnos;
    }

    public Alumno[] getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(Alumno[] alumnos) {
        this.alumnos = alumnos;
    }
    
    public String toString(int unTema){
        String aux="";
        for (int i=0;i<cantidadDeAlumnos;i++){
            if (alumnos[i]!=null){
                if (alumnos[i].getNumeroDeTema()==unTema){
                    aux+="\n"+alumnos[i].toString()+"\n";
                }
            }
        }
    
        return aux;
    }
    
}
