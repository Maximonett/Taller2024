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
import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Investigador investigador1=new Investigador("carlitos",2,"ingeniero electronico");
        Investigador investigador2=new Investigador("pepe",1,"ingeniero nuclear");
        Investigador investigador3=new Investigador("mateo",3,"ingeniero en materiales");
        
        Proyecto proyectito=new Proyecto("ARSAT45",123123,"Juan Domingo Peron");
        
        GeneradorAleatorio.iniciar();
        Subsidio subsidio;
        subsidio = new Subsidio(GeneradorAleatorio.generarDouble(3000),"Platita.");
        investigador1.agregarSubsidio(subsidio);
        subsidio = new Subsidio(GeneradorAleatorio.generarDouble(3000),"Platita.");
        investigador1.agregarSubsidio(subsidio);
        
        subsidio = new Subsidio(GeneradorAleatorio.generarDouble(3000),"Platita.");
        investigador2.agregarSubsidio(subsidio);
        subsidio = new Subsidio(GeneradorAleatorio.generarDouble(3000),"Platita.");
        investigador2.agregarSubsidio(subsidio);  
        
        subsidio = new Subsidio(GeneradorAleatorio.generarDouble(3000),"Platita.");
        investigador3.agregarSubsidio(subsidio);    
        subsidio = new Subsidio(GeneradorAleatorio.generarDouble(3000),"Platita.");
        investigador3.agregarSubsidio(subsidio);
        
        proyectito.agregarInvestigador(investigador1);
        proyectito.agregarInvestigador(investigador2);
        proyectito.agregarInvestigador(investigador3);
        
        proyectito.otorgarTodos("pepe");
        proyectito.otorgarTodos("carlitos");
        proyectito.otorgarTodos("marta");
        
        System.out.println(proyectito.toString());

    }
    
}
