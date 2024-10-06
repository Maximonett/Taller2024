/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje4;

/**
 *
 * @author maximosimonetti
 */
public class CoroHileras extends Coros{
    private int maxHileras;//debo agregarlo en el constructor
    private int cantidadHileras=0;
    private Corista[][] coroHileras;

    public CoroHileras(Director director, int maxCantCoristas,int maxHileras) {
        super(director, maxCantCoristas);
        this.maxHileras=maxHileras;//agregado en el constructor ademas de pasarlo por parametro 
        this.coroHileras = new Corista[maxHileras][getMaxCantCoristas()];
        inicializarCoro();
        
    }
    
    public void inicializarCoro(){
        for (int i=0;i<maxHileras;i++){
            for (int j=0;j<getMaxCantCoristas();j++){
                coroHileras[i][j]=null;
            }
        }
    }
    
    public void agregarUnCorista(Corista UnCorista){
        if (coroHileras[cantidadHileras][getCantidadCoristas()]==null&&cantidadHileras<maxHileras && getCantidadCoristas()<getMaxCantCoristas()){
            coroHileras[cantidadHileras][getCantidadCoristas()]=UnCorista;           
            setCantidadCoristas(getCantidadCoristas()+1);
            
            if(getCantidadCoristas()==getMaxCantCoristas()){
               this.cantidadHileras++;
                setCantidadCoristas(0);
            }
        }else{
            System.out.println("No hay mas espacio en el coro");
        }
       
    }
    
    public boolean estaLleno(){
        for (int i=0;i<maxHileras;i++){
            for (int j=0;j<getMaxCantCoristas();j++){
                if(coroHileras[i][j]==null){
                    return false;
                }
            }
        }
        return true;
    }
    
    public boolean estaBienFormado() {
    // Verificamos si los coristas de cada hilera tienen el mismo tono fundamental
        for (int i = 0; i < maxHileras; i++) {
            if (coroHileras[i][0] != null) {  // Verificamos que la hilera no esté vacía
                int tonoReferencia = coroHileras[i][0].getTonoFundamental();  // Tono del primer corista de la hilera
                for (int j = 1; j < getMaxCantCoristas(); j++) {
                    if (coroHileras[i][j] != null) {
                        if (coroHileras[i][j].getTonoFundamental() != tonoReferencia) {
                            return false;  // Si el tono no coincide con el primero de la hilera, no está bien formado
                        }
                    }
                }
            }
        }

        // Verificamos si los primeros coristas de cada hilera están ordenados de mayor a menor en cuanto a tono
        for (int i = 0; i < maxHileras - 1; i++) {
            if (coroHileras[i][0] != null && coroHileras[i + 1][0] != null) {  // Comparamos los primeros de cada hilera
                if (coroHileras[i][0].getTonoFundamental() < coroHileras[i + 1][0].getTonoFundamental()) {
                    return false;  // Si el primer corista de la hilera actual tiene un tono menor, no está bien formado
                }
            }
        }

        return true;  // Si todas las verificaciones pasan, el coro está bien formado
    }

    
    public String toString(){
        String aux="Coro "+getNombre()+"\n"+ "Director: "+ getDirector().getNombreDelMusico()
                    +"\n DNI: "+getDirector().getDni()+"\n Edad: "+getDirector().getEdad()
                    +" años, \nAntiguedad: "+getDirector().getAntiguedad()+" años.";
        aux+="Coristas: \n";
        
        for (int i=0;i<maxHileras;i++){
            for(int j=0;j<getCantidadCoristas();j++){
                Corista corista=coroHileras[i][j];
                if(corista !=null){
                    aux+=" Corista "+i+" "+corista.getNombreDelMusico()
                    +" DNI: "+corista.getDni()
                    +" Edad: "+corista.getEdad()+" años "
                    +" Tono Fundamental: "+ corista.getTonoFundamental()+"\n";
                
                }                
            }                        
        }                                    
        return aux;
    }
         
    
    
}
