package parcial_ventaLoteBarrio;

public class Lote {
    private double precio = 50000; 
    private Comprador compra;

    public Lote() {
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public void agregarComprador(Comprador C){
        this.compra = C;
    }
    
    public void incrementarPorcentajePrecio(double P){
        this.precio += this.precio*(1+(P/100.0));
    }
    
    public String toString(){
        String aux;
        aux = "- precio "+ precio + " - Comprador: ";
        if(this.compra != null){
            aux += this.compra.toString();
        } else
            aux += "Disposible para la venta";
        return aux;
    }
}
