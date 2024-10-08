/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialk_081024;

/**
 *
 * @author maximosimonetti
 */
public class ProgramadorLider extends Programador {
    private int antiguedad;
    private int cantProyectosDirigidos;

    public ProgramadorLider(int antiguedad, int cantProyectosDirigidos, String nombre, String dni, double basico, int cantLineasXHora, String lenguajePreferido) {
        super(nombre, dni, basico, cantLineasXHora, lenguajePreferido);
        this.antiguedad = antiguedad;
        this.cantProyectosDirigidos = cantProyectosDirigidos;
    }
    
    public double sueldo(){
        return super.sueldo()+ this.antiguedad*10000.00 + this.cantProyectosDirigidos*20000.00;            
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCantProyectosDirigidos() {
        return cantProyectosDirigidos;
    }

    public void setCantProyectosDirigidos(int cantProyectosDirigidos) {
        this.cantProyectosDirigidos = cantProyectosDirigidos;
    }
    
    
}
