/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Jugador extends Empleados{
    private int numeroDePArtidosJugados;
    private int numeroDeGolesAnotados;

    public Jugador(int numeroDePArtidosJugados, int numeroDeGolesAnotados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.numeroDePArtidosJugados = numeroDePArtidosJugados;
        this.numeroDeGolesAnotados = numeroDeGolesAnotados;
    }


    public int getNumeroDePArtidosJugados() {
        return numeroDePArtidosJugados;
    }

    public void setNumeroDePArtidosJugados(int numeroDePArtidosJugados) {
        this.numeroDePArtidosJugados = numeroDePArtidosJugados;
    }

    public int getNumeroDeGolesAnotados() {
        return numeroDeGolesAnotados;
    }

    public void setNumeroDeGolesAnotados(int numeroDeGolesAnotados) {
        this.numeroDeGolesAnotados = numeroDeGolesAnotados;
    }
    
    public double calcularEfectividad(){
        return (double) this.numeroDeGolesAnotados/this.numeroDePArtidosJugados;
    }
    
    public double calcularSueldoACobrar(){
        double sueldo;
        if (this.calcularEfectividad()>0.5){
           sueldo= 2*super.getSueldoBasico()+super.getSueldoBasico()*0.1;
        }else{
            sueldo=super.getSueldoBasico()+super.getSueldoBasico()*0.1;
        }
     
        return sueldo;
    }
    
    public String toString(){
        String aux= super.toString();
                    
        return aux;
    }
    
}
