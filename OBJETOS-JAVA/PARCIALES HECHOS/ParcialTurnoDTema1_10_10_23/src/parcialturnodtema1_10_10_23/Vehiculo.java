/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnodtema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Vehiculo {
    private String patente;
    private int cantidadDeHoraasEstacionado;
    private  String marca;
    private String modelo;

    public Vehiculo(String patente, int cantidadDeHoraasEstacionado, String marca, String modelo) {
        this.patente = patente;
        this.cantidadDeHoraasEstacionado = cantidadDeHoraasEstacionado;
        this.marca = marca;
        this.modelo = modelo;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCantidadDeHoraasEstacionado() {
        return cantidadDeHoraasEstacionado;
    }

    public void setCantidadDeHoraasEstacionado(int cantidadDeHoraasEstacionado) {
        this.cantidadDeHoraasEstacionado = cantidadDeHoraasEstacionado;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    public String toString(){
        return "\nPatente: "+this.patente+" marca: "+this.marca+" modelo:  "
                +this.modelo+" Cantidad de horas estacionado: "+this.cantidadDeHoraasEstacionado+"\n";
    }
}
