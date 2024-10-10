/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package turnobtema2_17_10_22;

/**
 *
 * @author maximosimonetti
 */
public class Barrio {
    private String nombreDelBarrio;
    private int manzanas;
    private int lotesXManzana;
    private int cantidadDeLotes=manzanas*lotesXManzana;
    private Lote[][] barrio;

    public Barrio(String nombreDelBarrio, int N, int M) {
        this.nombreDelBarrio = nombreDelBarrio;
        this.manzanas = N;
        this.lotesXManzana = M;
        this.barrio=new Lote[N][M];
        inicializarBarrio();
    }
    
    public void inicializarBarrio(){
        for (int i=0; i<this.manzanas;i++){
            for (int j=0;j<this.lotesXManzana;j++){
                barrio[i][j]=new Lote();
            }
        }
    }
    
    
    public double totalRecuadadoEnLosLotesVendidos(){
        double total=0;
        for (int i=0;i<manzanas;i++){
            for (int j=0;j<lotesXManzana;j++){
                if(barrio[i][j].getComprador()!=null){
                    total+=barrio[i][j].getPrecio();
                    System.out.println("Precio del lote: "+barrio[i][j].getPrecio());
                }
            }
        
        }
        
        return total;
    }   
    
    public void incrementarPorcentajeDePrecioAUnaManzana(double porcentaje,int X){        
        for (int i=0;i<lotesXManzana;i++){
            if(barrio[X-1][i].getComprador()==null){
                Lote lote = barrio[X-1][i];
                lote.incrementarPrecioPorcentaje(porcentaje);
                System.out.println("El precio se actualizado");
            }            
        }    
    }
        
    
    public void agregarCompradorAUnLote(Comprador unComprador,int unaManzana,int unNumeroDeLote){
        if (unaManzana>0 && unaManzana<=manzanas && unNumeroDeLote>0 && unNumeroDeLote<=lotesXManzana){
            int indiceManzana=unaManzana-1;
            int indiceLote=unNumeroDeLote-1;
            if (barrio[indiceManzana][indiceLote].getComprador()==null){
                barrio[indiceManzana][indiceLote].setComprador(unComprador);
                System.out.println("El comprador ha sido asignado el Lote Manzana: "
                    +unaManzana+" y numero de lote: "+unNumeroDeLote);
            }else{
                System.out.println("El lote ya tiene comprador.");
            }                        
        }else{
            System.out.println("El lote no se encontraba en el rango del barrio.");
        }    
    }
    

    public String getNombreDelBarrio() {
        return nombreDelBarrio;
    }

    public void setNombreDelBarrio(String nombreDelBarrio) {
        this.nombreDelBarrio = nombreDelBarrio;
    }

    public int getManzanas() {
        return manzanas;
    }

    public void setManzanas(int manzanas) {
        this.manzanas = manzanas;
    }

    public int getLotesXManzana() {
        return lotesXManzana;
    }

    public void setLotesXManzana(int lotesXManzana) {
        this.lotesXManzana = lotesXManzana;
    }

    public int getCantidadDeLotes() {
        return cantidadDeLotes;
    }

    public void setCantidadDeLotes(int cantidadDeLotes) {
        this.cantidadDeLotes = cantidadDeLotes;
    }

    public Lote[][] getBarrio() {
        return barrio;
    }

    public void setBarrio(Lote[][] barrio) {
        this.barrio = barrio;
    }
    
   public String toString(){
       String aux="Barrio: "+this.nombreDelBarrio+"\n";
       aux+="Recaudacion actual: $"+totalRecuadadoEnLosLotesVendidos()+"\n";
       for (int i=0;i<manzanas;i++){
           aux+="Manzana #"+(i+1)+"\n";
           for (int j=0;j<lotesXManzana;j++){
               if(barrio[i][j].getComprador()!=null){
                   aux+="Lote # "+(j+1)+"-"+barrio[i][j].getComprador().toString();
               }
           }
       }        
       return aux;
   }
    
}
