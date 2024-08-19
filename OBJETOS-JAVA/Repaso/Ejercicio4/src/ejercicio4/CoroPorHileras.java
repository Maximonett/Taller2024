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
public class CoroPorHileras extends Coro {//hileras->filas
    private Corista[][] coristas;
    private int filas;
    private int columnas;
    private int cantCoristas;
            
    private int getMaxCoristas(){
        return filas*columnas;
    }        

    public CoroPorHileras(int filas, int columnas, String nombreCoro, Director director) {
        super(nombreCoro, director);
        this.filas = filas;
        this.columnas = columnas;
        this.cantCoristas =0;
        coristas = new Corista[filas][columnas];
        
    }
          
    public void agregarCorista(Corista corista){
        if (cantCoristas<this.getMaxCoristas()){
            coristas[cantCoristas / columnas][cantCoristas % columnas] = corista;
            cantCoristas++;
        }
    }
    
    public boolean estaLleno(){
        return cantCoristas==getMaxCoristas();
    }
    
    public boolean estaBienFormado(){ //Esta bien formado cuando el tono fundamental es igual en cada fila y va de mayor a menor entre filas
        
        boolean ret = true;
        int i=0;
        int j=0;
        int NCorista=0;
        int tonoFundamental;
        if (cantCoristas<1){
            ret=false;
        }
        while ((NCorista<cantCoristas)&&ret){
            tonoFundamental=coristas[i][j].getTonoFundamental();
            while ((NCorista<cantCoristas)&&(j<columnas)&&(tonoFundamental==coristas[i][j].getTonoFundamental())){
                j++;
                NCorista++;
            }
            if ((i+1)<filas){
            i++;
            }
            if ((j==columnas)&&(tonoFundamental>=coristas[i][j-1].getTonoFundamental())){
                j=0;
            } else {
                ret = false;
            }
        }
        return ret;
    }
    
    public String toString(){
        String aux=this.getNombreCoro()+" "+this.getDirector().toString();
        int i=0;
        int j;
        int n=0;
        while ((n<cantCoristas)&&(i<filas)){
            j=0;
            while (((n<cantCoristas)&&(j<columnas))){
                aux+=("\n"+coristas[i][j].toString());
                j++;
                n++;
                }
            i++;
        }
        return aux;
    }
    
}
