/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoatema1_19_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Producto {
    private int codigo;
    private String descripcion;
    private double precioXUnidad;
    private int cantidadDeUnidades;

    public Producto(int codigo, String descripcion, double precioXUnidad, int cantidadDeUnidades) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.precioXUnidad = precioXUnidad;
        this.cantidadDeUnidades = cantidadDeUnidades;
    }
    
    public double montoTotal(){
        return getPrecioXUnidad()*getCantidadDeUnidades();
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecioXUnidad() {
        return precioXUnidad;
    }

    public void setPrecioXUnidad(double precioXUnidad) {
        this.precioXUnidad = precioXUnidad;
    }

    public int getCantidadDeUnidades() {
        return cantidadDeUnidades;
    }

    public void setCantidadDeUnidades(int cantidadDeUnidades) {
        this.cantidadDeUnidades = cantidadDeUnidades;
    }
    
    public String toString(){
        return "\n Codigo: "+getCodigo()+" Descripcion: "+getDescripcion()
                +" Precio Final de cada producto: "+montoTotal()+"\n";
    }
    
}
