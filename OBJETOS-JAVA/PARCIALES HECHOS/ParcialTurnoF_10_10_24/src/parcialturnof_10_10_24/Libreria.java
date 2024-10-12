/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnof_10_10_24;

import javax.imageio.ImageIO;

/**
 *
 * @author maximosimonetti
 */
public class Libreria {
    private String nombre;
    private int numeroDeVentaActual;
    private int cantidadDeCajas;
    private Caja[] cajas;
    private int cantidadMaximaDeTicketsXCaja;

    public Libreria(String nombre,int T) {
        this.nombre = nombre;
        this.cantidadMaximaDeTicketsXCaja=T;
        this.cantidadDeCajas=4;
        this.numeroDeVentaActual = 0;
        this.cajas = new Caja[4];
        inicializarCajas();
    }
    
    public void inicializarCajas(){
        for (int i=0;i<cantidadDeCajas;i++){
            cajas[i]=new Caja(this.cantidadMaximaDeTicketsXCaja);
        }
    }
    
    public String generarTicket(int N,String dni,int cantLibrosComp,double unMonto,String unaFormaPago){
        String aux="";
        Caja caja=cajas[N];
        if(caja.isDisponible()){
            Ticket unTicket=new Ticket(numeroDeVentaActual+1, dni, cantLibrosComp, unMonto, unaFormaPago);
            caja.agregarUnTicket(unTicket);
            numeroDeVentaActual++;
            return unTicket.toString();
        }else{
            return "La caja no se encuentra disponible.";
        }        
    }
    
    public void marcarComoNoDisponible(int X){                
        int cantidadDeLibroXCaja=0;
        for (int i=0;i<cantidadDeCajas;i++){
            cantidadDeLibroXCaja=0;
            
            if(cajas[i].isDisponible()){
                
                for (int j=0;j<cajas[i].getCantidadDeticketsEmitidos();j++){
                    Ticket ticketEmitido=cajas[i].getTicketsEmitidos()[j];
                    cantidadDeLibroXCaja+=ticketEmitido.getCantidadDeLibrosComprados();                                                                    
                    }                    
                }
                if(cantidadDeLibroXCaja<X){
                    cajas[i].setDisponible(false);
                    System.out.println("Lo sentimos la caja No esta disponible, venidio menos de "+X+" cantidad de libros.");
                }
            
        }                        
    }                        
    
    public String ticketMayorMonto(){
        String aux="";
        double maxMonto=-1;
        Ticket mayorTicket=null;
        for (int i=0;i<cantidadDeCajas;i++){
            for (int j=0;j<cajas[i].getCantidadDeticketsEmitidos();j++){
                if(cajas[i].getTicketsEmitidos()[j]!=null && cajas[i].getTicketsEmitidos()[j].getMontoAbonado()>maxMonto){
                    maxMonto=cajas[i].getTicketsEmitidos()[j].getMontoAbonado();
                    mayorTicket=cajas[i].getTicketsEmitidos()[j];                    
                }
            }            
        }        
        return mayorTicket.toString();
    }
    
    public String toString(){
        String aux="Libreria: "+this.nombre+"\n";
        
        for (int i=0;i<this.cantidadDeCajas;i++){
            aux+="Caja "+(i+1)+" :\n";
            for (int j=0;j<cajas[i].getCantidadDeticketsEmitidos();j++){
                if (cajas[i].getTicketsEmitidos()[j]!=null){
                    aux+=cajas[i].getTicketsEmitidos()[j].toString()+"\n";
                }
            }
        }
        return aux;
    }
    
}
