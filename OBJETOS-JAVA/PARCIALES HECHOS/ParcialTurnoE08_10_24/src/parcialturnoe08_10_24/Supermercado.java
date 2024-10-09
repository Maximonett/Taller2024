/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe08_10_24;

/**
 *
 * @author maximosimonetti
 */
public class Supermercado {
    private String direccion;
    private int numeroDeVentaActual=0;
    private int maximaCantidadDeCajas;
    private int cantidadDeCajas=0;
    private Caja[] cajas;

    public Supermercado(String direccion) {
        this.direccion = direccion;
        this.maximaCantidadDeCajas =5;
        this.cajas=new Caja[maximaCantidadDeCajas];
        inicializarCajas();
    }
    
    public void inicializarCajas(){
        for (int i=0;i<maximaCantidadDeCajas;i++){
            cajas[i]=null;
        }
    }

    public void agregarUnaCaja(Caja unaCaja){
        if(cajas[cantidadDeCajas]==null && cantidadDeCajas<maximaCantidadDeCajas){
            cajas[cantidadDeCajas]=unaCaja;
            cantidadDeCajas++;
        }else{
            System.out.println("No hay mas lugar para agregar cajas.");
        }    
    }
    
    public Ticket generarUnTicket(int numeroDeCaja,String unCuit,int cantidadDeProductos,double montoAbonado,String formaDePago){
        Ticket unTicket=null;
        if (cajas[numeroDeCaja]!=null){
            unTicket=new Ticket(numeroDeVentaActual, unCuit, formaDePago);
            cajas[numeroDeCaja].generarTicket(unTicket);
            unTicket.setCantidadProductosComprados(cantidadDeProductos);
            unTicket.setMonto(montoAbonado);
            numeroDeVentaActual++;
        }       
        return unTicket;
    }
    
    public int cajaConMenorCantidadDeTickets(){
        int minCaja=999;
        int minCantTicket=999;        
        for (int i=0;i<cantidadDeCajas;i++){
            if(minCantTicket>cajas[i].getCantidadTickets()){
                minCantTicket=cajas[i].getCantidadTickets();
                minCaja=i;              
            }
        }
        return minCaja;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNumeroDeVentaActual() {
        return numeroDeVentaActual;
    }

    public void setNumeroDeVentaActual(int numeroDeVentaActual) {
        this.numeroDeVentaActual = numeroDeVentaActual;
    }

    public int getMaximaCantidadDeCajas() {
        return maximaCantidadDeCajas;
    }

    public void setMaximaCantidadDeCajas(int maximaCantidadDeCajas) {
        this.maximaCantidadDeCajas = maximaCantidadDeCajas;
    }

    public int getCantidadDeCajas() {
        return cantidadDeCajas;
    }

    public void setCantidadDeCajas(int cantidadDeCajas) {
        this.cantidadDeCajas = cantidadDeCajas;
    }

    public Caja[] getCajas() {
        return cajas;
    }

    public void setCajas(Caja[] cajas) {
        this.cajas = cajas;
    }
    
    
    public String toString(){
        String aux= "Supermercado: Direccion "+this.direccion+" Cantidad De cajas: "+this.cantidadDeCajas+"\n";
            for (int i=0;i<cantidadDeCajas;i++){
                if(cajas[i]!=null){
                    aux+= " \n Caja "+i+" : "+cajas[i].getNombreDeCajero()+" Tickets emitidos: ";                 
                    for (int j=0;j<cajas[i].getCantidadTickets();j++){
                        Ticket[] ticket=cajas[i].getTickets();
                        aux+= "\n"+ticket[j].toString();
                    }                        
                }                
            }        
        return aux;
    }
    
    
}
