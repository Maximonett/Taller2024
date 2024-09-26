package sistemaestanterias;

public class Estante {
    private int maxLugar;
    private Libro[] estante;
    private int indiceEstante = 0;


    public Estante(int maxLugar) {
        this.maxLugar = maxLugar;
        this.estante=new Libro[maxLugar];
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
            Libro libro = estante[posicion];//guardo temporalmente al libro para poder devolverlo
            estante[posicion] = null;
            indiceEstante--;
            return libro;
        } else {
            System.out.println("Posición inválida o ya vacía.");
            return null;
        }
    }

    
    public double calcularPesoTotal(){
        double pesoTotal=0;
        for (int i=0;i<estante.length;i++){
            if (estante[i]!=null){
                pesoTotal+=estante[i].getPeso();
            }
        }
        return pesoTotal;
    }
}
