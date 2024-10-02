/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje2;

/**
 *
 * @author maximosimonetti
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int maxPisosN;
    private int maxPlazasM;
    private Auto[][] estacionamiento;
    private int cantidadAutos;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura="08:00";
        this.horaCierre="21:00";
        this.maxPisosN=5;
        this.maxPlazasM=10;
        this.estacionamiento=new Auto[maxPisosN][maxPlazasM];
        this.cantidadAutos=0;
        inicializarEstacionamiento();
    }

    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int maxPisosN, int maxPlazasM) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.maxPisosN = maxPisosN;
        this.maxPlazasM = maxPlazasM;
        this.estacionamiento=new Auto[maxPisosN][maxPlazasM];
        inicializarEstacionamiento();
    }
        
    
    public void inicializarEstacionamiento(){
        for (int i=0;i<maxPisosN;i++){
            for(int j=0; j<maxPlazasM;j++){
                estacionamiento[i][j]=null;
            }
        }
    }
    
    public void registrarAuto(Auto A,int piso,int plaza){
        if (piso>=0 && piso<maxPisosN && plaza>=0 && plaza<maxPlazasM){
            if(estacionamiento[piso][plaza]==null){
                estacionamiento[piso][plaza]=A;
                cantidadAutos++;
            }else{
                System.out.println("El lugar esta ocupado");
            }
        }else{
            System.out.println("El rango de piso y plaza es incorrecto");
        }
        
    }
    
    public String dondeEstaElAuto(String patente){
        String aux="";
        boolean encontrado=false;        
        for (int i=0;i<maxPisosN;i++){
            for (int j=0;j<maxPlazasM;j++){
                if ( estacionamiento[i][j]!=null && estacionamiento[i][j].getPatente().equals(patente)){
                    aux += "El suto esta en el piso "+i+ " y numero de plaza "+j+" . ";
                    encontrado=true;                                    
                }
            }
        }
        if (!encontrado){
            aux+="Auto inexistente";
        }        
        return aux;
    }
    
    public int cantidadAutosPorPiso(int plaza){
        int cantidad=0;
        for (int i=0;i<maxPisosN;i++){
            if (estacionamiento[i][plaza]!=null){
                cantidad++;                
            }
        }        
        return cantidad;
    }
    
    public String toString(){
        String aux="Estacionamiento: "+this.nombre+"\n";
        for (int i=0;i<maxPisosN;i++){
            for(int j=0;j<maxPlazasM;j++){
                if (estacionamiento[i][j]==null){
                    aux+=" Piso "+(i+1)+" Plaza "+(j+1)+" : Libre.\n"; 
                }else{
                    aux+=" Piso "+(i+1)+" Plaza "+(j+1)+" : " +estacionamiento[i][j].toString()+ "\n";
                }                
            }
        }            
        return aux;
    }
    
}
