/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnoatema1_19_10_23;

/**
 *
 * @author maximosimonetti
 */
public class Compra {
    private int numero;
    private String fecha;
    private Producto[] productos;
    private int maxCantidadDeProductos;
    private int cantidadDeProductos=0;

    public Compra(int numero, String fecha, int N) {
        this.numero = numero;
        this.fecha = fecha;
        this.maxCantidadDeProductos = N;
        this.productos=new Producto[N];
        inicializarProductos();
        
    }
    
    public void inicializarProductos(){
        for (int i=0;i<maxCantidadDeProductos;i++){
            productos[i]=null;
        }
    }
    
    public void agregarProducto(Producto unProducto){
        if (getCantidadDeProductos()<getMaxCantidadDeProductos()){
            getProductos()[getCantidadDeProductos()]=unProducto;
            setCantidadDeProductos((getCantidadDeProductos()+1));
        }
    }
    
    public double precioFinalCompra(){
        double monto=0;
        for (int i=0;i<getCantidadDeProductos();i++){
            monto+=getProductos()[i].montoTotal();        
        }
        return monto;
    }
    
    public boolean sePuedePagarEncuotas(){
        boolean si=false;
        if(precioFinalCompra()>100000){
            si=true;
            System.out.println("Se puede abonar en cuotas.");
        }
        
        return si;
    }
    
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Producto[] getProductos() {
        return productos;
    }

    public void setProductos(Producto[] productos) {
        this.productos = productos;
    }

    public int getMaxCantidadDeProductos() {
        return maxCantidadDeProductos;
    }

    public void setMaxCantidadDeProductos(int maxCantidadDeProductos) {
        this.maxCantidadDeProductos = maxCantidadDeProductos;
    }

    public int getCantidadDeProductos() {
        return cantidadDeProductos;
    }

    public void setCantidadDeProductos(int cantidadDeProductos) {
        this.cantidadDeProductos = cantidadDeProductos;
    }

    
/*número, 
/* fecha (día/mes/año), el código, descripción y precio final de cada 
/* producto agregado, y el precio final de la compra.*/
    
    public String toString(){
        String aux="\n Numero: "+getNumero()
                +" fecha: "+getFecha()+"\n"
                +" Precio Final: "+precioFinalCompra()+"\n";
        for (int i=0;i<getCantidadDeProductos();i++){
            if(getProductos()[i]!=null){
                aux+="\n"+getProductos()[i].toString()+"\n";
            }
        }
        return aux;
    }
    
    
}
