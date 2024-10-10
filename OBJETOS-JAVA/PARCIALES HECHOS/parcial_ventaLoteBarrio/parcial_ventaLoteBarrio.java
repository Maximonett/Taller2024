package parcial_ventaLoteBarrio;
import PaqueteLectura.GeneradorAleatorio;

public class parcial_ventaLoteBarrio {
    /*
    Una empresa quiere organizar la venta de lotes de un barrio. Para eso la empresa tiene la siguiente información:
    nombre del barrio, y para N manzanas, M lotes por manzana. Cada lote tiene un precio y un comprador. Cada
    comprador tiene: DNI, nombre y apellido, ciudad.
    1- Genere las clases necesarias. Provea constructores para crear: el barrio con su nombre, con una cantidad N de
       manzanas y una cantidad M de lotes por manzana. Los lotes se inicializan con precio=50000 y sin comprador.
    2- Implemente los métodos necesarios, en las clases que corresponda, para:
       a. Agregar un Comprador c, al lote Y de la manzana X. Asuma que el X e Y son valores válidos y que el lote no
          tiene comprador asignado previamente.
       b. Incrementar un porcentaje el precio de los lotes de una manzana. Recibe una manzana X y un porcentaje
          P. El método incrementa el precio de los lotes no vendidos (sin comprador) de dicha manzana en un P%.
       c. Retornar el total recaudado en los lotes vendidos.
       d. Obtener un String que represente el barrio siguiendo el ejemplo:
            "Barrio: <nombre del barrio>

        Recaudación actual: monto total recaudado

        Manzana # 1 |
        - Lote # 1 - precio - Comprador: {DNI - Ape y Nom - ciudad) o si no hay comprador: "Disponible para la venta"
        - Lote # 2 -precio - Comprador: (DNI - Ape y Nom - ciudad} o si no hay comprador: "Disponible para la venta"
        ...
        Manzana # 2 |
        - Lote # 1 - precio - Comprador: {DNI - Ape y Nom - ciudad) o si no hay comprador: "Disponible para la venta"
    
    3- Realice un programa que instancie el barrio "Los teros" de 6 manzanas con 9 lotes por manzana. Agregue
       compradores a distintos lotes. Incremente un 20% el precio de los lotes de una de las manzanas. Imprima la
       presentación en String del barrio.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Empresa emp = new Empresa ("Los teros",6,9);
        
        Comprador com1,com2;
        com1 = new Comprador(39777111,"Martin Rodriguez","La Plata");
        com2 = new Comprador(30888222,"Juana Polivic","Florencio Varela");
        
        for (int i=0; i<5; i++){
            emp.agregarComprador(com1, GeneradorAleatorio.generarInt(6)+1,GeneradorAleatorio.generarInt(9)+1);
            emp.agregarComprador(com2, GeneradorAleatorio.generarInt(6)+1,GeneradorAleatorio.generarInt(9)+1);
        }
        emp.incrementarPorcentajePrecioLote(2, 20);
        System.out.println(emp.toString());
    }
    
}
