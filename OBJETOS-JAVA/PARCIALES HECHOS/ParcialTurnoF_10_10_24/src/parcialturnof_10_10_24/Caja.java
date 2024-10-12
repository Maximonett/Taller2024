/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnof_10_10_24;

/**
 *
 * @author maximosimonetti
 */
public class Caja {
    private boolean disponible;    
    private int maxTicketsEmitidos;
    private int cantidadDeticketsEmitidos;
    private Ticket[] ticketsEmitidos;
    
    
    public Caja(int T) {
        this.disponible = true;        
        this.maxTicketsEmitidos = T;
        this.cantidadDeticketsEmitidos = 0;
        this.ticketsEmitidos =new Ticket[T];
        inicializarTicketsEmitidos();
    }        
    
    public void inicializarTicketsEmitidos(){
        for (int i=0;i<maxTicketsEmitidos;i++){
            ticketsEmitidos[i]=null;
        }    
    }
    
    public void agregarUnTicket(Ticket unTicket){
        if(ticketsEmitidos[cantidadDeticketsEmitidos]==null && cantidadDeticketsEmitidos<maxTicketsEmitidos){
            ticketsEmitidos[cantidadDeticketsEmitidos]=unTicket;
            cantidadDeticketsEmitidos++;
        }
    }
    
    public Ticket obtenerUnTicket(){
       if (cantidadDeticketsEmitidos>0){
           return ticketsEmitidos[cantidadDeticketsEmitidos-1];
       }else{
           return null;
       }
    }
    
    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public int getMaxTicketsEmitidos() {
        return maxTicketsEmitidos;
    }

    public void setMaxTicketsEmitidos(int maxTicketsEmitidos) {
        this.maxTicketsEmitidos = maxTicketsEmitidos;
    }

    public int getCantidadDeticketsEmitidos() {
        return cantidadDeticketsEmitidos;
    }

    public void setCantidadDeticketsEmitidos(int cantidadDeticketsEmitidos) {
        this.cantidadDeticketsEmitidos = cantidadDeticketsEmitidos;
    }

    public Ticket[] getTicketsEmitidos() {
        return ticketsEmitidos;
    }

    public void setTicketsEmitidos(Ticket[] ticketsEmitidos) {
        this.ticketsEmitidos = ticketsEmitidos;
    }
    
    
    
    
}
