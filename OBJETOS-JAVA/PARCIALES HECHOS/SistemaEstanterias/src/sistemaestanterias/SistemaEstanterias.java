/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package sistemaestanterias;

/**
 *9) Queremos representar estanterías de libros. Una estantería 
 * mantiene sus libros organizados en N estantes cada uno con 
 * lugar para M libros. Un libro posee título, nombre de su primer 
 * autor y peso.
a) Implemente las clases de su modelo, con sus atributos y 
* getters/setters adecuados. Provea constructores para iniciar: 
* los libros a partir de toda su información; la estantería para 
* N estantes y lugar para M libros por estante (inicialmente no 
* debe tener libros cargados).
b) Implemente los siguientes métodos:
- almacenarLibro: recibe un libro y un nro. de estante 
* válido, y lo almacena en el primer
lugar libre de dicho estante. Asuma que hay espacio para 
* almacenar el libro.
- sacarLibro: saca y devuelve el libro que se encuentra en el 
* estante X, lugar Y (X e Y se reciben y son válidos). Dicho lugar 
* debe quedar disponible.
- Calcular: calcula y devuelve el número del estante más pesado 
* (teniendo en cuenta el peso de sus libros).
 * @author maximosimonetti
 */
public class SistemaEstanterias {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    Libro l1 = new Libro("El Caudillo", "Juan", 20.0);
    Libro l2 = new Libro("Cien años de soledad", "Gabriel", 30.0);
    Libro l3 = new Libro("Don Quijote", "Cervantes", 25.0);

    Estanteria E1 = new Estanteria(3, 10);

    E1.almacenarLibro(l1, 0);
    E1.almacenarLibro(l2, 1);
    E1.almacenarLibro(l3, 2);

    System.out.println("El estante más pesado es: " + E1.calcularEstanteMasPesado());

    E1.sacarLibro(2, 0); // Sacar el libro de la posición 0 del estante 2
}

}
