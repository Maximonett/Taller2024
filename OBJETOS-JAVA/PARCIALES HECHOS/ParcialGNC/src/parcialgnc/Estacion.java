/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialgnc;

/**
 *
 * @author maximosimonetti
 */
public class Estacion {
    private String direccion;
    private double precioXM3;
    private Surtidor[] surtidores;
    private int cantidadSurtidores=6;

    public Estacion(String direccion, double precioXM3) {
        this.direccion = direccion;
        this.precioXM3 = precioXM3;
        this.surtidores = new Surtidor[this.cantidadSurtidores];
        inicializarSurtidores();      
    }
    
    
    public void inicializarSurtidores(){
        for (int i=0;i<this.cantidadSurtidores;i++){
            surtidores[i]=new Surtidor(100);
        }
    }
    
    
    
    public void generarUnaVenta(int N,String dni,double cantidadM3,String formaDePago){
        if(surtidores[N]!=null){
            if (surtidores[N].isFueraDeServicio()!=true){
                Venta unaVenta=new Venta(dni, cantidadM3, formaDePago);
                unaVenta.setMontoAbonado((unaVenta.getCantM3cargados()*getPrecioXM3()));
                surtidores[N].agregarUnaVenta(unaVenta);
                
            }
        }                       
    }
    
    public void fueraDeServicio(double X){
        double m3Totales=0;
        for (int i=0;i<getCantidadSurtidores();i++){
            m3Totales=0;
            if(!surtidores[i].isFueraDeServicio()){
                for (int j=0;j<surtidores[i].getCantidadDeVentas();j++){
                    if (surtidores[i].getVentas()[j]!=null){
                        m3Totales+=surtidores[i].getVentas()[j].getCantM3cargados();
                    }                
                }
            }
            if (m3Totales<X){
                surtidores[i].setFueraDeServicio(true);
            }
        }
    }
    
    public Venta obtenerLaVentaConMayorMonto(){
        Venta ventaMayorMonto=null;
        double mayorMonto=-1;        
        double montoDeLaVenta=0;
        for (int i=0;i<getCantidadSurtidores();i++){
            if (surtidores[i]!=null){
                for (int j=0;j<surtidores[i].getCantidadDeVentas();j++){
                    if( surtidores[i].getVentas()[j]!=null && surtidores[i].getVentas()[j].getMontoAbonado()>mayorMonto){
                        ventaMayorMonto=surtidores[i].getVentas()[j];
                        mayorMonto=surtidores[i].getVentas()[j].getMontoAbonado();
                    }
            
                }
            }
            
        }
               
        return ventaMayorMonto;
    }
        

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecioXM3() {
        return precioXM3;
    }

    public void setPrecioXM3(double precioXM3) {
        this.precioXM3 = precioXM3;
    }

    public Surtidor[] getSurtidores() {
        return surtidores;
    }

    public void setSurtidores(Surtidor[] surtidores) {
        this.surtidores = surtidores;
    }

    public int getCantidadSurtidores() {
        return cantidadSurtidores;
    }

    public void setCantidadSurtidores(int cantidadSurtidores) {
        this.cantidadSurtidores = cantidadSurtidores;
    }
    
    public String toString(){
        String aux="";
        
        for (int i=0;i<cantidadSurtidores;i++){
            aux+="\n Surtidor Nº -"+(i+1)+"- "+surtidores[i].toString()+"\n";
        
        }
        return aux;
    }
}
