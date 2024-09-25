/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package libreria;

/**
 *
 * @author maximosimonetti
 */
public class LibrosElectronicos extends Libros {
    private String formato;
    private double tamaño;

    public LibrosElectronicos(String formato, double tamaño, String titulo, double precioBase) {
        super(titulo, precioBase);
        this.formato = formato;
        this.tamaño = tamaño;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public double getTamaño() {
        return tamaño;
    }

    public void setTamaño(double tamaño) {
        this.tamaño = tamaño;
    }

    public void cargarAutor(String nombre){
        super.cargarAutor(nombre);
    }
    
    @Override
    public double precioFinal(){
        return super.getPrecioBase() + this.tamaño*(2.5);     
    }
    
    public String toString(){
        String aux= super.toString()+ " el precio es $ "+ precioFinal();
        aux+="\nLos autores son: \n";
        
        String[] nombres=getNombreAutores();
               
        for (int i=0;i<nombres.length;i++){
            aux+= " Autor "+ (i+1) +" : " + nombres[i];
        }
        
    return aux;
    }
}