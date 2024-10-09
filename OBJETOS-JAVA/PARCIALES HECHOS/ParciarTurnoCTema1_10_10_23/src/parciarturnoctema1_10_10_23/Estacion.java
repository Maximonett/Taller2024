/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parciarturnoctema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Estacion {
    private String direccion;
    private int maxSurtidores;
    private int cantidadSurtidores=0;
    Surtidor[] surtidores;

    public Estacion(String direccion) {
        this.direccion = direccion;
        this.maxSurtidores=6;
        this.surtidores=new Surtidor[maxSurtidores];
        inicializarSurtidores();
        
    }
    
    public void agregarSurtido(Surtidor unSurtidor){
        if(surtidores[cantidadSurtidores]==null && cantidadSurtidores<maxSurtidores){
            surtidores[cantidadSurtidores]=unSurtidor;
            cantidadSurtidores++;
        
        }else{
            System.out.println("No hay mas lugar para surtidores en la estacion.");
        }        
    }
    
    public Venta generarVenta(int numeroSurtidor,String dniCliente,int cantidadLitros,String medioPago){
        Venta unaVenta=new Venta(dniCliente, cantidadLitros, medioPago);
        if (surtidores[numeroSurtidor]!=null){
            surtidores[numeroSurtidor].agregarVenta(unaVenta);
        }
        return unaVenta;
    }
    
    public int numeroDeSurtidorMayorMontoTotalEfectivo(){
        double maxMontoEfectivo=-1;
        int maxSurtidor=-1;
        double montoTotal;
        for (int i=0;i<cantidadSurtidores;i++){
            montoTotal=0;//Impportante inicializar antes de cadad ciclo de surtidores
            Venta[] ventas=surtidores[i].getVentas();
            for (int j=0;j<surtidores[i].getCantidadDeVentas();j++){
                if (ventas[j]!=null && ventas[j].getMedioDePago().equals("efectivo")){
                    montoTotal+=ventas[j].getMontoAbonado();
                    
                }
                if (montoTotal>maxMontoEfectivo){
                    maxMontoEfectivo=montoTotal;
                    maxSurtidor=i;
                }
            }                                
        }
        return maxSurtidor;
    }
    
    
    
    
    
    public void inicializarSurtidores(){
        for (int i=0;i<maxSurtidores;i++){
            surtidores[i]=null;
        }
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getMaxSurtidores() {
        return maxSurtidores;
    }

    public void setMaxSurtidores(int maxSurtidores) {
        this.maxSurtidores = maxSurtidores;
    }

    public int getCantidadSurtidores() {
        return cantidadSurtidores;
    }

    public void setCantidadSurtidores(int cantidadSurtidores) {
        this.cantidadSurtidores = cantidadSurtidores;
    }

    public Surtidor[] getSurtidores() {
        return surtidores;
    }

    public void setSurtidores(Surtidor[] surtidores) {
        this.surtidores = surtidores;
    }
    
    
    public String toString(){
        String aux="Estacion de Servicio: Direccion "+this.direccion+"; Cantidad de surtidores: "+getCantidadSurtidores()+"\n";
        
        for (int i=0;i<cantidadSurtidores;i++){
            aux+=" Surtidor "+(i+1)+": "+"Combustible dispensado: "+surtidores[i].getTipoCombustible()
                    +" Precio por Litro: "+surtidores[i].getPrecioXLitro()+"\n"
                    +" Ventas: \n";
                    Venta[] ventas=surtidores[i].getVentas();
                    for (int j=0;j<surtidores[i].getCantidadDeVentas();j++){
                        aux+= ventas[j].toString();
                    }
        
        }
        return aux;
    }
    
    
}
