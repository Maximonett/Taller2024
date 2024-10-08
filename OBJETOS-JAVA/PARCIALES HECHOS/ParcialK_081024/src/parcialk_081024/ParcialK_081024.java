/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialk_081024;

/**
 *
 * @author maximosimonetti
 */
public class ParcialK_081024 {

    /**
     * Se desea representar una empresa de informática y sus programadores. La empresa tiene: nombre, un programador líder y a 
     * lo sumo N programadores. De los programadores se conoce: nombre, DNI, sueldo básico, cantidad de líneas de código 
     * por hora y lenguaje de preferencia. Adicionalmente, del programador líder se conoce: antigüedad en años y
cantidad de proyectos dirigidos.
1- Genere las clases necesarias. Provea constructores para iniciar: el programador líder y programadores a partir de toda su información; 
* la empresa a partir de un nombre, un programador líder, con capacidad para un máximo de N
programadores (inicialmente sin programadores).
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dado un programador, agregarlo a la empresa.
b) Calcular el monto total en sueldos a abonar por la empresa, sabiendo que es la suma de los sueldos finales de todos 
* los programadores de la empresa (incluido el líder). Para cualquier programador, el sueldo final es el sueldo básico 
* adicionando 50.000$ si supera las 200 líneas de código por hora. Además de eso, para el programador líder, 
* se adiciona $10.000 por año de antigüedad y $20.000 por proyecto dirigido.
c) Dado un monto M, aumentar el sueldo básico de todos los programadores en M (incluido el líder).
d) Retornar la representación String de la empresa, siguiendo el ejemplo:
"Empresa: nombre.
Programador líder: (nombre, DNI, lenguaje de preferencia, sueldo final)
Programador 1:
(nombre, DNI, lenguaje de preferencia, sueldo final)
Programador 2:
{nombre, DNI, lenguaje de preferencia, sueldo fina!).
Monto total en sueldos a abonar por la empresa:...
"
3- Realice un programa que instancie una empresa informática con un líder. Agregue algunos programadores a la empresa. Aumente los sueldos básicos de todos los programadores de la empresa en un monto. Muestre la
representación String de la empresa.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Programador p1=new Programador("Max", "31298976", 1000000, 100, "Python");
        Programador p2=new Programador("Juan", "33298976", 1000000, 150, "Java");
        
        ProgramadorLider p3=new ProgramadorLider(15, 3, "Steve", "32145654", 2000000, 250, "C#");
        
        Empresa e1=new Empresa("Cyber", p3, 12);
        
        e1.agregarProgramador(p2);
        e1.agregarProgramador(p1);
        
        e1.incrementarBasico(12);
        System.out.println("El Monto total en sueldos de la Empresa es de: $"+e1.montoEnSueldosAbonar());
        System.out.println(e1.toString());
        
        
        
    }
    
}
