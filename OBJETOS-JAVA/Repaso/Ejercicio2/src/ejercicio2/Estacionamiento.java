/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author tecno
 */
public class Estacionamiento {
    private Auto[][] autos;
    private int cantPisos;
    private int cantPlazas;
    private String nombre;
    private String direccion;
    private String apertura;
    private String cierre;

    public Estacionamiento( String nombre, String direccion,int cantPisos, int cantPlazas) {
        this.cantPisos = cantPisos;
        this.cantPlazas = cantPlazas;
        this.nombre = nombre;
        this.direccion = direccion;
        autos = new Auto[cantPisos][cantPlazas];
        iniciarEstacionamiento();
        this.apertura="8:30";
        this.cierre="21:0";

    }

    public Estacionamiento(String nombre, String direccion,String apertura,String cierre,int cantPisos, int cantPlazas) {
        this.cantPisos = cantPisos;
        this.cantPlazas = cantPlazas;
        this.nombre = nombre;
        this.direccion = direccion;
        autos = new Auto[cantPisos][cantPlazas];
        iniciarEstacionamiento();
        this.apertura=apertura;
        this.cierre=cierre;

    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setApertura(String apertura) {
        this.apertura = apertura;
    }

    public void setCierre(String cierre) {
        this.cierre = cierre;
    }

    public int getCantPisos() {
        return cantPisos;
    }

    public int getCantPlazas() {
        return cantPlazas;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getApertura() {
        return apertura;
    }

    public String getCierre() {
        return cierre;
    }
    private void iniciarEstacionamiento(){
        for (int i=0;i<cantPisos;i++){
            for (int j=0;j<cantPlazas;j++){
                autos[i][j]=null;
            }
        }
    }
    
    public int getCantAutosEnPlaza(int numeroPlaza){
        int cantAutos=0;
        for (int i=0;i<cantPisos;i++){
            if (autos[i][numeroPlaza]!=null){
                cantAutos++;
            }
        }
        return cantAutos;
    }
    
    public void agregarAuto(Auto auto,int piso,int plaza){
        autos[piso-1][plaza-1]=auto;
    }
    
    public String findAuto(String patente){
        boolean encontre = false;
        int i=0;
        int j=0;
        while ((!encontre)&&(i<cantPisos)){
            j=0;
            while ((!encontre)&&(j<cantPlazas)){
                if ((autos[i][j]!=null)&&(autos[i][j].getPatente().equals(patente))){
                    encontre=true;
                } else {
                    j++;
                }
            }
            if (!encontre){
                i++;
        }
        }

        if (encontre){
            return "El auto con patente "+patente+" se encuentre en el piso "+i+", plaza "+j+"\n";
        } else {
            return "Te robaron el auto";
        }
        
    }

    @Override
    public String toString() {
        String aux= "Estacionamiento: " + "cantPisos=" + cantPisos + ", cantPlazas=" + cantPlazas 
                + ", nombre=" + nombre + ", direccion=" + direccion + ", apertura=" + apertura + ", cierre=" + cierre;
        for (int i=0;i<cantPisos;i++){
            for (int j=0;j<cantPlazas;j++){
                aux+=("\n"+"Piso: "+i+" plaza: "+j+"--> ");
                if (autos[i][j]==null){
                    aux+="Libre.";
                }   else {
                aux+=autos[i][j].toString();
            }
        }
    }   
        return aux;
}
}
