/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package libreria;

/**
 *6) Queremos representar libros electrónicos e impresos. 
 * De cualquier libro se conoce: título, precio base y el 
 * nombre de los autores (a lo sumo 8). Adicionalmente: 
 * los libros electrónicos tienen el formato (ej: “.pdf”, “.epub”) 
 * y su tamaño en MB; mientras que los libros impresos registran 
 * si es tapa dura o no.
a) Implemente las clases del modelo con sus atributos y 
* getters/setters adecuados. Provea constructores para 
* iniciar los libros a partir de toda su información y sin autores.
b) Agregue a las clases implementadas los métodos necesarios para 
* incorporar la siguiente funcionalidad:
i- Agregar al libro un autor cuyo nombre se recibe. 
* Asuma que hay espacio.
¡i- Obtener el precio final del libro teniendo en cuenta que:
- Para los libros electrónicos es el precio base al que se 
* adiciona un impuesto de descarga de 2,5$ por MB.
- Para los libros impresos es el precio base al que se adiciona 
* 500$ si es de tapa dura. 
* ii-Obtener la representación String 
* del libro, la cual se compone de título, precio final y nombre 
* de sus autores.
2) Realice un programa que instancie un libro electrónico y un libro 
* impreso. Cargue 3 autores a cada uno. Para finalizar, muestre la 
* representación String de los libros.
* 
 * @author maximosimonetti
 */
public class Libreria {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        
        LibrosElectronicos l1=new LibrosElectronicos(".pdf", 20, "Cien años de Soledad", 20000);
        LibrosImpresos l2= new LibrosImpresos(true, "Lo que el viento se llevo", 10000);
        
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Julian");
        l1.cargarAutor("Miguel");
        l2.cargarAutor("German");
        
        
        
        System.out.println(l1);
        System.out.println(l2);
    }
    
}
