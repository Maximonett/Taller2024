/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje3;

/**
 *
 * @author maximosimonetti
 */
public class RecitalOcasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private String diaEvento;

    public RecitalOcasional(String motivo, String nombreContratante, String diaEvento, String nombre, int maxCantidadTemas) {
        super(nombre, maxCantidadTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.diaEvento = diaEvento;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    
    
    
}
