/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialrecu2024;

/**
 *
 * @author maximosimonetti
 */
import java.util.Random;

public class ObrasConReserva extends Obra{
    private Butaca[] butacas;
    private int cantVendidas;

    public ObrasConReserva(String nombre, String nombreDirector, int cantActores, int maxEspectadores) {
        super(nombre, nombreDirector, cantActores, maxEspectadores);
        this.cantVendidas=0;
        this.butacas= new Butaca[this.getMaxEspectadores()];
        inicializarButacas();
    }
    
    
    public void inicializarButacas(){
        Random random = new Random();
        for (int i=0;i<this.getMaxEspectadores();i++){
            butacas[i]=new Butaca(); 
            butacas[i].setPrecio(20.0+(random.nextDouble()*(50.0-20.0)));
            butacas[i].setOcupada(false);
        }
    }
    
    // Método para ocupar una butaca
    public boolean ocuparUnaButaca(int nroDeButaca) {
        // Validar que el número de butaca sea válido
        if (nroDeButaca < 0 || nroDeButaca >= butacas.length) {
            System.out.println("Número de butaca inválido.");
            return false;
        }

        // Verificar si la butaca ya está ocupada
        if (butacas[nroDeButaca].isOcupada()) {
            System.out.println("La butaca ya está ocupada.");
            return false;
        }

        // Ocupar la butaca
        butacas[nroDeButaca].setOcupada(true);
        System.out.println("La butaca " + nroDeButaca + " ha sido ocupada.");
        cantVendidas++;          
        return true;
    }
    
    public void vaciarObra(){
        for (int i=0;i<this.getMaxEspectadores();i++){
            butacas[i].setOcupada(false);          
        }
        cantVendidas=0;//Reinicio el contador
        System.out.println("Se a vaciado toda la Obra");
    }
    
   public double totalRecaudado(){
       double total=0;
       for (int i=0;i<this.getMaxEspectadores();i++){
           if (butacas[i].isOcupada()) {
                total += butacas[i].getPrecio();
           }
       }
       return total;
   }
}
