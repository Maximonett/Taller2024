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
public abstract class EventoOcasional extends Recital {
    private String contratante;
    private int dia;

    public EventoOcasional(String contratante, int dia, String nombreBanda, int maxTemas,double costo) {
        super(nombreBanda, maxTemas,costo);
        this.contratante = contratante;
        this.dia = dia;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    
}
