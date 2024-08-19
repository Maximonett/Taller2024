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
public class ShowPrivado extends EventoOcasional{
    
    public ShowPrivado(String contratante, int dia, String nombreBanda, int maxTemas) {
        super(contratante, dia, nombreBanda, maxTemas,150000.0);
    }
    
    public double calcularCosto(){
        return this.getCosto();
    }
    
    public void actuar(){
        System.out.println("Un feliz cumpleannos para "+this.getContratante()+"!");
        this.imprimirTemas();
    }
    
}
