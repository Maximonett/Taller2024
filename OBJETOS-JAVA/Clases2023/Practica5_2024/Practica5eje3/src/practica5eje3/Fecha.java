/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje3;

/**
 *
 * @author maximosimonetti
 */
public class Fecha {
    private String ciudad;
    private String diaEvento;
    private int numeroActualFecha;
    private int numeroSiguienteFecha;

    public Fecha(String ciudad, String diaEvento, int numeroActualFecha){
        this.diaEvento = diaEvento;
        this.numeroActualFecha = numeroActualFecha;
        this.numeroSiguienteFecha = numeroActualFecha+1;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }

    public int getNumeroActualFecha() {
        return numeroActualFecha;
    }

    public void setNumeroActualFecha(int numeroActualFecha) {
        this.numeroActualFecha = numeroActualFecha;
    }

    public int getNumeroSiguienteFecha() {
        return numeroSiguienteFecha;
    }

    public void setNumeroSiguienteFecha(int numeroSiguienteFecha) {
        this.numeroSiguienteFecha = numeroSiguienteFecha;
    }

    
    
    
}
