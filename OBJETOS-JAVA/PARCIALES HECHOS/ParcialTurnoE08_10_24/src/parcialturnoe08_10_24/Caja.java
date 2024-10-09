/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoe08_10_24;

/**
 *
 * @author maximosimonetti
 */
public class Caja {
    private String nombreDeCajero;
    private int maxCantidadTickets;
    private int cantidadTickets=0;
    private Ticket[] tickets;

    public Caja(String nombreDeCajero, int maxCantidadTickets) {
        this.nombreDeCajero = nombreDeCajero;
        this.maxCantidadTickets = maxCantidadTickets;
        this.tickets=new Ticket[maxCantidadTickets];
        inicializarTickets();
    }
    
    public void inicializarTickets(){
        for(int i=0; i<maxCantidadTickets;i++){
            tickets[i]=null;
        }
    }
    
    public Ticket generarTicket(Ticket unTicket){
        if(tickets[cantidadTickets]==null && cantidadTickets<maxCantidadTickets){
            tickets[cantidadTickets]=unTicket;
            cantidadTickets++;
        }
        return unTicket;
    }

    public String getNombreDeCajero() {
        return nombreDeCajero;
    }

    public void setNombreDeCajero(String nombreDeCajero) {
        this.nombreDeCajero = nombreDeCajero;
    }

    public int getMaxCantidadTickets() {
        return maxCantidadTickets;
    }

    public void setMaxCantidadTickets(int maxCantidadTickets) {
        this.maxCantidadTickets = maxCantidadTickets;
    }

    public int getCantidadTickets() {
        return cantidadTickets;
    }

    public void setCantidadTickets(int cantidadTickets) {
        this.cantidadTickets = cantidadTickets;
    }

    public Ticket[] getTickets() {
        return tickets;
    }

    public void setTickets(Ticket[] tickets) {
        this.tickets = tickets;
    }
    
    
    
    
}
