package ejercicio6;

public class Ejercicio6 {
    public static void main(String[] args) {
        // Crear estación La Plata
        Estacion laPlata = new Estacion("La Plata", "-34.921", "-57.955", 2021, 3);
        
        // Cargar temperaturas para 3 años consecutivos a partir de 2021
        for (int año = 2021; año <= 2023; año++) {
            for (int mes = 1; mes <= 12; mes++) {
                laPlata.registrarTemperatura(año, mes, Math.random() * 30); // Ejemplo de carga de datos
            }
        }
        
        // Reportar promedios anuales y mayor temperatura
        System.out.println(laPlata.reportarPromedioAnual());
        System.out.println(laPlata.mesAñoMayorTemperatura());
        
        // Crear estación Mar del Plata
        Estacion marDelPlata = new Estacion("Mar del Plata", "-38.002", "-57.556", 2020, 4);
        
        // Cargar temperaturas para 4 años consecutivos a partir de 2020
        for (int año = 2020; año <= 2023; año++) {
            for (int mes = 1; mes <= 12; mes++) {
                marDelPlata.registrarTemperatura(año, mes, Math.random() * 30); // Ejemplo de carga de datos
            }
        }
        
        // Reportar promedios mensuales y mayor temperatura
        System.out.println(marDelPlata.reportarPromedioMensual());
        System.out.println(marDelPlata.mesAñoMayorTemperatura());
    }
}
