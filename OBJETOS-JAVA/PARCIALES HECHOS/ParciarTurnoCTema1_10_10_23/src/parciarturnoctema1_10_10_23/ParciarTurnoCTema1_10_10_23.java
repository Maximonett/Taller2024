/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parciarturnoctema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class ParciarTurnoCTema1_10_10_23 {

    /**
     * Una estación de servicio quiere administrar la información correspondiente a la carga de combustible. 
     * La estación posee una dirección y la información de los surtidores (a lo sumo 6). De cada surtidor se 
     * conoce el combustible que dispensa, el precio por litro y la información de las ventas (como máximo V). 
     * De cada venta se registra: DNI del cliente, cantidad de litros cargados, monto abonado 
     * y el medio de pago utilizado (débito, crédito o efectivo).
1- Genere las clases necesarias. Provea constructores para crear: la estación con la dirección y con capacidad 
* para 6 surtidores (inicialmente sin surtidores); cada surtidor con el combustible que dispensa (String), 
* precio por litro y con capacidad para V ventas (inicialmente sin ventas); y cada venta a partir de la información necesaria.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dado un surtidor, agregarlo a los surtidores de la estacion.
• b) Dado un número N de surtidor, el DNI de un cliente, una cantidad de litros y una forma de pago, 
* generar la venta correspondiente y agregarla en dicho surtidor de la estación. Asumir que el número 
* N de surtidor es válido.
Obtener el número del surtidor que recaudó el mayor monto total en efectivo (entre todas sus ventas).
d) Obtener un String que represente la estación siguiendo el ejemplo:
"Estación de Servicio: Dirección; Cantidad de surtidores.
Surtidor 1; Combustible dispensado, precio por litro; Ventas: [DNI del cliente, cantidad de litros cargados, monto abonado; ...]
Surtidor 2; Combustible dispensado, precio por litro; Ventas: (DNI del cliente, cantidad de litros cargados, monto abonado; ...)
..."
- Realice un programa que instancie una estación. Agregue surtidores. Realice ventas. 
* Compruebe el correcto incionamiento de los métodos implementados.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Estacion e1=new Estacion("diag 74 y 18");
        
        Surtidor s1=new Surtidor("Nafta", 1000);
        Surtidor s2=new Surtidor("Diesel", 890);
        
        e1.agregarSurtido(s1);
        e1.agregarSurtido(s2);
        
        Venta v1=new Venta("2345566", 20, "efectivo");
        Venta v2=new Venta("2345566", 20, "efectivo");
        v1.setMontoAbonado(15000);
        v2.setMontoAbonado(30000);
        
        s1.agregarVenta(v1);
        s1.agregarVenta(v2);
        s2.agregarVenta(v2);
        s2.agregarVenta(v1);
        s2.agregarVenta(v1);
        s2.agregarVenta(v2);
        s2.agregarVenta(v2);
        s2.agregarVenta(v2);
        s2.agregarVenta(v2);
        
        System.out.println(e1.toString());
        
        int posicion=e1.numeroDeSurtidorMayorMontoTotalEfectivo();
        
        System.out.println("Numero de surtidor con mayor pago en efectivo: "+(posicion+1));
        
    }
    
}
