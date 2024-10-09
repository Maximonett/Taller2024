/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnohtema1_17_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Estadio {
    private String nombre;
    private String direccion;
    private int capacidad;
    private int meses;
    private int dias;
    private Concierto[][] agenda;

    public Estadio(String nombre,String direccion, int capacidad) {
        this.nombre=nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
        this.meses = 12;
        this.dias = 31;
        this.agenda = new Concierto[meses][dias];
        inicializarAgenda();
        
    }
    
    public void inicializarAgenda(){
        for (int i=0;i<meses;i++){
            for(int j=0;j<dias;j++){
                agenda[i][j]=null;
            }
        }
        
    }
    
    public void registrarUnConcierto(int unMes,Concierto unConcierto){
        boolean salir=false;
        for (int i=0;i<dias && salir==false;i++){
            if(agenda[unMes][i]==null){
                agenda[unMes][i]=unConcierto;              
                salir=true;
            }
        }                                    
    }
    
    public String listarLosConciertosDelMes(int unMes){
        String aux="";
        for (int i=0;i<dias;i++){
            if (agenda[unMes][i]!=null){
                aux+= agenda[unMes][i].toString()+"\n";
            }
        }                
        return aux;
    }
    
    public double calcularLaGananciaDelEstadioEnElMes(int unMes){
        double ganancia=0;
        for (int i=0;i<dias;i++){
            if (agenda[unMes][i]!=null){
                ganancia+=(agenda[unMes][i].getPrecioDeLaEntrada()*agenda[unMes][i].getCantidadDeEntradasVendidas())/2;
            }
        }            
        return ganancia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public int getMeses() {
        return meses;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public int getDias() {
        return dias;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }

    public Concierto[][] getAgenda() {
        return agenda;
    }

    public void setAgenda(Concierto[][] agenda) {
        this.agenda = agenda;
    }
    
    
    public String toString(){
        String aux="Estadio: "+this.nombre+" Direccion: " +this.direccion+" Capacidad: "+this.capacidad+"\n";
            for (int i=0;i<meses;i++){
                for (int j=0;j<dias;j++){
                    if (agenda[i][j]!=null){
                        aux+= "Mes "+(j+1)+"\n"+" Dia "+(i+1)+": "+agenda[i][j].toString()+"\n";
                    }                    
                }            
            }
        return aux;
    }
    
}
