/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica2;

/*Implemente un programa que cargue un vector con a lo sumo 20 partidos 
disputados en el campeonato. La información de cada partido se lee desde 
teclado hasta ingresar uno con nombre de visitante “ZZZ” o alcanzar los 20 partidos. 
Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo: 
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.

*/

/**
 *
 * @author maximosimonetti
 */
import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio5 {
    public static void main(String[] args) {
        
       Partido[] vPartido= new Partido[20];
       
       String[] locales = {                     
            "Racing",       
            "Vélez",      
            "Argentinos",
            "Estudiantes",
            "Boca"  
        };  

       String[] visitantes = {
            "River",          
            "Independiente",  
            "San Lorenzo",       
            "ZZZ",                
            "Gimnasia"
        };
       
       String local;
       String visitante;
       int golesVisitantes=0;
       int golesLocal=0;
       int cantidadPartidos=0;
       
       //Inicializar el vector de partidos
       
       for (int i=0;i<20;i++)
       {
           vPartido[i]=null;
       }
       
       //Cargar Partido             
       
       while (cantidadPartidos<20)
       {
            
           local=locales[GeneradorAleatorio.generarInt(locales.length)];
           visitante=visitantes[GeneradorAleatorio.generarInt(visitantes.length)];
           if (!visitante.equals("ZZZ"))
           {
                golesLocal=GeneradorAleatorio.generarInt(10);
                golesVisitantes=GeneradorAleatorio.generarInt(10);
           
                vPartido[cantidadPartidos]=new Partido();
                vPartido[cantidadPartidos].setLocal(local);
                vPartido[cantidadPartidos].setVisitante(visitante);
                vPartido[cantidadPartidos].setGolesLocal(golesLocal);
                vPartido[cantidadPartidos].setGolesVisitante(golesVisitantes);           
           
                cantidadPartidos++; 
           }else
           {
               System.out.println("Se ha terminado el programa-");                
           }                                     
           
       }
       
        System.out.println("Carga completa");
        System.out.println("La cantida de Partidos es: "+cantidadPartidos);
        
        //Mostrar Partidos
        
        for (int j=0;j<cantidadPartidos;j++)
        {
            Partido partido=vPartido[j];
            if (partido!=null)
            {
                System.out.println("Equipo Local: "+partido.getLocal()+" GOLES: "+partido.getGolesLocal()
                                   +" VS "+" Equipo Visitante: "+partido.getVisitante()+" GOLES: "+partido.getGolesVisitante());
            }else
                {
                    System.out.println("No se han jugado partidos.");
                }
        }
        
        //RESULTADOS 
        int contar = 0;
        int goles = 0;
        for (int i = 0; i < cantidadPartidos; i++) {
            
            Partido partido = vPartido[i]; //esto me cuesta!!!!!!  
            
            
            if (partido != null) {
                if (partido.getLocal().equals("Boca")) {
                    goles += partido.getGolesLocal();
                }
                if (partido.getGanador().equals("River")) {
                    contar++;
                }
            }
        }
        
        System.out.println("River ganó " + contar + " partidos.");
        System.out.println("Boca hizo " + goles + " goles de local.");
        
    
    }
    
    


    
}


