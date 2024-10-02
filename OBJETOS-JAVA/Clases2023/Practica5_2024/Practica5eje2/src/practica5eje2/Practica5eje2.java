/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica5eje2;

/**
 *2- Queremos un sistema para gestionar estacionamientos. Un estacionamiento conoce su
nombre, dirección, hora de apertura, hora de cierre, y almacena para cada número de piso
(1..N) y número de plaza (1..M), el auto que ocupa dicho lugar . De los autos se conoce
nombre del dueño y patente.
a) Genere las clases, incluyendo getters y setters adecuados.
b) Implemente constructores. En particular , para el estacionamiento:
- Un constructor debe recibir nombre y dirección, e iniciar el estacionamiento
con hora de apertura “8:00”
, hora de cierre “21:00”
, y para 5 pisos y 10 plazas
por piso. El estacionamiento inicialmente no tiene autos.
- Otro constructor debe recibir nombre, dirección, hora de apertura, hora de
cierre, el número de pisos (N) y el número de plazas por piso (M) e iniciar el
estacionamiento con los datos recibidos y sin autos.
c) Implemente métodos para:
- Dado un auto A, un número de piso X y un número de plaza Y , registrar al auto
en el estacionamiento en el lugar X,Y . Suponga que X, Y son válidos (es decir ,
están en rango 1..N y 1..M respectivamente) y que el lugar está desocupado.
- Dada una patente, obtener un String que contenga el número de piso y plaza
donde está dicho auto en el estacionamiento. En caso de no encontrarse,
retornar el mensaje “ Auto Inexistente”
.
- Obtener un String con la representación del estacionamiento. Ejemplo:
Plaza 1: libre Piso 1 Plaza 2: representación del auto …
“Piso 1
Piso 2 Plaza 1: libre … etc”
- Dado un número de plaza Y , obtener la cantidad de autos ubicados en dicha
plaza (teniendo en cuenta todos los pisos).
d) Realice un programa que instancie un estacionamiento con 3 pisos y 3 plazas por piso.
Registre 6 autos en el estacionamiento en distintos lugares.
Muestre la representación String del estacionamiento en consola.
Muestre la cantidad de autos ubicados en la plaza 1.
Lea una patente por teclado e informe si dicho auto se encuentra en el estacionamiento
o no. En caso de encontrarse, la información a imprimir es el piso y plaza que ocupa.
 * @author maximosimonetti
 */
public class Practica5eje2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Estacionamiento E1=new Estacionamiento("Estacionamiento 48", "48 e 20 y 21");
        
        Auto a1=new Auto("Guillermo", "AD 087 TU");
        Auto a2=new Auto("Guillermo", "AD 087 T9");
        Auto a3=new Auto("Guillermo", "AD 087 TT");
        Auto a4=new Auto("Guillermo", "AD 087 TA");
        Auto a5=new Auto("Guillermo", "AD 087 TD");
        
        E1.registrarAuto(a4, 1, 6);
        E1.registrarAuto(a2, 2, 4);
        E1.registrarAuto(a1, 0, 5);
        E1.registrarAuto(a3, 1, 2);
        E1.registrarAuto(a5, 2, 5);
        
        System.out.println(E1.toString());
        
        E1.dondeEstaElAuto("AD 087 TA");
        
        int plaza=4;
        
        System.out.println("La suma de autos en todos los pisos estacionados en la plaza numero "
                + (plaza+1) +" es de  "+E1.cantidadAutosPorPiso(plaza+1)+" autos.");
    
    }
}