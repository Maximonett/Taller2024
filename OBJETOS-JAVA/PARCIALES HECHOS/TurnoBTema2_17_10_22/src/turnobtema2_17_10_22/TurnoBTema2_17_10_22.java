/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package turnobtema2_17_10_22;

/**
 *
 * @author maximosimonetti
 */
public class TurnoBTema2_17_10_22 {

    /**
     * Una empresa quiere organizar la venta de lotes de un barrio. Para eso la 
     * empresa tiene la siguiente información: nombre del barrio, y para N manzanas, 
     * M lotes por manzana. Cada lote tiene un precio y un comprador. Cada comprador tiene: 
     * DNI, nombre y apellido, ciudad.
1- Genere las clases necesarias. Provea constructores para crear: el barrio con su nombre, 
* con una cantidad N de manzanas y una cantidad M de lotes por manzana. Los lotes se inicializan 
* con precio=50000 y sin comprador.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a. Agregar un Comprador c, al lote Y de la manzana X. Asuma que el X e Y son valores válidos y que el 
* lote no tiene comprador asignado previamente.
b. Incrementar un porcentaje el precio de los lotes de una manzana. Recibe una manzana X y un porcentaje
P. El método incrementa el precio de los lotes no vendidos (sin comprador) de dicha manzana en un P%.
Retornar el total recaudado en los lotes vendidos.
d.
Obtener un String que represente el barrio siguiendo el ejemplo:
"Barrio: ‹nombre del barrio»
Recaudación actual: monto total recaudado
Manzana # 1 /
- Lote # 1 - precio - Comprador: (DNI - Ape y Nom - ciudad) o si no hay comprador: "Disponible para la venta"
-Lote # 2- precio - Comprador: (DNI - Ape y Nom - ciudad) o si no hay comprador: "Disponible para la venta"
Manzana # 2 /
- Lote # 1 - precio - Comprador: (DNI - Ape y Nom - ciudad) o "Disponible para la venta"
alice un programa que instancie el barrio "Los teros" de 6 manzanas con 9 lotes por manzana. 
* Agregue adores a distintos lotes. Incremente un 20% el precio de los lotes de una de las manzanas. 
* Imprima la entación en String del barrio.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Barrio b1=new Barrio("La Loma", 5, 5);
        
        Comprador c1=new Comprador("32565432", "Juan Baglieto", "La Plata");
        Comprador c2=new Comprador("32565432", "Juan Baglieto", "La Plata");
        Comprador c3=new Comprador("32565432", "Juan Baglieto", "La Plata");
        
        
        b1.agregarCompradorAUnLote(c3, 4, 3);
        b1.agregarCompradorAUnLote(c1, 3, 5);
        b1.agregarCompradorAUnLote(c2, 4, 4);
        
        b1.incrementarPorcentajeDePrecioAUnaManzana(50, 4);
        
        
        b1.agregarCompradorAUnLote(c3, 4, 1);
        b1.agregarCompradorAUnLote(c1, 4, 5);
        b1.agregarCompradorAUnLote(c2, 4, 2);
        
        
        
        System.out.println(b1.toString());
        
        
    }
    
}
