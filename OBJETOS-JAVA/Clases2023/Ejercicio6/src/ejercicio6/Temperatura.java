package ejercicio6;

public class Temperatura {
    private double temperatura;

    // Constructor
    public Temperatura() {
        this.temperatura = Double.MAX_VALUE; // Inicialmente, el valor es muy alto
    }

    // Obtener temperatura
    public double getTemperatura() {
        return temperatura;
    }

    // Establecer temperatura
    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }
}
