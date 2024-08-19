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
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int maxSubsidios;
    private int cantSubsidios;
    
    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        maxSubsidios=5;
        subsidios = new Subsidio[maxSubsidios];
        cantSubsidios =0;
    }
    
    public void agregarSubsidio(Subsidio subsidio){
        if (cantSubsidios<maxSubsidios){
            subsidios[cantSubsidios]=subsidio;
            cantSubsidios++;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public int getCantSubsidios() {
        return cantSubsidios;
    }

    public void otorgarTodos(){
        int i;
        for (i=0;i<cantSubsidios;i++){
            subsidios[i].setOtorgado(true);
    }
    }
    
    public double getTotal(){
        int i;
        double total=0;
        for (i=0;i<cantSubsidios;i++){
            if (subsidios[i].isOtorgado()){
            total+=subsidios[i].getMonto();
            }
            }
        return total;
}

    @Override
    public String toString() {
        return "Investigador:" + "nombre=" + nombre + ", categoria=" + categoria + ", especialidad=" + especialidad + ", total="+this.getTotal();
    }
    
    
}

