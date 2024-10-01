/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica5eje1;

/**
 *
 * @author maximosimonetti
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private int maxCantidadInvest=50;
    private Investigador[] investigadores;
    private int cantidadInvestigadores=0;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.investigadores= new Investigador[maxCantidadInvest];
        this.cantidadInvestigadores=0;
        inicializarInvestigadores();
    }
    
    public void inicializarInvestigadores(){
        for (int i=0;i<maxCantidadInvest;i++){
            investigadores[i]=null;
        }
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if (cantidadInvestigadores<maxCantidadInvest){
            investigadores[cantidadInvestigadores]=unInvestigador;
            cantidadInvestigadores++;
        }else{
            System.out.println("Ya no se puede agregar mas investigadores.");
        }
    }
    
    public double dineroTotalOtorgado(){
        double dineroTotal=0;
        for (int i=0;i<cantidadInvestigadores;i++){
            Investigador inv=investigadores[i];
            
            for(int j=0;j<inv.getCantidadSubsidios();j++){
                Subsidio sub=inv.getSubsidios()[j];
                
                if (sub.isOtorgado()){
                    dineroTotal+=sub.getMonto();
                }
            }         
        }
         return dineroTotal;       
    }
    
    public void otorgarTodos(String nombre){
        boolean encontrado=false;
        
        for (int i=0;i<cantidadInvestigadores;i++){
            Investigador inv=investigadores[i];
            if (inv!=null && inv.getNombreCompleto().equals(nombre)){
                encontrado=true;
                for (int j=0;j<inv.getCantidadSubsidios();j++){
                    Subsidio sub=inv.getSubsidios()[j];
                        if (sub!=null && !sub.isOtorgado()){
                            sub.setOtorgado(true);
                        }
            }            
            }
        } 
        if(!encontrado){
            System.out.println("No se encontro el Investigador de Nombre "+nombre);
        }
    }
    
}
