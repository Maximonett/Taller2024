/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica5eje1;

/**
 *
 * @author maximosimonetti
 */
public class Practica5eje1 {

    /**
     * 1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto tiene:
nombre, código, nombre completo del director y los investigadores que participan en el
proyecto (50 como máximo). De cada investigador se tiene: nombre completo, categoría (1
a 5) y especialidad. Además, cualquier investigador puede pedir hasta un máximo de 5
subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue otorgado o no.
i) ii) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
director .
b. Un investigador sólo debería poder construirse con nombre, categoría y
especialidad.
c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
Un subsidio siempre se crea en estado no-otorgado.
Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
a. void agregarInvestigador(Investigador unInvestigador);
// agregar un investigador al proyecto.
b. void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador .
c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
todos los subsidios otorgados de todos los investigadores)
d. void otorgarTodos(String nombre
_
completo);
//otorgar todos los subsidios no-otorgados del investigador llamado
nombre
_
completo
e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director , el
total de dinero otorgado del proyecto y la siguiente información de cada
investigador: nombre, categoría, especialidad, y el total de dinero de sus
subsidios otorgados.
iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Proyecto p1=new Proyecto("Bordetela Pertusi", 2012, "Juan Carlos Soycientifico");
        
        Investigador i1=new Investigador("Juan Carlos Soycientifico", 5, "Microbiologia");
        Investigador i2=new Investigador("Miguel Laplace", 1, "Microbiologia");
        Investigador i3=new Investigador("Juliana Newton", 3, "Microbiologia");
        
        Subsidio s1=new Subsidio(10000, "Investigacion");
        Subsidio s2=new Subsidio(10000, "Investigacion");
        Subsidio s3=new Subsidio(10000, "Investigacion");
        Subsidio s4=new Subsidio(10000, "Investigacion");
        Subsidio s5=new Subsidio(10000, "Investigacion");
        Subsidio s6=new Subsidio(10000, "Investigacion");
        
        i1.agregarSubsidio(s1);
        i1.agregarSubsidio(s2);
        i2.agregarSubsidio(s3);
        i2.agregarSubsidio(s4);
        i3.agregarSubsidio(s5);
        i3.agregarSubsidio(s6);
        
        i3.getSubsidios()[1].setOtorgado(true);
        i1.getSubsidios()[0].setOtorgado(true);
        
        p1.agregarInvestigador(i1);
        p1.agregarInvestigador(i2);
        p1.agregarInvestigador(i3);
        
        p1.otorgarTodos("Miguel Laplace");
        
        
        System.out.println(p1.toString());
        
    
    }   
    
    
}
