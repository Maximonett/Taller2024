/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package libreria;

/**
 *
 * @author maximosimonetti
 */
public class LibrosImpresos extends Libros {
    private boolean tapaDura;

    public LibrosImpresos(boolean tapaDura, String titulo, double precioBase) {
        super(titulo, precioBase);
        this.tapaDura = tapaDura;
    }

    public boolean isTapaDura() {
        return tapaDura;
    }

    public void setTapaDura(boolean tapaDura) {
        this.tapaDura = tapaDura;
    }
    
    public void cargarAutor(String nombre){    
        super.cargarAutor(nombre);
    }
    
    public double precioFinal(){
        double costo=super.getPrecioBase();
        
        if(isTapaDura()){
            return costo+=500;
        }else{
            return costo;
        }
    
    }
    
    public String toString(){
        String aux= super.toString()+" el precio final es "+precioFinal();
        
        String[] autores=super.getNombreAutores();
        aux+="\nLos Autore son:\n";
        for (int i=0;i<autores.length;i++){
            
            aux+=" Autor "+(i+1)+" : "+autores[i];
        }
        return aux;
    }
    
}
