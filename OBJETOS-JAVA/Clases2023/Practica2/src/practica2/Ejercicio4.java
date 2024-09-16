/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;

/*4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos 
(nombre, DNI, edad) y el día en que se quiere presentar al casting. La persona debe ser 
inscripta en ese día, en el siguiente turno disponible. En caso de no existir un turno en ese día, 
informe la situación. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse 
los 40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la persona 
a entrevistar en cada turno asignado.
*/

/**
 *
 * @author maximosimonetti
 */
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {
    public static void main(String[] args) {
        
        Persona[][] vectorP=new Persona[5][8];
        int[] inscriptosPorDia = new int[5];      // Array para contar inscriptos por día
        
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
               vectorP[dia][turno]=null;
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
                
                dia=GeneradorAleatorio.generarInt((5));
                
                boolean asignado=false;
                
                for (turno=0;turno<8 && !asignado; turno++)
                {
                    if (vectorP[dia][turno]==null)
                    {
                        vectorP[dia][turno]=new Persona(nombre,DNI,edad);
                        inscriptosPorDia[dia]++;
                        cantidadPersonas++;
                        asignado=true;
                    }
                }
                if (!asignado)
                {
                    System.out.println("No hay turnos disponibles para el dia " + (dia+1));
                }
                }
            
            
        // Informar personas por día y turno
        for (dia = 0; dia < 5; dia++) {
            System.out.println("Día " + (dia + 1) + ": " + inscriptosPorDia[dia] + " personas inscritas");
            for ( turno = 0; turno < 8; turno++) {
                Persona persona = vectorP[dia][turno];  // Obtener la persona asignada al turno
                if (persona != null) {
                    System.out.println(" - Turno " + (turno + 1) + ": " + persona.toString());
                } else {
                    System.out.println(" - Turno " + (turno + 1) + ": [Vacío]");
                }
            
            }
        }
    }
    }
}
           
                
            
            
