/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejecuatroedificio;


/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso (1..4). 
Realice un programa que permita informar la cantidad de personas que concurrieron a cada oficina 
de cada piso. Para esto, simule la llegada de personas al edificio de la siguiente manera: a cada persona 
se le pide el nro. de piso y nro. de oficina a la cual quiere concurrir. La 
llegada de personas finaliza al indicar un nro. de piso 9. Al finalizar la llegada de personas, 
informe lo pedido.
*/

/**
 *
 * @author maximosimonetti
 */

import PaqueteLectura.Lector;

public class EjeCuatroEdificio {

    public static void main(String[] args) {
        int[][] oficinas = new int[8][4]; // 8 pisos, 4 oficinas por piso

        int piso, oficina;

        System.out.println("Ingrese número de piso (1-8) y número de oficina (1-4).");
        System.out.println("Para terminar ingrese el número de piso 9.");

        // Ingresar el número de piso
        System.out.print("Número de piso: ");
        piso = Lector.leerInt();

        // Mientras no se ingrese el número de piso 9, el programa continúa
        while (piso != 9) {
            // Verificar que el número de piso esté entre 1 y 8
            if (piso < 1 || piso > 8) {
                System.out.println("El piso es incorrecto.");
            } else {
                // Ingresar el número de oficina
                System.out.print("Ingrese el número de oficina: ");
                oficina = Lector.leerInt();

                // Verificar que el número de oficina esté entre 1 y 4
                if (oficina < 1 || oficina > 4) {
                    System.out.println("La oficina no existe.");
                } else {
                    // Incrementar el contador de personas para la oficina especificada
                    oficinas[piso - 1][oficina - 1]++; //la resta se debe al indice que en JAVA arranca de 0
                }
            }

            // Pedir de nuevo el número de piso para continuar o terminar
            System.out.print("Número de piso: ");
            piso = Lector.leerInt();
        }

        // Informar la cantidad de personas que concurrieron a cada oficina
        System.out.println("Cantidad de personas por oficina:");
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.println("Piso " + (i + 1) + " Oficina " + (j + 1) + ": " + oficinas[i][j] + " personas"); //se suma +1 por el indice que arranca en cero
            }
        }
    }
}
