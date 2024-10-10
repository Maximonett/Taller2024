package parcial_ventaLoteBarrio;

public class Comprador {
    private int DNI;
    private String nomCompleto;
    private String ciudad;

    public Comprador(int DNI, String nomCompleto, String ciudad) {
        this.DNI = DNI;
        this.nomCompleto = nomCompleto;
        this.ciudad = ciudad;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNomCompleto() {
        return nomCompleto;
    }

    public void setNomCompleto(String nomCompleto) {
        this.nomCompleto = nomCompleto;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }
    
    public String toString(){
        return "DNI: "+ this.DNI +", nombre y apellido: " + this.nomCompleto + ", ciudad: "+ this.ciudad;
    }
}
