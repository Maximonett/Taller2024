/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2022alumnos;

/**
 *Representar un curso con alumnos. Un curso tiene año de cursada, 
 * y guarda la información de sus alumnos (como maximo N alumnos). 
 * De cada alumno an conoce: DNI, nombre, asistencias y cantidad de 
 * autoevaluaciones aprobadas. Un curso puede ser a distancia o presencial, 
 * Los cursos a distancia llevan el link a la sala virtual y los cursos presenciales
levan el numero de aula.
1- Genere las clases necesarias. 
* Provea constructores para iniciar los cursos con un año de cursada, 
* un máximo de alumnoe N los cursos se crean sin afumnos inscriptos. 
* Un alumno se crea con 0 asistencia V. O autoevatuaciones aprobadas.
2- Implemente los métodos necesarios, en las clases que correspondo, para.
a) agregarAlumno; Agregar un alumno a un curso. El método debe retornar 
* true si pudo agregar al alumno y false en case contrario
b) incrementarAsistencia: Dado un DNI, incrementar la asistencia del alúmno con dicho DNI
c) aprobarAutoevaluación: Dado un DNI, Incrementar la cantidad de autoevaluaciones aprobadas del alumno con dicho
DNI
d) puedeRendir: Recibe un alumno y retorna si puede rendir o no.
• Si el curso es a distancia, pueden rendir el examen los alumnos que 
* cumplen con tener 3 autoevaluaciones y al menos una asistencia.
• Si el curso es presencial, pueden rendir el examen los alumnos que 
* tienen al menos 3 asistencias.
e) cantidodDeAlumnosQuePuedenRendir: Retorna la cantidad de alumnos en 
* condiciones de rendir.
3- Realice un programa que instancie un curso presencial y un curso 
* a distancia. Agregue alumnos a cada curso.
en cada curso.
Ineremente la asis
 * @author maximosimonetti
 */
public class Parcial2022Alumnos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Alumno a1=new Alumno(31298969, "Maximo");
        Alumno a2=new Alumno(34171150, "Jimena");
        Alumno a3=new Alumno(34111222, "Manuel");
        CursoADistancia c1=new CursoADistancia("hhttp", 2024, 30);
        
        c1.agregarAlumno(a1);
        c1.agregarAlumno(a2);
        c1.agregarAlumno(a3);
        
        
        for (int i=0;i<10;i++){
            c1.aprobarAutoevalucion(31298969);
            c1.incrementarAsistencias(31298969);
            c1.aprobarAutoevalucion(34171150);
            c1.incrementarAsistencias(34171150);
            c1.aprobarAutoevalucion(34111222);
            c1.incrementarAsistencias(34111222);            
        }
                
        System.out.println("La cantidad de alumnos que pueden rendir son: "+c1.cantidadDeAlumnosQuePuedenRendir());
        
        
        
    }
    
}
