/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_10_10_23_tf_t1;

/**
 *
 * @author maximosimonetti
 */
public class Encargado extends Empleado{
    private int empleadosAcargo;

    public Encargado(int empleadosAcargo, String nombre, String DNI, int anoingreso, double basico) {
        super(nombre, DNI, anoingreso, basico);
        this.empleadosAcargo = empleadosAcargo;
    }

    public int getEmpleadosAcargo() {
        return empleadosAcargo;
    }

    public void setEmpleadosAcargo(int empleadosAcargo) {
        this.empleadosAcargo = empleadosAcargo;
    }
        
    
    public double sueldoAcobrar(){
        if (antiguedad()>20){
            return getBasico()+(getBasico()*0.10)+ this.empleadosAcargo*(1000);    
        }else{
            return getBasico()+ this.empleadosAcargo*(1000);    
        }        
    }
    
    public String toString(){
        String aux= super.toString();
        
        return aux;
    }
}
