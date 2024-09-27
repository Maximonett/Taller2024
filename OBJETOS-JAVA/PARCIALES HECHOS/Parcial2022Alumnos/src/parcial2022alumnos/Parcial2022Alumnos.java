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
ONI
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
    }
    
}
