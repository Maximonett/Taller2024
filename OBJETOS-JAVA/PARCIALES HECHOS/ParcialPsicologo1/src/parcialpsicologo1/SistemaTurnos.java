/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialpsicologo1;

/**
 *
 * @author maximosimonetti
 */
public class SistemaTurnos {
    private int dia;
    private int horario;
    private Paciente[][] turnos;

    public SistemaTurnos(int dia, int horario) {
        this.dia = dia;
        this.horario = horario;
        this.turnos = new Paciente[dia][horario];
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public int getHorario() {
        return horario;
    }

    public void setHorario(int horario) {
        this.horario = horario;
    }
    
    public void agendarPaciente(int dia,int horario,Paciente P){
        if (dia>=0&& dia<turnos.length && horario>=0 && horario<turnos[dia].length){ 
            if (turnos[dia][horario]==null){
                turnos[dia][horario]=P;
                System.out.println("Paciente agendado");
            }
        }else{
            System.out.println("El turno esta ocupado.");
        }       
    }
    
    public void liberarTurnos(String nombre){
        for (int i=0;i<turnos.length;i++){
            for (int j=0;j<turnos[i].length;j++){
                if (turnos[i][j]!=null){
                   if (turnos[i][j].getNombre().equals(nombre)){
                       turnos[i][j]=null;
                       System.out.println("EL turno del dia "+(i+1)+
                                            " horario "+(j+1)+ " fue liberado para el paciente "+nombre);
                   }
                }                                 
            }
        }
    }
    
    public void tieneTurno(int dia,String nombre){
        for (int j=0;j<turnos[dia].length;j++){
            if (turnos[dia][j]!=null){
                if(turnos[dia][j].getNombre().equals(nombre)){
                    System.out.println("El dia "+dia+" el paciente "+nombre+
                        " tiene el turno en el horario "+(j+1));
                }  
            }else{
                System.out.println("En el horario "+j+" el paciente no tiene turno");
            }
        }        
    }
      
}
