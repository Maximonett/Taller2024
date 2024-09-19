package ejercicio6;

public class Estacion {
    private String nombre;
    private String latitud;
    private String longitud;
    private Temperatura[][] temperaturas; // matriz de temperaturas por año y mes
    private int añoInicio;

    // Constructor
    public Estacion(String nombre, String latitud, String longitud, int añoInicio, int numAnios) {
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.añoInicio = añoInicio;
        this.temperaturas = new Temperatura[numAnios][12]; // 12 meses por año
        for (int i = 0; i < numAnios; i++) {
            for (int j = 0; j < 12; j++) {
                this.temperaturas[i][j] = new Temperatura(); // Inicializar con temperaturas altas
            }
        }
    }

    // Métodos getter y setter
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    // Registrar temperatura
    public void registrarTemperatura(int año, int mes, double temperatura) {
        int indexAño = año - añoInicio;
        if (indexAño >= 0 && indexAño < temperaturas.length && mes >= 1 && mes <= 12) {
            this.temperaturas[indexAño][mes - 1].setTemperatura(temperatura);
        }
    }

    // Obtener temperatura
    public double obtenerTemperatura(int año, int mes) {
        int indexAño = año - añoInicio;
        if (indexAño >= 0 && indexAño < temperaturas.length && mes >= 1 && mes <= 12) {
            return this.temperaturas[indexAño][mes - 1].getTemperatura();
        }
        return Double.MAX_VALUE; // Valor muy alto si no se ha registrado temperatura
    }

    /// Reportar promedio anual
    public String reportarPromedioAnual() {
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                          "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        String result = this.nombre + " (" + this.latitud + " - " + this.longitud + "):\n";

        for (int i = 0; i < temperaturas.length; i++) {
            double totalTemperatura = 0;
            int mesesConDatos = 0;
            for (int j = 0; j < 12; j++) {
                double temp = this.temperaturas[i][j].getTemperatura();
                if (temp != Double.MAX_VALUE) {
                    totalTemperatura += temp;
                    mesesConDatos++;
                }
            }
            // Sin operador ternario: usando if-else
            double promedioAnual;
            if (mesesConDatos > 0) {
                promedioAnual = totalTemperatura / mesesConDatos;
            } else {
                promedioAnual = Double.MAX_VALUE;
            }

            result += "- Año " + (añoInicio + i) + ": " + String.format("%.1f", promedioAnual) + " °C;\n";
        }
        return result;
    }

    // Reportar promedio mensual
    public String reportarPromedioMensual() {
        String[] nombresMeses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                                 "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        String result = this.nombre + " (" + this.latitud + " - " + this.longitud + "):\n";

        for (int j = 0; j < 12; j++) {
            double totalTemperatura = 0;
            int añosConDatos = 0;
            for (int i = 0; i < temperaturas.length; i++) {
                double temp = this.temperaturas[i][j].getTemperatura();
                if (temp != Double.MAX_VALUE) {
                    totalTemperatura += temp;
                    añosConDatos++;
                }
            }
            // Sin operador ternario: usando if-else
            double promedioMensual;
            if (añosConDatos > 0) {
                promedioMensual = totalTemperatura / añosConDatos;
            } else {
                promedioMensual = Double.MAX_VALUE;
            }

            result += "- " + nombresMeses[j] + ": " + String.format("%.1f", promedioMensual) + " °C;\n";
        }
        return result;
    }


    // Encontrar mes y año con la mayor temperatura
    public String mesAñoMayorTemperatura() {
        double maxTemp = Double.MIN_VALUE;
        int mesMax = -1, añoMax = -1;

        for (int i = 0; i < temperaturas.length; i++) {
            for (int j = 0; j < 12; j++) {
                double temp = this.temperaturas[i][j].getTemperatura();
                if (temp > maxTemp) {
                    maxTemp = temp;
                    mesMax = j;
                    añoMax = i;
                }
            }
        }
        if (mesMax == -1 || añoMax == -1) {
            return "No se ha registrado ninguna temperatura.";
        }
        String[] nombresMeses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                                 "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        return "Mayor temperatura: " + nombresMeses[mesMax] + " " + (añoInicio + añoMax) + ": " + String.format("%.1f", maxTemp) + " °C";
    }
}
