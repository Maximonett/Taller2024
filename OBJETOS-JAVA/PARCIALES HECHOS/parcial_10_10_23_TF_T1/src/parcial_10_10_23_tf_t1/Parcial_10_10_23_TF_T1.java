/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial_10_10_23_tf_t1;

/**
 *
 * @author maximosimonetti
 */
public class Parcial_10_10_23_TF_T1{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Director d1=new Director(30000, "Maximo", "31298969", 2001, 500000);
        Encargado e1 =new Encargado(3, "Miguel", "35897645", 2009, 300000);
        
        Encargado e2 =new Encargado(3, "Miguel", "35897645", 2009, 300000);
        Encargado e3 =new Encargado(3, "Miguel", "35897645", 2009, 300000);
        
        Empresa E1=new Empresa("La Calañas", "Calle Falsa Nº 1234",d1, 5);
        E1.setN(10);
        
        
        // Inicializamos el array de sucursales con tamaño N
        Encargado[] sucursales = new Encargado[E1.getN()];
        E1.setSucursales(sucursales); // Asignamos el array a la empresa 
       
                
                
        E1.cargarEncargado(0, e1);
        E1.cargarEncargado(1, e2);
        E1.cargarEncargado(8, e3);
        
        System.out.println(E1.toString());
    }
    
}
