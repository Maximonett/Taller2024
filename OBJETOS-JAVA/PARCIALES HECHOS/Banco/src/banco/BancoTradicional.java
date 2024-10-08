/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package banco;

/**
 *
 * @author maximosimonetti
 */
public class BancoTradicional extends Banco{
    private String direccion;
    private String localidad;
    private int cantidadCuentasDolares;


    public BancoTradicional(String direccion, String localidad, int cantidadCuentasDolares, int maximaCantidadCuentas) {
        super(maximaCantidadCuentas);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cantidadCuentasDolares = 0;
        
    }
    
    public  boolean agregarCuenta(Cuenta unaCuenta){ //maximo 100 cuentas en dolares        
        if (getCantidadDeCuentas()<getMaximaCantidadCuentas()
                && cantidadCuentasDolares<100
                && getCuentas()[getCantidadDeCuentas()]==null){
            getCuentas()[getCantidadDeCuentas()]=unaCuenta;
            setCantidadDeCuentas(getCantidadDeCuentas()+1);
            
            if (unaCuenta.getMoneda().equals("dolares")){
                cantidadCuentasDolares++;
            }
            return true;
        }else{
            System.out.println("El banco no acepta mas cuentas");
            return false;
        }
    
    }
    
    public Cuenta obtenerCuenta(int unCbu){                
        for (int i=0; i<getCantidadDeCuentas();i++){
            if(getCuentas()[i]!=null && getCuentas()[i].getCbu()==unCbu){
                return getCuentas()[i];                
            }          
        }
        System.out.println("No se encontro el CBU que buscas");
        return null;
    }
    
    /*public void depositarDinero(int unCbu, double monto){
        for (int i=0;i<getCantidadDeCuentas();i++){
            if (getCuentas()[i]!=null && getCuentas()[i].getCbu()==unCbu){
                getCuentas()[i].setMonto(getCuentas()[i].getMonto()+monto);
                System.out.println("El monto ha sido actualizado");
                break;
            }        
        }
        System.out.println("No se encontro la cuenta con el CBU porporcionado");
    }*/
    
    public void depositarDinero(int unCbu, double monto){
        Cuenta[] cuenta=getCuentas();
        int i=0;
        
        while (i<getCantidadDeCuentas()){
            if (cuenta[i]!= null && cuenta[i].getCbu()==unCbu){
                cuenta[i].setMonto(cuenta[i].getMonto()+monto);
                System.out.println("El monto ha sido actualizado");
                return;
            }
            i++;
        }
        System.out.println("No se encontro la cuenta con el CBU proporcionado");                        
    }
    
    public boolean puedeRecibirTarjeta(int unCbu){
        Cuenta[] cuenta=getCuentas();
        int i=0;
        boolean puede=false;
        while (i<getCantidadDeCuentas()){
            if(cuenta[i]!=null && cuenta[i].getCbu()==unCbu){
                if(cuenta[i].getMoneda().equals("dolares")){
                    if (cuenta[i].getMonto()>500){
                        System.out.println("Puede recibir tarjeta");
                        puede=true;                        
                    }
                }else{
                    if(cuenta[i].getMoneda().equals("pesos")){
                        if(cuenta[i].getMonto()>70000){
                           System.out.println("Puede recibir tarjeta"); 
                           puede=true;                           
                        }
                    }
                }                                    
            }
            i++;
        }
        return puede;
    }
    
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public int getCantidadCuentasDolares() {
        return cantidadCuentasDolares;
    }

    public void setCantidadCuentasDolares(int cantidadCuentasDolares) {
        this.cantidadCuentasDolares = cantidadCuentasDolares;
    }
    
    
}
