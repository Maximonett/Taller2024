/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnomañanatema1_06_05_24;

/**
 *
 * @author maximosimonetti
 */
public  class Turno {
    private String nombre="Sin definir";
    private double sueldoDocente=100000;
    private double costoDeCuota=150000;
    private Alumno[] alumnos;
    private int maxCantidadDeAlumnos;
    private int cantidadDeAlumnos=0;

    public Turno( int N) {
        this.maxCantidadDeAlumnos = N;
        this.nombre = nombre;
        this.sueldoDocente = sueldoDocente;
        this.costoDeCuota = costoDeCuota;
        this.alumnos = new Alumno[N];
        inicializarAlumnos();
        
    }
    
    public void inicializarAlumnos(){
        for (int i=0;i<maxCantidadDeAlumnos;i++){
            this.alumnos[i]=null;        
        }
    }
    
    public void ingresarAlumno(Alumno unAlumno){
        if (cantidadDeAlumnos<maxCantidadDeAlumnos){
            alumnos[getCantidadDeAlumnos()]=unAlumno;
            cantidadDeAlumnos++;
        }else{
            System.out.println("No hay mas espacio en el turno.");
        }
    }
    public double ganaciaDelTurno(){
        return (getCantidadDeAlumnos()*getCostoDeCuota())-getSueldoDocente();
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombreTurno(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoDocente() {
        return sueldoDocente;
    }

    public void setSueldoDocente(double sueldoDocente) {
        this.sueldoDocente = sueldoDocente;
    }

    public double getCostoDeCuota() {
        return costoDeCuota;
    }

    public void setCostoDeCuota(double costoDeCuota) {
        this.costoDeCuota = costoDeCuota;
    }

    public Alumno[] getAlumnos() {
        return alumnos;
    }

    public void setAlumnos(Alumno[] alumnos) {
        this.alumnos = alumnos;
    }

    public int getMaxCantidadDeAlumnos() {
        return maxCantidadDeAlumnos;
    }

    public void setMaxCantidadDeAlumnos(int maxCantidadDeAlumnos) {
        this.maxCantidadDeAlumnos = maxCantidadDeAlumnos;
    }

    public int getCantidadDeAlumnos() {
        return cantidadDeAlumnos;
    }

    public void setCantidadDeAlumnos(int cantidadDeAlumnos) {
        this.cantidadDeAlumnos = cantidadDeAlumnos;
    }
    
    public String toString(){
        String aux="\nDocente: "+getNombre()+"\n";
        for (int i=0;i<getCantidadDeAlumnos();i++){
            aux+="\n"+getAlumnos()[i].toString()+"\n";
        
        }
        return aux;
    }
    
}
