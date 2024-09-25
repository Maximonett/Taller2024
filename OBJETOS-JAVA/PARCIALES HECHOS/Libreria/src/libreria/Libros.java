/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package libreria;

/**
 *
 * @author maximosimonetti
 */
public abstract class Libros {
    private String titulo;
    private double precioBase;
    private String[] nombreAutores;
    private int cantidadAutores=8;
    private int indiceNombres=0;
    
    public Libros(String titulo, double precioBase) {
        this.titulo = titulo;
        this.precioBase = precioBase;
        this.nombreAutores=new String[cantidadAutores];
    }

    public String[] getNombreAutores() {
        return nombreAutores;
    }

    public void setNombreAutores(String[] nombreAutores) {
        this.nombreAutores = nombreAutores;
    }
    
    
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }
    
    public  void cargarAutor(String nombre){
        if (indiceNombres<this.nombreAutores.length){
            this.nombreAutores[indiceNombres]=nombre;
            indiceNombres++;
        }else{
            System.out.println("No se puede agregar mas autores");
        }
    }
        
    public abstract double precioFinal();
    
    public String toString(){
        String aux= " Titulo del Libro: "+this.titulo;
                
                return aux;
    }
    
}


