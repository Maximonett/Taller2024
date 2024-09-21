/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_10_10_23_tf_t1;

/**
 *
 * @author maximosimonetti
 */
public class Director extends Empleado {
    private double viaticos;

    public Director(double viaticos, String nombre, String DNI, int anoingreso, double basico) {
        super(nombre, DNI, anoingreso, basico);
        this.viaticos = viaticos;
    }

    public double getViaticos() {
        return viaticos;
    }

    public void setViaticos(double viaticos) {
        this.viaticos = viaticos;
    }
    
    
    public double sueldoAcobrar(){
        
        if (antiguedad()>20){
            return getBasico()+(getBasico()*0.10)
                    + this.viaticos;
        }else{
            return getBasico()+ this.viaticos;
        }
        
    }
    
    public String toString(){
        String aux= super.toString();
                
        return aux;
    }
    
}
