/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package serviciometeorologico;

/**
 *
 * @author maximosimonetti
 */
public class Estacion {
    private String nombre;
    private String latitud;
    private String longitud;
    private int añoA;
    private int cantidaDeAñosN;
    private Temperatura[][] registro;
    

    public Estacion(String nombre, String latitud, String longitud, int añoA, int cantidaDeAñosN) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.añoA =2020;
        this.cantidaDeAñosN = cantidaDeAñosN;
        this.registro=new Temperatura[12][cantidaDeAñosN];
        inicializarMatriz();
    }
    
    public void inicializarMatriz(){
        for (int i=0;i<12;i++){
            for (int j=0;j<cantidaDeAñosN;j++){
                registro[i][j]=new Temperatura();
                registro[i][j].setTemperatura(Double.MAX_VALUE);
            }
        }
    }
    
    
    public void registrarTemperatura(int mes, int año, double temp){
        int indiceAño=año-añoA;
        
        if (mes>=0 && mes <12 && indiceAño>=0 && indiceAño<cantidaDeAñosN){
            
            if (registro[mes][indiceAño]==null){
                registro[mes][indiceAño]=new Temperatura();                                
            }
            
            registro[mes][indiceAño].setTemperatura(temp);
        }else{
            System.out.println("ERROR, mes o año fuera de rango");
        }                            
    }
    
    public double obtenerTemperatura(int mes,int año){
        int indice=año-añoA;
        if (mes>=0 && mes<12 && indice>=0 && indice<cantidaDeAñosN){
            if (registro[mes][indice]!= null){
                return registro[mes][indice].getTemperatura();       
            }else{
            System.out.println("No hay temeperatura registrada para ese mes y año.");
            return Double.MAX_VALUE;            
            }
        }else{
            System.out.println("ERROR, mes y año fuera de rango.");
            return Double.MAX_VALUE;
        }
        
    }
    // esta inicializado en mayor value esto no me va a dar siempre este valor?
    
    public String mayorTemperatura(){
        double maxTemperatura=-1;
        int maxMes=-1;
        int maxAño=-1;
        for (int i=0;i<12;i++){
            for (int j=0;j<cantidaDeAñosN;j++){
                if (registro !=null && registro[i][j].getTemperatura()>maxTemperatura){
                    maxTemperatura=registro[i][j].getTemperatura();
                    maxMes=i;
                    maxAño=j;
                }
            }        
        }
                              
        return "En el mes " +(maxMes+1) +" y el año "+(maxAño+añoA)+
                " se registro el mayor promedio de temperatura de " +maxTemperatura+" ºC. ";
    }
    
    public String promedioPorAños() {
    String resultado = nombre + " (" + latitud + " - " + longitud + "):\n";

    for (int j = 0; j < cantidaDeAñosN; j++) {
        double suma = 0;
        int contador = 0;

        for (int i = 0; i < 12; i++) {
            double temperatura = registro[i][j].getTemperatura();
            if (temperatura != Double.MAX_VALUE) {  // Excluir temperaturas no registradas
                suma += temperatura;
                contador++;
            }
        }

        if (contador > 0) {
            double promedio = suma / contador;
            resultado += "- Año " + (añoA + j) + ": " + String.format("%.1f", promedio) + " ºC\n";
        } else {
            resultado += "- Año " + (añoA + j) + ": Sin registros\n";
        }
    }

    return resultado;
}

    
    
    public String promedioPorMeses() {
    String resultado = nombre + " (" + latitud + " - " + longitud + "):\n";

    for (int i = 0; i < 12; i++) {
        double suma = 0;
        int contador = 0;

        for (int j = 0; j < cantidaDeAñosN; j++) {
            double temperatura = registro[i][j].getTemperatura();
            if (temperatura != Double.MAX_VALUE) {  // Excluir temperaturas no registradas
                suma += temperatura;
                contador++;
            }
        }

        if (contador > 0) {
            double promedio = suma / contador;
            resultado += "- " + mesNombre(i) + ": " + String.format("%.1f", promedio) + " ºC\n";
        } else {
            resultado += "- " + mesNombre(i) + ": Sin registros\n";
        }
    }

    return resultado;
}

// Método auxiliar para obtener el nombre del mes
private String mesNombre(int mes) {
    String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", 
                      "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
    return meses[mes];
}

    
}
