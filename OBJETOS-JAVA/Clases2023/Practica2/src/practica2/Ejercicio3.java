/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica2;
/*3- Se realizará un casting para un programa de TV. El casting durará a 
lo sumo 5 días y en cada día se entrevistarán a 8 personas en distinto turno.
Una vez finalizada la inscripción:
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide nombre, 
DNI y edad y se la debe asignar en un día y turno de la siguiente manera: 
las personas primero completan el primer día en turnos sucesivos, luego el 
segundo día y así siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” 
o al cubrirse los 40 cupos de casting.
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. 
Para comparar Strings use el método equals.
*/

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author maximosimonetti
 */
public class Ejercicio3 {
    public static void main(String[] args) {
        
        Persona[][] vectorP=new Persona[5][8];
        
        int dia=0;
        int turno=0;
        String nombre="";
        int DNI;
        int edad;
        int cantidadPersonas=0;   
              
        //inicializar el vector Personas
        
       for ( dia=0;dia<5;dia++)
        {
            for (turno=0;turno<8;turno++)
            {
               vectorP[dia][turno]=new Persona();
            }
        }
        
        //reinicio dia y turno para hacer la carga
        dia=0;
        turno=0;
       
        // cargar vector aleatoriamente
        while (!nombre.equals("ZZZ") && cantidadPersonas<40 && dia<5)
        {
            
            
            nombre=GeneradorAleatorio.generarString(3);
            
            
            if (!nombre.equals("ZZZ")){
                DNI=GeneradorAleatorio.generarInt((30000000)+10000000);
                edad=GeneradorAleatorio.generarInt((100)+15);
            
                vectorP[dia][turno].setNombre(nombre);
                vectorP[dia][turno].setDNI(DNI);
                vectorP[dia][turno].setEdad(edad);
                
                cantidadPersonas++;
                
                turno++;
                
                if (turno==8){
                    turno=0;
                    dia++;
                }
                
            }
            
        }
        
        //Informar personas por dia y turno
        for (dia =0;dia<5;dia++)
        {
            for (turno=0;turno<8;turno++)
            {
                Persona persona= vectorP[dia][turno]; //creo una persona para recorrer la matriz
                if (persona.getNombre()!=null && !persona.getNombre().isEmpty())
                {
                    System.out.println("Dia "+(dia+1)+" -Turno "+(turno+1) +" : "+ persona.toString());
                }
            }
        }
       
        
        
    }
}
