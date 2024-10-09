/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnoe08_10_24;

/**
 *
 * @author maximosimonetti
 */
public class ParcialTurnoE08_10_24 {

    /**
     * Un supermercado quiere administrar la información correspondiente a los tickets de compra emitidos. 
     * El supermercado posee una dirección, el número de venta actual y la información de las cajas (a lo sumo 5). 
     * De cada caja se conoce el nombre del cajero y la información de los tickets que emitió (como máximo T). 
     * De cada ticket de compra se registra: número de ticket, CUIT del cliente, cantidad de productos comprados, 
     * monto abonado y el medio de pago utilizado (débito, crédito o efectivo).
STOIN
1- Genere las clases necesarias. Provea constructores para crear: el supermercado con la dirección, 
* con capacidad para un máximo de 5 cajas (inicialmente sin cajas) y con número de venta actual en 0; 
* cada caja con el nombre del cajero y con capacidad para un máximo de T tickets (inicialmente sin tickets); 
* cada ticket a partir de la información necesaria.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
Dada una caja, agregarla a las cajas del supermercado.
Dado un número N de caja, el CUIT de un cliente, una cantidad de productos comprada, un monto abonado 
* y una forma de pago, generar el ticket de compra (el número de ticket se corresponde con el número de 
* venta actual del supermercado) y agregarlo en dicha caja del supermercado. Asumir que el número N de caja es válido.
Obtener el número de caja que emitió la menor cantidad de tickets con forma de pago crédito.
d) Obtener un String que represente el supermercado siguiendo el ejemplo:
"Supermercado: Dirección; Cantidad de cajas.
Caja 1: Nombre del cajero; Tickets emitidos: [Nro, CUIT del cliente, cantidad de productos, monto abonado, medio pago; ..]
Caja 2: Nombre del cajero; Tickets emitidos: [Nro, CUIT del cliente, cantidad de productos, monto abonado, medio pago; ...]
3- Realice un programa que instancie un supermercado. Agregue cajas. Genere tickets de compra sobre distintas cajas.
Compruebe el correcto funcionamiento de los métodos implementados.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Supermercado s1=new Supermercado("calle 48 e/ 20 y 21");
        
        Caja c1=new Caja("Abdul", 100);
        Caja c2=new Caja("Apu", 100);
        
        
        s1.agregarUnaCaja(c1);
        s1.agregarUnaCaja(c2);
        
        s1.generarUnTicket(0, "2034567876", 3, 10000   , "efectivo");
        s1.generarUnTicket(0, "2034567873", 5, 500000   , "efectivo");
        
        s1.generarUnTicket(1, "203698521", 4, 120000, "debito");
        
        System.out.println("La caja con menor cantida de Tickets fue la Nº "+s1.cajaConMenorCantidadDeTickets());
        
        System.out.println(s1.toString());
        
        
        
        
    }
    
}
