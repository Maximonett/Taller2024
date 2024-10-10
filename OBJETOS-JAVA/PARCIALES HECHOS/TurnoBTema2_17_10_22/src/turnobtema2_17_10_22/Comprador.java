/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package turnobtema2_17_10_22;

/**
 *
 * @author maximosimonetti
 */
public class Comprador {
    private String dni;
    private String nombreYapellido;
    private String ciudad;

    public Comprador(String dni, String nombreYapellido, String ciudad) {
        this.dni = dni;
        this.nombreYapellido = nombreYapellido;
        this.ciudad = ciudad;
    }
                
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombreYapellido() {
        return nombreYapellido;
    }

    public void setNombreYapellido(String nombreYapellido) {
        this.nombreYapellido = nombreYapellido;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    public String toString(){
        return " DNI: "+this.dni+" Nombre y apellido: "+this.nombreYapellido+" Ciudad: "+this.ciudad+"\n";
    }
   
}
