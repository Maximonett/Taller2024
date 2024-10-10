/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoatema1_10_1023;

/**
 *
 * @author maximosimonetti
 */
public class CompraXmayor extends Compra {
    private String cuil;
    private String nombreCliente;

    public CompraXmayor(String cuil, String nombreCliente, int numeroCompra, String fecha, int N) {
        super(numeroCompra, fecha, N);
        this.cuil = cuil;
        this.nombreCliente = nombreCliente;
    }

    public String getCuil() {
        return cuil;
    }

    public void setCuil(String cuil) {
        this.cuil = cuil;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }
    
    public void agregarProducto(Producto unProducto){
        if (super.getCantidadDeProductos()<super.getMaxCantidadProductos()){
            if(unProducto.getCantidadDeUnidades()>=6){
                getProductos()[super.getCantidadDeProductos()]=unProducto;
                super.setCantidadDeProductos(getCantidadDeProductos()+1);
            }else{
                System.out.println("El producto no posee 6 o mas unidades.");
            }
        }else{
        }    
    }
    
    public double precioFinalXCompra(){        
        double montoFinal=0;
        for(int i=0;i<super.getCantidadDeProductos();i++){
            Producto[] productos=getProductos();
            montoFinal+=productos[i].getCantidadDeUnidades()*productos[i].getPrecioXUnidad();
        }
        
        return (montoFinal-(montoFinal*0.21));
    }
    
    public String toString(){
        String aux=super.toString();
        return aux;
    }
    
    public boolean esAbonableEnCuotas(){
        return super.esAbonableEnCuotas();
    }
}
