package sistemaestanterias;

public class Estanteria {
    private int maxEstantes;
    private Estante[] estanteria;

    public Estanteria(int maxEstantes, int capacidadEstante) {
        this.maxEstantes = maxEstantes;
        this.estanteria = new Estante[maxEstantes];
        for (int i = 0; i < maxEstantes; i++) {
            estanteria[i] = new Estante(capacidadEstante);
        }
    }

    public void almacenarLibro(Libro libro, int numeroEstante) {
        if (numeroEstante >= 0 && numeroEstante < maxEstantes) {
            Estante estante = estanteria[numeroEstante];
            estante.agregarLibro(libro);
            System.out.println("Libro almacenado en el estante " + numeroEstante);
        } else {
            System.out.println("Número de estante inválido.");
        }
    }

    public Libro sacarLibro(int numeroEstante, int posicion) {
        if (numeroEstante >= 0 && numeroEstante < maxEstantes) {
            Estante estante = estanteria[numeroEstante];
            return estante.quitarLibro(posicion);
        } else {
            System.out.println("Número de estante inválido.");
            return null;
        }
    }

    public int calcularEstanteMasPesado() {
        int estanteMasPesado = 0;
        double pesoMaximo = 0;

        for (int i = 0; i < maxEstantes; i++) {
            double pesoEstante = estanteria[i].calcularPesoTotal();
            if (pesoEstante > pesoMaximo) {
                pesoMaximo = pesoEstante;
                estanteMasPesado = i;
            }
        }

        return estanteMasPesado;
    }
}
