/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author tecno
 */
public class CoroSemicircular extends Coro {
    private Corista[] coristas;
    private int maxCoristas;
    private int cantCoristas;

    public CoroSemicircular(int maxCoristas, String nombreCoro, Director director) {
        super(nombreCoro, director);
        this.maxCoristas = maxCoristas;
        this.cantCoristas = 0;
        coristas = new Corista[maxCoristas];
    }
    
    public void agregarCorista(Corista corista){
        if (cantCoristas<maxCoristas){
            coristas[cantCoristas] = corista;
            cantCoristas++;
        }
    }
    
    public boolean estaLleno(){
        return cantCoristas==maxCoristas;
    }
    
    public boolean estaBienFormado(){ //Esta bien formado cuando el tono fundamental va de mayor a menor
        boolean ret = true;
        int i=0;
        int tonoFundamentalAnterior = 0;
        if (cantCoristas>0) {
            tonoFundamentalAnterior=coristas[0].getTonoFundamental();
                }else{
            ret=false;
        }
                while ((i<cantCoristas)&&ret){
                    if (coristas[i].getTonoFundamental()<=tonoFundamentalAnterior){
                        tonoFundamentalAnterior=coristas[i].getTonoFundamental();
                        i++;
                    } else{
                        ret=false;
                    }   
        }
        return ret;
    }
    
    public String toString(){
        String aux=this.getNombreCoro()+" "+this.getDirector().toString();
        for (int i=0;i<cantCoristas;i++){
            aux+=("\n"+coristas[i].toString());
        }
        return aux;
    }
    
}
