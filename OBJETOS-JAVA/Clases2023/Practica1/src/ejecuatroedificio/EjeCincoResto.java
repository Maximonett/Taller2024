package ejecuatroedificio;

/*
 * 5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen 
 * (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad 
 * de la comida (2) Precio (3) Ambiente.
 * Escriba un programa que lea desde teclado las calificaciones de los cinco clientes 
 * para cada uno de los aspectos y almacene la información en una estructura. Luego imprima 
 * la calificación promedio obtenida por cada aspecto.
 */

import PaqueteLectura.Lector;

public class EjeCincoResto {

    public static void main(String[] args) {
        
        // Matriz de 5 clientes (filas) x 4 aspectos (columnas)
        int[][] calificaciones = new int[5][4];
        
        String[] aspectos = {"Atención al cliente", "Calidad de la comida", "Precio", "Ambiente"};
        
        // Paso 1: Pedir las calificaciones para cada cliente y cada aspecto
        for (int i = 0; i < 5; i++) { // Iterar sobre los clientes
            System.out.println("Cliente " + (i + 1) + ":");
            for (int j = 0; j < 4; j++) { // Iterar sobre los aspectos
                System.out.println("Evalue con un número (1-10) el aspecto: " + aspectos[j]);
                calificaciones[i][j] = Lector.leerInt();
            }
            System.out.println(); // Espacio entre clientes
        }
        
        // Paso 2: Calcular e imprimir el promedio por cada aspecto
        System.out.println("Promedio de calificaciones por aspecto:");
        for (int j = 0; j < 4; j++) { // Iterar sobre los aspectos
            int suma = 0;
            for (int i = 0; i < 5; i++) { // Sumar las calificaciones de los 5 clientes para el aspecto j
                suma += calificaciones[i][j];
            }
            double promedio = (double) suma / 5; // Calcular el promedio
            System.out.println(aspectos[j] + ": " + promedio);
        }
    }
}
