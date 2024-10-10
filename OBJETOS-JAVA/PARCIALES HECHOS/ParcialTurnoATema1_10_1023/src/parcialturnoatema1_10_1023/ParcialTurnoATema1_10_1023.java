/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnoatema1_10_1023;

/**
 *Queremos representar compras realizadas en un comercio. De una compra se conoce: número, 
 * fecha (dia, mes, so) y los productos comprados (a lo sumo N): Asimismo, el comercio permite 
 * hacer compras al por mayor, que poseen además los datos del consumidor final (CUIL y nombre), 
 * Los productos se caracterizan por tener código, descripción, preco
unitario y cantidad de unidades.
1- Genere las clases necesarias. Provea constructores para iniciar los objetos de su modelo a partir de 
* la informacion necesaria. En particular, las compras deben iniciar con un número, una fecha, y sin productos 
* (con capacidad de guardar a lo sumo N productos): y además para las compras al por mayor, con el consumidor 
* final.
2- Implemente los métodos necesarios, en las clases que corresponda, para:
a- Agregar un producto a la compra. Tener en cuenta que en las compras al por mayor el producto se agrega 
* solo si
supera las 6 unidades.
b- Obtener el precio final de la compra. Tener en cuenta que: el precio final es la suma de los precios 
* finales de los productos agregados (el precio final de un producto es precio_unitario* cantidad _unidades). Las compras al por mayor descuentan el 21% (correspondiente al IVA) al precio final de la compra.
c- Obtener un resumen de compra, que concatene: número, fecha (día/mes/año), el código, descripción y precio 
* final de cada producto agregado, y el precio final de la compra.
d- Saber si la compra es abonable en cuotas. Esto es posible cuando su precio final supera los 100.000.
3- Realice un programa que instancie una compra y una compra al por mayor, con los datos necesarios y 
* para un máximo de 10 productos. Cargue algunos productos a cada compra. Al finalizar, muestre el resumen de cada compra e imprima si
son abonables en cuotas.
 * @author maximosimonetti
 */
public class ParcialTurnoATema1_10_1023 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Producto p1=new Producto(123, "Lapicera", 1000, 10000);
        Producto p2=new Producto(123, "Resmas", 1000, 10000);
        
        Compra c1=new Compra(0, "3/10/2009", 2000);
        
        c1.agregarProducto(p1);
        c1.agregarProducto(p2);
        
        CompraXmayor c2=new CompraXmayor("", "Julian", 2357, "21/01/1984", 1000);
        
        c2.agregarProducto(p2);
        c2.agregarProducto(p1);
        
        c1.esAbonableEnCuotas();
        c2.esAbonableEnCuotas();
        
        System.out.println(c1.toString());
        
        System.out.println(c2.toString());
        
    }
    
}
