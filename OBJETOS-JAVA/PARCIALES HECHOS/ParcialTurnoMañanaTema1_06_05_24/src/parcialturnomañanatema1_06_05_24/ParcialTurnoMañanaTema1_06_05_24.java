/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnomañanatema1_06_05_24;

/**
 *
 * @author maximosimonetti
 */
public class ParcialTurnoMañanaTema1_06_05_24 {

    /**
     * Representar un curso dictado por una escuela de inglés. El curso tiene: una descripción, 
     * un turno online y un turno presencial De cada turno se conoce: nombre y sueldo del docente, 
     * el costo de la cuota, y los alumnos inscriptos
(como máximo NYDe los alumnos se registra: DNI, nombre y lugar de residencia.]
1- Genere las clases necesarias. Provea constructores para iniciar los objetos a partir de la 
* 
a) Dado un alumno, agregarlo al curso. El alumno deberá agregarse al turno presencial si reside 
* en "La Plata", caso
contrario deberá agregarse al turno online. Asuma que hay espacio.
b) Obtener la ganancia mensual neta del curso, teniendo en cuenta que suma la recaudación de ambos turnos.
La recaudación de un turno es el costo de la cuota de los alumnos inscriptos y a eso se resta el sueldo 
* del docente.
c) Obtener un String que represente el curso, siguiendo el ejemplo:
"Descripción, Ganancia Mensual Neta del curso,
Turno Online:
{Nombre del Docente; Alumno 1: {DNI, Nombre, Lugar) Alumno 2: (DNI, Nombre, Lugar) ... Y
Turno Presencial: { Nombre del Docente; Alumno 1: {DNI, Nombre, Lugar) Alumno 2: (DNI, Nombre, Lugar) ... Y"
d) Determinar si el curso es rentable. Un curso es rentable si la ganancia mensual neta del 
* curso supera los $800000.
3- Realice un programa que instancie un curso. Agregue algunos alumnos al curso. Imprima la 
* representación String
del curso y si es rentable o no.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        Turno tP=new Turno(20);
        Turno tO=new Turno(100);
        
        Alumno a1=new Alumno("56198765", "julian", "La Plata");
        Alumno a2=new Alumno("34098760", "Sofia", "Mar del Tuyu");
        Alumno a3= new Alumno("34876567", "jimena", "Dorrego");
        Alumno a4= new Alumno("31298987", "Maximo", "Dero");
        Alumno a5= new Alumno("31290987", "Maria", "La Plata");
       
        
        Curso c1=new Curso("Curso de Ingles para todas las Edades.", tO, tP);
        
        c1.agregarAlumnoAlCurso(a4);
        c1.agregarAlumnoAlCurso(a1);
        c1.agregarAlumnoAlCurso(a2);
        c1.agregarAlumnoAlCurso(a3);
        c1.agregarAlumnoAlCurso(a5);
        
        System.out.println(c1.toString());
        
        
        
    }
    
}
