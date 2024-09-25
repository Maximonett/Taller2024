/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sistemaestanterias;

/**
 *
 * @author maximosimonetti
 */
public class Libro {
    private String titulo;
    private String nombrePrimerAutor;
    private double peso;

    public Libro(String titulo, String nombrePrimerAutor, double peso) {
        this.titulo = titulo;
        this.nombrePrimerAutor = nombrePrimerAutor;
        this.peso = peso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNombrePrimerAutor() {
        return nombrePrimerAutor;
    }

    public void setNombrePrimerAutor(String nombrePrimerAutor) {
        this.nombrePrimerAutor = nombrePrimerAutor;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    
    
    
}
