/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialenunciado6;

/**
 *
 * @author maximosimonetti
 */
public class Hotel {
    private int N; // Número de pisos
    private int M; // Número de habitaciones por piso
    private Habitacion[][] hotel;

    public Hotel(int N, int M) {
        this.N = N;
        this.M = M;
        this.hotel = new Habitacion[N][M]; // Inicializar el hotel con N pisos y M habitaciones por piso
        // Inicializar las habitaciones con su costo correspondiente
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                hotel[i][j] = new Habitacion(800 + 100 * (i + 1), 0); // Habitaciones desocupadas y con costo
            }
        }
    }

    public void ingresarCliente(Habitacion habitacion, Cliente cliente, int pisoX, int habitacionY) {
        if (!hotel[pisoX][habitacionY].isOcupada()) {
            hotel[pisoX][habitacionY] = habitacion;
            habitacion.setOcupada(true);
            habitacion.setCliente(cliente);
        } else {
            System.out.println("La habitación ya está ocupada.");
        }
    }    
    
    public int calcularPisoMayorRecaudacion(){
        double mayorRecaudacion=0;
        int pisoMayorRecaudacion=-1;
        for (int i=0;i<N;i++){
            double recaudacionPiso=0;  
            for (int j=0;j<M;j++){
                if(hotel[i][j].isOcupada()){
                    recaudacionPiso+=hotel[i][j].getCostoPorDia();
                }           
            }    
            if (recaudacionPiso >mayorRecaudacion){
                mayorRecaudacion=recaudacionPiso;
                pisoMayorRecaudacion=i+1; //se le suma 1 por que el vector inicia en 0
            }
        }
        return pisoMayorRecaudacion;
    }


    public String toString(){
        String aux=""; 
        for (int i=0;i<N;i++){
            for (int j=0;j<M;j++){
                if (!hotel[i][j].isOcupada()){
                    aux += " Piso "+(i+1)+" Habitacion "+(j+1)+" : La habitacion esta libre\n";                    
                }else{
                
                    aux+= " Piso "+(i+1)+" Habitacion "+(j+1)+" : "+" Costo: "+hotel[i][j].getCostoPorDia()
                        +" Cliente: "+hotel[i][j].getCliente().toString()+"\n";
                }
            }    
        }        
    
    
        return aux;
    }



}


