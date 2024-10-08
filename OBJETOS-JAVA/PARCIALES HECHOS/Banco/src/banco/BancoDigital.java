/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package banco;

/**
 *
 * @author maximosimonetti
 */
public class BancoDigital extends Banco{
    private String direccionWeb;

    public BancoDigital(String direccionWeb, int maximaCantidadCuentas) {
        super(maximaCantidadCuentas);
        this.direccionWeb = direccionWeb;
    }
    
    public boolean agregarCuenta(Cuenta unaCuenta){
        if (getCantidadDeCuentas()<getMaximaCantidadCuentas()&& getCuentas()[getCantidadDeCuentas()]==null){
            getCuentas()[getCantidadDeCuentas()]=unaCuenta;
            setCantidadDeCuentas(getCantidadDeCuentas()+1);
            System.out.println("Se ha agregado una cuenta");
            return true;
        }else{
            System.out.println("No se ha podido agregar");
            return false;
        }
    }
    
    
    
    public  Cuenta obtenerCuenta(int unCbu){
        Cuenta[] cuenta=getCuentas();
        int i=0;
        while (cuenta[i]!=null && i<getCantidadDeCuentas()){
            if (cuenta[i].getCbu()==unCbu){
                return cuenta[i];                
            }
            i++;
        }
        System.out.println("No se encontro la cuenta con un CBU "+ unCbu);
        return null;
    } 
    
    public  void depositarDinero(int unCbu, double monto){
        Cuenta[] cuenta=getCuentas();
        int i=0;
        while (cuenta[i]!=null && i<getCantidadDeCuentas()){
            if (cuenta[i].getCbu()==unCbu){
                cuenta[i].setMonto(cuenta[i].getMonto()+monto);
                System.out.println("El monto ha sido actualizado");
                return;
            }
            i++;
        }
        System.out.println("No se ha encontrado la cuenta de CBU "+unCbu);
    } 
    
    public  boolean puedeRecibirTarjeta(int unCbu){
        Cuenta[] cuenta=getCuentas();
        int i=0;
        boolean puede=false;
        while (cuenta[i]!=null&& i<getCantidadDeCuentas()){
            if (cuenta[i].getCbu()==unCbu){
                if(cuenta[i].getMoneda().equals("pesos") &&cuenta[i].getMonto()>100000){
                    puede=true;
                }
            }
            i++;
        }
        return puede;
    }
    //Si el banco es digital, la cuenta debe ser en pesos y su saldo superior a $100.000.
    
    public String getDireccionWeb() {
        return direccionWeb;
    }

    public void setDireccionWeb(String direccionWeb) {
        this.direccionWeb = direccionWeb;
    }
    
    
}
