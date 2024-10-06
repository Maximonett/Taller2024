/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje4;

/**
 *
 * @author maximosimonetti
 */
public class CoroSemicircular extends Coros{
    private Corista[] coroSemicircular;

    public CoroSemicircular(Director director, int maxCantCoristas) {
        super(director, maxCantCoristas);
        this.coroSemicircular = new Corista[maxCantCoristas];
        inicializarCoro();        
    }
    
    public void inicializarCoro(){
       for (int i=0;i<getMaxCantCoristas();i++){
           coroSemicircular[i]=null;
       }    
    }
    
    public  void agregarUnCorista(Corista UnCorista){
        int cantidad=getCantidadCoristas();
        int maxCoristas=getMaxCantCoristas();
        
        if (cantidad<maxCoristas){
            coroSemicircular[cantidad]=UnCorista;
            cantidad++;
            setCantidadCoristas(cantidad);
        }else{
            System.out.println("No hay mas lugar en el coro");
        }        
    }
    
    public boolean estaLleno(){
        boolean lleno=false;
        int cantidad=getCantidadCoristas();
        int maxCoristas=getMaxCantCoristas();
        if (cantidad==maxCoristas){
            lleno=true;            
        }else{
            System.out.println("El coro no esta lleno");
        }
        return lleno;
    }
    
    public  boolean estaBienFormado(){
        int cantidad=getCantidadCoristas();
        //se recorre el codigo hasta el penultimo elemento
        for (int i=0;i<cantidad-1;i++){
            if(coroSemicircular[i].getTonoFundamental()<coroSemicircular[i+1].getTonoFundamental()){
                return false; //si e corista actual tiene un tono menor al siguiente , no esta bien formado
            }
        }
        //si recorremos todo el arreglo sin encontrar desorden, el coro esta bien formado
        return true;
    }
    
    public String toString(){
        String aux="Coro "+getNombre()+"\n"+ "Director: "+ getDirector().getNombreDelMusico()
                    +"\n DNI: "+getDirector().getDni()+"\n Edad: "+getDirector().getEdad()
                    +" años, \nAntiguedad: "+getDirector().getAntiguedad()+" años.";
        aux+="Coristas: \n";
        
        for (int i=0;i<getCantidadCoristas();i++){
            Corista corista=coroSemicircular[i];
            aux+=" Corista "+i+" "+corista.getNombreDelMusico()
                    +" DNI: "+corista.getDni()
                    +" Edad: "+corista.getEdad()+" años "
                    +" Tono Fundamental: "+ corista.getTonoFundamental()+"\n";
        }

            
        
        
        
        return aux;
    }
    
}
