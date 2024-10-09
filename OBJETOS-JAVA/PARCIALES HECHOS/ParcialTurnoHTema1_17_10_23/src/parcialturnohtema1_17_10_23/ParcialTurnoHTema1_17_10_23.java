/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnohtema1_17_10_23;

/**
 *Se desca representar un sistema que registre conciertos para un estadio. Del estadio se conoce nombre, 
 * dirección, capacidad y una estructura que representa la agenda de conciertos que almacenará los 
 * conciertos de cada mes y dia particular (1.12, 1.31). De cada concierto se guarda el nombre del artista, 
 * precio de la entrada, cantidad de entradas vendidas.
1- Genere las clases necesarias. Provea constructores para iniciar: los conciertos y el estadio a 
* partir de la información necesaria; Inicialmente el estadio no tiene conciertos agendados.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Registrar un concierto C en la agenda. El método recibe un mes M y debe registrar el concierto 
* en el siguiente día disponible del mes M.
b) Listar los conciertos del mes M devolviendo un String con la representación de los mismos en el
siguiente formato:
"Nombre del artista, precio de la entrada, cantidad de entradas vendidas"
c) Calcular la ganancia del estadio en el mes M. La ganancia de un mes es la mitad de la recaudación 
* de las entradas vendidas en cada concierto de dicho mes..
d) Obtener un String que represente el estadio siguiendo el ejemplo:
"Estadio: nombre, dirección; capacidad
Mes 1:
Día 1: Nombre del artista, precio de la entrada, cantidad de entradas vendidas
Dia 2; Nombre del artista, precio de la entrada, cantidad de entradas vendidas
Mes M::
3- Realice un programa que instancie un estadio. Registre conciertos y compruebe el correcto
funcionamiento de los métodos implementados.
 * @author maximosimonetti
 */
public class ParcialTurnoHTema1_17_10_23 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Estadio e1=new Estadio("Red Bull", "5 y 54", 100);
        
        Concierto c1=new Concierto("Paco", 150000);
        
        e1.registrarUnConcierto(2, c1);
        
        c1.setCantidadDeEntradasVendidas(95);
        
        
        
        System.out.println(e1.listarLosConciertosDelMes(2));
        System.out.println(e1.toString());
        
        
        System.out.println("Las ganancias en el mes 2 fueron $ "+e1.calcularLaGananciaDelEstadioEnElMes(2));
    }
    
}
