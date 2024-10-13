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
