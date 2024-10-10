/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoatema1_10_1023;

/**
 *
 * @author maximosimonetti
 */
public class Compra {
    private int numeroCompra;
    private String fecha;
    private int maxCantidadProductos;
    private int cantidadDeProductos;
    private Producto[] productos;

    public Compra(int numeroCompra, String fecha, int N) {
        this.numeroCompra = numeroCompra;
        this.fecha = fecha;
        this.maxCantidadProductos = N;
        this.cantidadDeProductos=0;
        this.productos=new Producto[N];
        inicializarProductos();
        
    }
        
    
    public void inicializarProductos(){
        for (int i=0;i<maxCantidadProductos;i++){
            productos[i]=null;
        }
    }
    
    
    public void agregarProducto(Producto unProducto){
        if(cantidadDeProductos<maxCantidadProductos){
            productos[cantidadDeProductos]=unProducto;
            cantidadDeProductos++;
        }else{
            System.out.println("No se pueden agregar mas productos a la compra.");
        }
    
    }
    
    public double precioFinalXCompra(){        
        double montoTotal=0;
        for (int i=0;i<cantidadDeProductos;i++){
            montoTotal+=productos[i].getCantidadDeUnidades()*productos[i].getPrecioXUnidad();
        }
        return montoTotal;
    }
    
    
    
    public int getNumeroCompra() {
        return numeroCompra;
    }

    public void setNumeroCompra(int numeroCompra) {
        this.numeroCompra = numeroCompra;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getMaxCantidadProductos() {
        return maxCantidadProductos;
    }

    public void setMaxCantidadProductos(int maxCantidadProductos) {
        this.maxCantidadProductos = maxCantidadProductos;
    }

    public int getCantidadDeProductos() {
        return cantidadDeProductos;
    }

    public void setCantidadDeProductos(int cantidadDeProductos) {
        this.cantidadDeProductos = cantidadDeProductos;
    }

    public Producto[] getProductos() {
        return productos;
    }

    public void setProductos(Producto[] productos) {
        this.productos = productos;
    }
    
    
    public String toString(){
        String aux="Numero de Compra: "+this.numeroCompra+" Fecha: "+this.fecha+"\n";
            for (int i=0;i<cantidadDeProductos;i++){
                
                aux+=" Codigo: "+ productos[i].getCodigo()+" Descripcion: "
                        +productos[i].getDescripcion()
                        +" Precio Final: $"+ productos[i].prcioFinal()+"\n";
            
                
            }
            
            aux+=" Precio Final de la Compra: $"+ this.precioFinalXCompra();
            
        return aux;
    }
    
    public boolean esAbonableEnCuotas(){
        boolean si=false;
        
        if (this.precioFinalXCompra()>100000){
            System.out.println("Si, la compra es abonable en cuotas");
            si=true;
        }else{
            System.out.println("No se puede abonar en cuotas.");      
        }        
        return si;
    }
    
}
