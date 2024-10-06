/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje3;

/**
 *
 * @author maximosimonetti
 */
public abstract class Recital {
    private String nombre;
    private int  maxCantidadTemas;
    private String[] listaDeTemas;
    private int cantidadTemas;

    public Recital(String nombre, int maxCantidadTemas) {
        this.nombre = nombre;
        this.maxCantidadTemas = maxCantidadTemas;
        this.listaDeTemas=new String[maxCantidadTemas];
        this.cantidadTemas=0;
        inicializarTemas();
    }
    
    public void inicializarTemas(){
        for (int i=0; i<maxCantidadTemas;i++){
            listaDeTemas[i]=null;     
        }
    }
    
    public void agregarTema(String unTema){
        if (listaDeTemas[cantidadTemas]==null && cantidadTemas<maxCantidadTemas){
            listaDeTemas[cantidadTemas]=unTema;
            cantidadTemas++;
        }else{
            System.out.println("No hay mas lugar en la lista de Temas.");
        }
    }
    
    public String actuar(String unTema){
        return "y ahora tocaremos..."+unTema;
    }
    
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getMaxCantidadTemas() {
        return maxCantidadTemas;
    }

    public void setMaxCantidadTemas(int maxCantidadTemas) {
        this.maxCantidadTemas = maxCantidadTemas;
    }

    public String[] getListaDeTemas() {
        return this.listaDeTemas;
    }

    public void setListaDeTemas(String[] listaDeTemas) {
        this.listaDeTemas = listaDeTemas;
    }

    public int getCantidadTemas() {
        return cantidadTemas;
    }

    public void setCantidadTemas(int cantidadTemas) {
        this.cantidadTemas = cantidadTemas;
    }
    
    
    
    
}
