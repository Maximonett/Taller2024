/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialpsicologo1;

/**
 1) Un psicólogo necesita un sistema para organizar su agenda semanal. 
El sistema mantiene para c/u de los 5 días de atención y c/u de los 6 turnos 
(horarios) del día, la información del paciente que tomó el turno. De 
los pacientes guarda: nombre, si tiene obra social y costo a abonar por 
la sesión.
a)Genere las clases necesarias. Implemente constructores para iniciar: 
el sistema sin pacientes; los pacientes a partir de toda su información.
b)Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el 
paciente tiene agendado un turno ese día. Asuma que D es válido.
C) Realice un programa que instancie el sistema. Cargue varios 
pacientes al sistema. Libere turnos agendados. Para finalizar, 
imprima el resultado del inciso b-.iii
 * 
 * 
 * @author maximosimonetti
 */
public class ParcialPsicologo1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    Paciente p1=new Paciente("Juan", true, 2000);
    Paciente p2=new Paciente("Maria", false, 5000);
    
    
    
    SistemaTurnos st=new SistemaTurnos(5, 6);
    
    st.agendarPaciente(3, 2, p2);
    st.agendarPaciente(1, 4, p1);
    
    st.tieneTurno(3, "Maria");
    
    st.tieneTurno(1, "Juan");
    
    st.liberarTurnos("Juan");
    
    
    
    st.tieneTurno(1, "Juan");
    
    }
    
}
