/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialalumnos;

/**
 *
 * @author maximosimonetti
 */
public abstract class Alumno {
    private String dni;
    private String nombre;
    private Materia[] materiasAprobadas;
    private int maxMatariasAprobadas;
    private int cantidadDeMateriasAprobadas;

    public Alumno(String dni, String nombre, int N) {
        this.dni = dni;
        this.nombre = nombre;
        this.maxMatariasAprobadas = N;
        this.cantidadDeMateriasAprobadas=0;
        this.materiasAprobadas=new Materia[N];
        inicializarMateriasAprobadas();       
    }
    
    public void inicializarMateriasAprobadas(){
        for (int i=0;i<maxMatariasAprobadas;i++){
            materiasAprobadas[i]=null;
        }
    }
    
    public void agregarMaterias(Materia unaMateria){
        if(materiasAprobadas[cantidadDeMateriasAprobadas]==null && unaMateria.getNota()>=4 && cantidadDeMateriasAprobadas<maxMatariasAprobadas){
            materiasAprobadas[cantidadDeMateriasAprobadas]=unaMateria;
            cantidadDeMateriasAprobadas++;
            System.out.println("La materia fue agregada.");
        }else{
            System.out.println("La materia no cumplio para ser agregada.");
        }
    }
    
    public boolean estaGraduado(int N){
        boolean si=false;
        int i=0;
        boolean tesisAprobada=false;

        if(this.cantidadDeMateriasAprobadas==N){
            
            while(i< N && materiasAprobadas[i]!=null && tesisAprobada==false){
                if(materiasAprobadas[i].getNombre().equals("Tesis")){
                    si=true;
                    tesisAprobada=true;
                    System.out.println("Te Felicito estas graduado.");                    
                }
                i++;
            }
        }        
        return si;
    }
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Materia[] getMateriasAprobadas() {
        return materiasAprobadas;
    }

    public void setMateriasAprobadas(Materia[] materiasAprobadas) {
        this.materiasAprobadas = materiasAprobadas;
    }

    public int getMaxMatariasAprobadas() {
        return maxMatariasAprobadas;
    }

    public void setMaxMatariasAprobadas(int maxMatariasAprobadas) {
        this.maxMatariasAprobadas = maxMatariasAprobadas;
    }

    public int getCantidadDeMateriasAprobadas() {
        return cantidadDeMateriasAprobadas;
    }

    public void setCantidadDeMateriasAprobadas(int cantidadDeMateriasAprobadas) {
        this.cantidadDeMateriasAprobadas = cantidadDeMateriasAprobadas;
    }
    
    
}
