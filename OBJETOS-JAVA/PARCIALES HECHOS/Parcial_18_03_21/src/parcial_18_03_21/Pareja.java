/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_18_03_21;

/**
 *
 * @author maximosimonetti
 */
public class Pareja {
    private String estilo;
    private Participante[] pareja;

    public Pareja(String estilo, Participante p1, Participante p2) {
        this.estilo = estilo;
        this.pareja=new Participante[2];
        this.pareja[0]=p1;
        this.pareja[1]=p2;
    }

    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }

    public Participante[] getPareja(){
        return pareja;
    }
    
    public int diferenciaDeEdad(){
        return Math.abs(pareja[0].getEdad()-pareja[1].getEdad());
    }
    
}
