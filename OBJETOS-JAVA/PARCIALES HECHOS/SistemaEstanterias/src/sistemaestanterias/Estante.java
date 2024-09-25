package sistemaestanterias;

public class Estante {
    private int maxLugar;
    private Libro[] estante;
    private int indiceEstante = 0;

    public Estante(int capacidad) {
        this.maxLugar = capacidad;
        this.estante = new Libro[capacidad];
    }

    public int getMaxLugar() {
        return maxLugar;
    }

    public int getIndiceEstante() {
        return indiceEstante;
    }

    public boolean estaOcupado(int posicion) {
        return estante[posicion] != null;
    }

    public void agregarLibro(Libro libro) {
        if (indiceEstante < maxLugar) {
            estante[indiceEstante] = libro;
            indiceEstante++;
        } else {
            System.out.println("No hay más lugar en el estante.");
        }
    }

    public Libro quitarLibro(int posicion) {
        if (posicion >= 0 && posicion < maxLugar && estante[posicion] != null) {
            Libro libro = estante[posicion];
            estante[posicion] = null;
            indiceEstante--;
            return libro;
        } else {
            System.out.println("Posición inválida o ya vacía.");
            return null;
        }
    }

    public double calcularPesoTotal() {
        double pesoTotal = 0;
        for (Libro libro : estante) {
            if (libro != null) {
                pesoTotal += libro.getPeso();
            }
        }
        return pesoTotal;
    }
}
