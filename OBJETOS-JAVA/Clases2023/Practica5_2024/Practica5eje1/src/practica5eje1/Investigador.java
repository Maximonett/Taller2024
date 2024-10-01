/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje1;

/**
 *
 * @author maximosimonetti
 */
public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private int maxCantSubsidios=5;
    private Subsidio[] subsidios;
    private int cantidadSubsidios;

    public Investigador(String nombreCompleto, int categoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        if (categoria>=1 && categoria<=5){
            this.categoria = categoria;
        }else{
            System.out.println("La categoria tiene que ser un numero de 1 a 5. ");
        }
        this.especialidad = especialidad;
        this.subsidios=new Subsidio[maxCantSubsidios];
        this.cantidadSubsidios=0;
        inicializarSubsidios();
    }
    
    public void inicializarSubsidios(){
        for (int i=0;i<maxCantSubsidios;i++){
            subsidios[i]=null;
        }
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if (cantidadSubsidios<maxCantSubsidios){
            subsidios[cantidadSubsidios]=unSubsidio;
            cantidadSubsidios++;
        }else{
            System.out.println("Ya no se pueden agregar mas subsidios.");
        }
    }

    public String getNombreCompleto() {
        return this.nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getMaxCantSubsidios() {
        return maxCantSubsidios;
    }

    public void setMaxCantSubsidios(int maxCantSubsidios) {
        this.maxCantSubsidios = maxCantSubsidios;
    }

    public Subsidio[] getSubsidios() {
        return this.subsidios;
    }

    public void setSubsidios(Subsidio[] subsidios) {
        this.subsidios = subsidios;
    }

    public int getCantidadSubsidios() {
        return this.cantidadSubsidios;
    }

    public void setCantidadSubsidios(int cantidadSubsidios) {
        this.cantidadSubsidios = cantidadSubsidios;
    }
    
    
}
