/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialalumnos;

/**
 *
 * @author maximosimonetti
 */
public class ParcialAlumnos {

    /**
     * Representar alumnos de una facultad. De cualquier alumno se conoce: DNI, nombre y 
     * sus materias aprobadas (como máximo N). De las materias aprobadas se registra: nombre, 
     * nota y fecha. Además de los alumnos de grado se tiene la carrera, mientras que de los 
     * alumnos de doctorado el título universitario y universidad de origen.
1- Genere las clases necesarias. Provea constructores para iniciar las materias aprobadas y los 
* alumnos a partir de la información necesaria (estos para un máximo de N materias aprobadas y 
* sin materias aprobadas inicialmente).
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dada una materia aprobada, agregarla a las materias aprobadas del alumno.
b) Determinar si el alumno está graduado, teniendo en cuenta que para ello deben tener un total 
* de N materias
aprobadas y deben tener aprobada la materia "Tesis".
c) Obtener un String que represente al alumno siguiendo el ejemplo:
Ej. alumnos de grado "DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: ...; 
* Carrera" Ej. alumnos de doctorado "DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; 
* Está graduado: - Titulo:
Universidad de Origen"
3- Realice un programa que instancie un alumno de cada tipo. Cargue información de materias aprobadas 
* a cada uno. Informe en consola el resultado del inciso c).
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        System.out.println("Se agregaron???");
        
        
        Materia m1=new Materia("Fisiologia Animal", 9, "30/01/2022");
        Materia m2=new Materia("Biotecnologia I", 8, "30/02/2022");
        Materia m3=new Materia("Tesis", 8, "30/02/2022");
        
        Alumno a1=new AlumnoDeGrado("Lic. Cs. Medicas", "33456321", "Julia Asange", 3);
        
        a1.agregarMaterias(m1);
        a1.agregarMaterias(m2);
        a1.agregarMaterias(m3);
        System.out.println("Se agregaron???");
        
        if (a1.estaGraduado(3)){
            System.out.println("Esta graduado");
        }else{
            System.out.println("Lo siento no estas graduado aun.");
        }
        
        System.out.println(a1.toString());
        
            
        
         
    }
    
}
