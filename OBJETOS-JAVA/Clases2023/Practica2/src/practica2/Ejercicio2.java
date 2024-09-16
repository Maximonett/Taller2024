/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica2;

/*2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo 
sumo 15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente 
hasta obtener edad 0. Luego de almacenar la información:
- Informe la cantidad de personas mayores de 65 años.
- Muestre la representación de la persona con menor DNI.
*/
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author maximosimonetti
 */
public class Ejercicio2 {
    public static void main(String[] args) {
        
        Persona[] vectorP= new Persona[15];
        
        
        String nombre;
        int edad;
        int DNI;
        
        //inicializar el vector
        for (int i=0;i<vectorP.length;i++){
            vectorP[i]=new Persona();
        }
        int cantidadPersonas = 0; // Contador para el número de personas almacenadas
        edad = -1; // Inicializar edad con un valor que no sea 0 para empezar el ciclo
        
       
        while (cantidadPersonas<vectorP.length && edad!=0){
            edad=GeneradorAleatorio.generarInt((100)+15);
            nombre=GeneradorAleatorio.generarString(10);
            DNI=GeneradorAleatorio.generarInt((3000000)+1200000);
            
            if (edad!=0){
            vectorP[cantidadPersonas].setNombre(nombre);
            vectorP[cantidadPersonas].setDNI(DNI);
            vectorP[cantidadPersonas].setEdad(edad);
            cantidadPersonas++;
            }
        }
        // Cantidad Mayor a 65
        
        int cantMayor65=0;
        for (int i=0;i<vectorP.length;i++)
        {
            if (vectorP[i].getEdad()>65)
            {
                cantMayor65++;
            }
        }
        
        System.out.println("Cantidad de personas con edad mayor a 65 años: "+cantMayor65);
       
        //Persona con con Mayor DNI
        
        if (cantidadPersonas>0)
        {
            Persona personaConMenorDNI=vectorP[0];
            for (int i=0;i<cantidadPersonas;i++)
            {
                if (vectorP[i].getDNI()<personaConMenorDNI.getDNI())
                {
                    personaConMenorDNI=vectorP[i];
                }
            }
            System.out.println("Persona con Menor DNI es "+personaConMenorDNI.toString());
        }else
            {
            System.out.println("El vector esta vacio");
        
            }
        
        
        
        
        
    }
}
