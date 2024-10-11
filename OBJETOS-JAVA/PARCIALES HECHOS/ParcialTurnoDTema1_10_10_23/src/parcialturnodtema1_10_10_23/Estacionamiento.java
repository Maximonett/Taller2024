/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnodtema1_10_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Estacionamiento {
    private String direccion;
    private double costoXHora;
    private int sectores;
    private int vehiculosXSector;
    private int numeroSector;
    private int numeroVehiculo;
    private Vehiculo[][] lugares;

    public Estacionamiento(String direccion, double costoXHora, int S, int V) {
        this.direccion = direccion;
        this.costoXHora = costoXHora;
        this.sectores = S;
        this.vehiculosXSector = V;
        this.numeroSector=0;
        this.numeroVehiculo=0;        
        this.lugares = new Vehiculo[S][V];
        inicializarLugares();
    }
                
    public void inicializarLugares(){
        for (int i=0;i<sectores;i++){
            for (int j=0;j<vehiculosXSector;j++){
                lugares[i][j]=null;
            }
        }        
    }
    
    public void registresrUnVehiculo(int X, int Y, Vehiculo unVehiculo) {
    // Verificar si X y Y están dentro del rango correcto de sectores y vehículos por sector
    if (X >= 0 && X < sectores && Y >= 0 && Y < vehiculosXSector) {
        // Verificar si el lugar está libre
        if (lugares[X][Y] == null) {
            lugares[X][Y] = unVehiculo;
            System.out.println("Vehículo registrado correctamente.");
        } else {
            System.out.println("Lo siento, pero el lugar está ocupado.");
        }
    } else {
        System.out.println("El lugar está fuera del rango del estacionamiento.");
    }
}

    
    
    public String liberarTodosLosLugares(int X, String marca) {
    String aux = "";
    
    // Asegurarse de que el sector X esté en el rango válido
    if (X >= 0 && X < sectores) {
        // Recorrer todos los vehículos del sector X
        for (int i = 0; i < vehiculosXSector; i++) {
            // Si el lugar no está vacío y coincide la marca
            if (lugares[X][i] != null && lugares[X][i].getMarca().equals(marca)) {
                // Guardar información del vehículo ANTES de liberarlo
                aux += "El auto "+(i+1) + lugares[X][i].toString() + " ha sido liberado. \n";
                // Liberar el lugar
                lugares[X][i] = null;
            }
        }
    } else {
        aux = "El sector especificado no es válido.";
    }
    
    return aux;
}

    
    public int sectorQueRecaudoMas(){
        double totalRecaudadoSector;
        double maxRecaudacion=-1;
        int maxSector=-1;
        for (int i=0;i<sectores;i++){
            totalRecaudadoSector=0;
            for (int j=0;j<vehiculosXSector;j++){
                if(lugares[i][j]!=null){
                    totalRecaudadoSector+=lugares[i][j].getCantidadDeHoraasEstacionado()*this.costoXHora;
                }                                            
            }
            if(totalRecaudadoSector>maxRecaudacion){
                maxRecaudacion=totalRecaudadoSector;
                maxSector=i;
            }
        }             
        return maxSector;    
    }
    
    public String toString(){
        String aux= "Estacionamiento: "+this.direccion+" costo por hora: "+this.costoXHora+"\n";
        
        for (int i=0;i<sectores;i++){
            for (int j=0;j< vehiculosXSector;j++){
                if(lugares[i][j]!=null){
                    aux+=lugares[i][j].toString();
                }
                
            }
        }
        return aux;
    }
    
}
