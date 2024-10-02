/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje3;

/**
 *
 * @author maximosimonetti
 */
public class RecitalGira extends Recital{
    private String nombreGira;
    private int cantidadFechas;
    private int maxCantidadFechas;
    private Fecha[] gira;

    public RecitalGira(String nombreGira,int maxCantidadFechas, String nombre, int maxCantidadTemas) {
        super(nombre, maxCantidadTemas);
        this.nombreGira = nombreGira;
        this.cantidadFechas = 0;
        this.maxCantidadFechas = maxCantidadFechas;
        this.gira = new Fecha[maxCantidadFechas];
        inicializarGira();
    }
    
    
    public void inicializarGira(){
        for (int i=0;i<maxCantidadFechas;i++){
            gira[i]=null;
        }
    }
    
    public void agregarfecha(Fecha unaFecha){
        if(gira[cantidadFechas]==null && cantidadFechas<maxCantidadFechas){
            gira[cantidadFechas]=unaFecha;
            cantidadFechas++;
        }
    }
    
    public String actuar(){
        String aux="";
        
        return aux;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getCantidadFechas() {
        return cantidadFechas;
    }

    public void setCantidadFechas(int cantidadFechas) {
        this.cantidadFechas = cantidadFechas;
    }

    public int getMaxCantidadFechas() {
        return maxCantidadFechas;
    }

    public void setMaxCantidadFechas(int maxCantidadFechas) {
        this.maxCantidadFechas = maxCantidadFechas;
    }

    public Fecha[] getGira() {
        return gira;
    }

    public void setGira(Fecha[] gira) {
        this.gira = gira;
    }
    
    
    
    
    
    
    
}
