/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author tecno
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String director;
    private Investigador[] investigadores;
    private int maxInvestigadores;
    private int cantInvestigadores;

    public Proyecto(String nombre, int codigo, String director) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.director = director;
        maxInvestigadores = 50;
        investigadores = new Investigador[maxInvestigadores];
        cantInvestigadores=0;
    }
    
    public void agregarInvestigador(Investigador investigador){
        if (cantInvestigadores<maxInvestigadores){
            investigadores[cantInvestigadores]=investigador;
            cantInvestigadores++;
        }
    }
    
    public void otorgarTodos(String nombre){
        boolean encontre = false;
        int i=0;
        while ((!encontre)&&(i<cantInvestigadores)){
            if (investigadores[i].getNombre().equals(nombre)){
                encontre=true;
            } else {
                i++;
            }
        }
        if (encontre) {
            investigadores[i].otorgarTodos();
            }
        }
    
    
    

    public double getTotal(){ 
        int i;
        double total=0;
        for (i=0;i<cantInvestigadores;i++){
            total+=investigadores[i].getTotal();
    }
        return total;
}

    @Override
    public String toString() {
        String aux="Proyecto: " + "nombre=" + nombre + ", codigo=" + codigo + ", director=" + director+ ", monto total de platita=" + this.getTotal();
        for (int i=0;i<cantInvestigadores;i++){
            aux+=("\n"+investigadores[i].toString());
    }
        return aux;
    
}
}