/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialobjetos17_07_21;
import java.util.ArrayList;
import java.util.Random;
/**
 *Representar fechas de parcial tomadas por una cátedra. Una fecha de parcial guarda información de las N
salas en las que se distribuyeron los alumnos. Cada sala almacena información de los alumnos que rindieron
en ella (como máximo M). De los alumnos registra: nombre, DNI y nro. de tema asignado.
1- Genere las clases necesarias. Provea constructores para iniciar: las fechas de parcial para N salas y un
máximo de M alumnos por sala (inicialmente sin alumnos); los alumnos a partir de DNI y nombre (inicialmente
con nro. de tema indefinido -1).
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a. b. c. Agregar un alumno a la sala X de la fecha. Asuma que X es válido y que hay lugar para el alumno.
Asignar un tema a todos los alumnos de la fecha, de la siguiente manera: a los alumnos de una misma
sala se le asignan temas al azar (entre 1 y M).
Obtener un String con la información de los alumnos (nombre, DNI) que rinden el tema T.
3- Realice un programa que instancie una fecha de parcial para 2 salas y 4 alumnos por sala. Agregue
alumnos a la fecha, asigne temas a todos los alumnos y luego muestre la información obtenida del inciso c.
 * @author maximosimonetti
 */
public class ParcialObjetos17_07_21 {

    /**
     * 
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Alumno a1=new Alumno("Juan", "35123654");
        Alumno a2=new Alumno("Juan", "35123654");
        Alumno a3=new Alumno("Juan", "35123654");
        Alumno a4=new Alumno("Juan", "35123654");
        Alumno a5=new Alumno("Juan", "35123654");
        
        
        Sala s1=new Sala(5);
        Sala s2=new Sala(5);
        Sala s3=new Sala(5);
        
        
        
        
        Fecha f1=new Fecha(4);
        
        
        f1.agregarSala(s1);
        f1.agregarSala(s2);
        f1.agregarSala(s3);
        
      
        
        f1.agregarAlumnoEnSalaX(a1, s1);
        f1.agregarAlumnoEnSalaX(a2, s2);
        f1.agregarAlumnoEnSalaX(a3, s3);
        f1.agregarAlumnoEnSalaX(a4, s1);
        
        
        f1.asignarTemaAtodasLasSalas();
        
        System.out.println("lallalal");
        
        for (int i=0;i<5;i++){
            System.out.println(f1.toString(i));
        
        }
        
        
    }
    
}
