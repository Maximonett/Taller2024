package practica2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4b {
    public static void main(String[] args) {
        
        Persona[][] vectorP = new Persona[5][8];
        int[] inscriptosPorDia = new int[5];  // Array para contar inscriptos por día
        
        String nombre = "";
        int DNI;
        int edad;
        int cantidadPersonas = 0;
        
        // Inicializar el vector de Personas (matriz de 5 días con 8 turnos por día)
        for (int dia = 0; dia < 5; dia++) {
            for (int turno = 0; turno < 8; turno++) {
                vectorP[dia][turno] = null;  // Inicializamos con null para marcar turnos vacíos
            }
        }
        
        // Proceso de inscripción
        while (!nombre.equals("ZZZ") && cantidadPersonas < 40) {
            nombre = GeneradorAleatorio.generarString(3);  // Generar nombre aleatorio
            
            if (!nombre.equals("ZZZ")) {
                DNI = GeneradorAleatorio.generarInt(30000000) + 10000000;  // Generar DNI
                edad = GeneradorAleatorio.generarInt(100) + 15;            // Generar edad
                
                int dia = GeneradorAleatorio.generarInt(5);  // Generar día aleatorio (0 a 4)
                int turno = GeneradorAleatorio.generarInt(8);  // Generar turno aleatorio (0 a 7)
                
                boolean asignado = false;
                
                if (vectorP[dia][turno] == null) {
                    vectorP[dia][turno] = new Persona(nombre, DNI, edad);  // Asignar persona
                    inscriptosPorDia[dia]++;  // Incrementar la cantidad de inscriptos en ese día
                    cantidadPersonas++;  // Incrementar el total de personas inscritas
                    asignado = true;  // Marcar que la persona ha sido asignada
                }
                
                if (!asignado) {
                    System.out.println("No hay turnos disponibles para el día " + (dia + 1) + ", turno " + (turno + 1));
                }
            }
        }
        
        // Informar personas por día y turno
        for (int dia = 0; dia < 5; dia++) {
            System.out.println("Día " + (dia + 1) + ": " + inscriptosPorDia[dia] + " personas inscritas");
            for (int turno = 0; turno < 8; turno++) {
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
