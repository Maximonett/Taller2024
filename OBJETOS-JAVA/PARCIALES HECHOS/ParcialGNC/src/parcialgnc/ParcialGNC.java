/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialgnc;

/**
 *Una estación de GNC quiere administrar la información correspondiente a la carga de gas. 
 * La estación posee una dirección, precio por m3 y la información de sus 6 surtidores, De cada 
 * surtidor se conoce si se encuentra fuera de servicio y la información de las ventas (como máximo V). 
 * De cada venta se registra: DNI del cliente, cantidad de m3
cargados, monto abonado y el medio de pago utilizado (débito, crédito o efectivo).
1- Genere las clases necesarias. Provea constructores para crear: la estación para 6 surtidores, 
* a partir de una dirección, un precio por m3 y un máximo V de ventas por surtidor; cada surtidor 
* en servicio y con capacidad para V ventas
(inicialmente sin ventas); y cada venta a partir de la información necesaria.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dado un número N de surtidor, el DNI de un cliente, una cantidad de m3 y una forma de pago, generar 
* la venta correspondiente y agregarla en dicho surtidor de la estación. Asumir que el número N de surtidor es válido.
b)
Dado un valor X, marcar como fuera de servicio aquellos surtidores que hayan vendido menos de X m3 en total
(entre todas sus ventas).
c) Obtener la venta realizada con mayor monto abonado de toda la estación.
d)
Obtener un String que represente la estación siguiendo el ejemplo:
"Estación de Servicio: Dirección; precio por m3.
Surtidor 1; Si está fuera de servicio o no; Ventas: [DNI del cliente, cantidad de m3, monto abonado; ...)
Surtidor 2; Si está fuera de servicio o no; Ventas: [DNI del cliente, cantidad de m3, monto abonado; -.]
3- Realice un programa que instancie una estación. Realice ventas. Compruebe el correcto funcionamiento de los
métodos implementados.
 * @author maximosimonetti
 */
public class ParcialGNC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
     
        
        Estacion e1=new Estacion("diag 74 y 18", 1100);
        
        Surtidor s1=new Surtidor(100);
        Surtidor s2=new Surtidor(100);
        Surtidor s3=new Surtidor(100);
        Surtidor s4=new Surtidor(100);
        Surtidor s5=new Surtidor(100);
        Surtidor s6=new Surtidor(100);
        
        e1.generarUnaVenta(0, "43123432", 100, "Efectivo");
        e1.generarUnaVenta(0, "43123432", 150, "Efectivo");
        e1.generarUnaVenta(0, "43123432", 200, "Efectivo");
        
        System.out.println("La venta con mayor monto es "+e1.obtenerLaVentaConMayorMonto().toString());
        
        System.out.println(e1.toString());
        
        
    }
    
}
