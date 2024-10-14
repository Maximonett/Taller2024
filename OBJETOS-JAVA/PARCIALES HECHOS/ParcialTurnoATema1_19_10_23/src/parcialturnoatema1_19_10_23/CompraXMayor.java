package parcialturnoatema1_19_10_23;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author maximosimonetti
 */
public class CompraXMayor extends Compra{
    private String cuil;
    private String nombre;

    public CompraXMayor(String cuil, String nombre, int numero, String fecha, int N) {
        super(numero, fecha, N);
        this.cuil = cuil;
        this.nombre = nombre;
    }
    
    public void agregarProducto(Producto unProducto){
        int cantidadDeUnidades=0;
        if (getCantidadDeProductos()<getMaxCantidadDeProductos()){
            cantidadDeUnidades=unProducto.getCantidadDeUnidades();
            if (cantidadDeUnidades>6){
                getProductos()[getCantidadDeProductos()]=unProducto;
                setCantidadDeProductos((getCantidadDeProductos()+1));
            }
        }
    }
    
    public double precioFinalCompra(){
        return super.precioFinalCompra()*(1-0.21);
    }
    
    public String getCuil() {
        return cuil;
    }

    public void setCuil(String cuil) {
        this.cuil = cuil;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

   public String toString(){
       return super.toString();
   }

      
       
}
