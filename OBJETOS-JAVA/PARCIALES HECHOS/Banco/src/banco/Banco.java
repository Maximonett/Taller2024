/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package banco;

/**
 *
 * @author maximosimonetti
 */
public abstract class Banco {
    private String nombre;
    private int cantidadEmpleados;
    private Cuenta[] cuentas;
    private int maximaCantidadCuentas;
    private int cantidadDeCuentas=0;

    public Banco(int maximaCantidadCuentas) {      
        this.maximaCantidadCuentas = maximaCantidadCuentas;
        this.cuentas=new Cuenta[maximaCantidadCuentas];        
        inicializarBanco();
    }
    
    public void inicializarBanco(){
        for (int i=0;i<maximaCantidadCuentas;i++){
            cuentas[i]=null;     
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadEmpleados() {
        return cantidadEmpleados;
    }

    public void setCantidadEmpleados(int cantidadEmpleados) {
        this.cantidadEmpleados = cantidadEmpleados;
    }

    public Cuenta[] getCuentas() {
        return this.cuentas;
    }

    public void setCuentas(Cuenta[] cuentas) {
        this.cuentas = cuentas;
    }

    public int getMaximaCantidadCuentas() {
        return maximaCantidadCuentas;
    }

    public void setMaximaCantidadCuentas(int maximaCantidadCuentas) {
        this.maximaCantidadCuentas = maximaCantidadCuentas;
    }

    public int getCantidadDeCuentas() {
        return cantidadDeCuentas;
    }

    public void setCantidadDeCuentas(int cantidadDeCuentas) {
        this.cantidadDeCuentas = cantidadDeCuentas;
    }
    
    public abstract boolean agregarCuenta(Cuenta unaCuenta); //maximo 100 cuentas en dolares
    
    public abstract Cuenta obtenerCuenta(int unCbu); 
    
    public abstract void depositarDinero(int unCbu, double monto); 
    
    public abstract boolean puedeRecibirTarjeta(int unCbu);
    //Si el banco es digital, la cuenta debe ser en pesos y su saldo superior a $100.000.
    //Si el banco es tradicional, la cuenta debe ser en dólares o pesos. Si es en dólares, con saldo
    //superior a USS 500. Si es en pesos con saldo superior a $70.000.
           
}
