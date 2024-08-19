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
import PaqueteLectura.GeneradorAleatorio;
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int cantTemasEventoOcasional = 5;
        int cantTemasGira = 4;
        int cantFechasGira = 3;

        //EventoOcasional eventoOcasional = new ShowPrivado("carlingui",13,"Los chanchitos",cantTemasEventoOcasional);
        //EventoOcasional eventoOcasional = new ShowDeTV("carlingui",13,"Los chanchitos",cantTemasEventoOcasional);
        EventoOcasional eventoOcasional = new Beneficio("carlingui",13,"Los chanchitos",cantTemasEventoOcasional);

        Gira gira = new Gira("Me veras volver",cantFechasGira,"Soda Stereo",cantTemasGira);
        
        //carga
        PaqueteLectura.GeneradorAleatorio.iniciar();
        int i;
        for (i=0;i<cantTemasEventoOcasional;i++){
            eventoOcasional.agregarTema(GeneradorAleatorio.generarString(10));
        }
        for (i=0;i<cantTemasGira;i++){
            gira.agregarTema(GeneradorAleatorio.generarString(10));
        }
        for (i=0;i<cantFechasGira;i++){
            gira.agregarFecha(new Fecha((GeneradorAleatorio.generarInt(31)+1),GeneradorAleatorio.generarString(10)));
        }        
        
        //costos
        System.out.println("Costo de la gira: "+gira.calcularCosto());
        System.out.println("Costo del evento: "+eventoOcasional.calcularCosto());
        
        //actuar
        System.out.println("Actuacion del evento");
        eventoOcasional.actuar();
        System.out.println("Actuacion de la gira");
        for (i=0;i<cantFechasGira;i++){
            gira.actuar();
        }
    }
    
}
