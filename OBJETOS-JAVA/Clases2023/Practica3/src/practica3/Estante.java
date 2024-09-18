/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica3;

/**
 *
 * @author maximosimonetti
 */
public class Estante {
    private int dimf=20;
    private int cantidadLibros=0;
    private Libro[] vectorL=new Libro[dimf];

    public Estante() {
    }
    
    public void inicializarEstante()
    {
        for (int i=0;i<dimf;i++)
        {
            vectorL=null;
        }
    }
    
    
    public int getCantidadLibros() {
        return cantidadLibros;
    }
    
    public boolean estaLleno()
    {   
        return cantidadLibros>=dimf;
    }
    
    public boolean agregarLibro(Libro libro)
    {
        if (estaLleno())
        {
            System.out.println("El estante esta lleno, no entran mas libros.");
            return false;
        }
        vectorL[cantidadLibros]=libro;
        cantidadLibros++;
        return true;
    }
    
    public Libro obtenerLibroPorTitulo(String titulo)
    {
        for (int i=0;i<cantidadLibros;i++)
        {
            if(vectorL[i].getTitulo().equalsIgnoreCase(titulo))
            {
                return vectorL[i];
            }
        }
        System.out.println("No se encontro el titulo: "+ titulo);
        return null;
    }
    

    public void setCantidadLibros(int cantidadLibros) {
        this.cantidadLibros = cantidadLibros;
    }

    public Libro[] getVectorL() {
        return vectorL;
    }

    public void setVectorL(Libro[] vectorL) {
        this.vectorL = vectorL;
    }

    @Override
    public String toString() {
        return "Estante{" + "dimf=" + dimf + ", cantidadLibros=" + cantidadLibros 
                + ", vectorL=" + vectorL + '}';
    }
    
    
    
    
    
    
    
    
}
