/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author maximosimonetti
 */
public class Entrenador extends Empleados{
    private int cantidadDeCampeonatosGanados;

    public Entrenador(int cantidadDeCampeonatosGanados, String nombre, double sueldoBasico, int antiguedad) {
        super(nombre, sueldoBasico, antiguedad);
        this.cantidadDeCampeonatosGanados = cantidadDeCampeonatosGanados;
    }

    public int getCantidadDeCampeonatosGanados() {
        return cantidadDeCampeonatosGanados;
    }

    public void setCantidadDeCampeonatosGanados(int cantidadDeCampeonatosGanados) {
        this.cantidadDeCampeonatosGanados = cantidadDeCampeonatosGanados;
    }
   
    public double calcularEfectividad(){
    
        return (double) this.cantidadDeCampeonatosGanados/super.getAntiguedad();        
    }
    
    public double calcularSueldoACobrar(){
        double sueldo;
        if (1<this.cantidadDeCampeonatosGanados&& this.cantidadDeCampeonatosGanados<=4){
            sueldo=super.getSueldoBasico()+getSueldoBasico()*0.1+(5000.00);
        }else if(4<this.cantidadDeCampeonatosGanados&& this.cantidadDeCampeonatosGanados<=10){
            sueldo=super.getSueldoBasico()+super.getSueldoBasico()*0.1+(30000.00);
        }else if(this.cantidadDeCampeonatosGanados>10){
            sueldo=super.getSueldoBasico()+super.getSueldoBasico()*0.1+(50000.00);
        }else{
            sueldo=super.getSueldoBasico()+super.getSueldoBasico()*0.1;
        }
        return sueldo;
    }
    
    public String toString(){
        String aux;
        aux=super.toString();
        return aux;
    
    }
    
   
}
