/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author Alumno
 */
public abstract class Recital {
    private String nombreBanda;
    private int maxTemas;
    private int cantTemas;
    private String[] temas;
    private double costo;

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public Recital(String nombreBanda,int maxTemas,double costo){
        this.nombreBanda = nombreBanda;
        this.maxTemas = maxTemas;
        this.costo=costo;
        temas = new String[maxTemas];
        iniciarTemas();

    }
    
    private void iniciarTemas(){
        for (int i=0;i<maxTemas;i++){
            temas[i]="";
        }
    }
    
    public void agregarTema(String tema){
        if (cantTemas<maxTemas){
            temas[cantTemas]=tema;
            cantTemas++;
        }
    }
    
    public abstract void actuar();
    
    public abstract double calcularCosto();
    
    public void imprimirTemas(){
        for (int i = 0;i<cantTemas;i++){
            System.out.println("Y ahora tocaremos: "+temas[i]);
        }
    }
}
