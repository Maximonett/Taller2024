/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialgnc;

/**
 *
 * @author maximosimonetti
 */
public class Surtidor {
    private boolean fueraDeServicio=false;
    private Venta[] ventas;
    private int maxCantidadVentas;
    private int cantidadDeVentas=0;

    public Surtidor(int V) {        
        this.maxCantidadVentas = V;
        this.ventas = new Venta[V];
        inicializarVentas();
    }
    
    public void inicializarVentas(){
        for (int i=0;i<this.maxCantidadVentas;i++){
            ventas[i]=null;
        }
    }
    
    public void agregarUnaVenta(Venta unaVenta){
        if (getCantidadDeVentas()<getMaxCantidadVentas()){
            getVentas()[getCantidadDeVentas()]=unaVenta;
            setCantidadDeVentas((getCantidadDeVentas()+1));
        }
    }

    public boolean isFueraDeServicio() {
        return fueraDeServicio;
    }

    public void setFueraDeServicio(boolean fueraDeServicio) {
        this.fueraDeServicio = fueraDeServicio;
    }

    public Venta[] getVentas() {
        return ventas;
    }

    public void setVentas(Venta[] ventas) {
        this.ventas = ventas;
    }

    public int getMaxCantidadVentas() {
        return maxCantidadVentas;
    }

    public void setMaxCantidadVentas(int maxCantidadVentas) {
        this.maxCantidadVentas = maxCantidadVentas;
    }

    public int getCantidadDeVentas() {
        return cantidadDeVentas;
    }

    public void setCantidadDeVentas(int cantidadDeVentas) {
        this.cantidadDeVentas = cantidadDeVentas;
    }
    
    
    public String toString(){
        String aux="";
        if (isFueraDeServicio()){
           aux+="El surtidor esta fuera de servicio.";
        }else{
            aux+="El suertidor No esta fuera de servicio.";
        }
        
        for (int i=0;i<getCantidadDeVentas();i++){
            aux+= "\n Venta: "+(i+1)+ ventas[i].toString()+"\n";
        }
        return aux;
    }
    
    
    
}
