package parcial_ventaLoteBarrio;

public class Empresa {
    private String nomBarrio;
    private int cantM; // M = lotes por manzanas
    private int cantN; // N = manzana
    private Lote [][] manzana;

    public Empresa(String nomBarrio, int N, int M) {
        this.nomBarrio = nomBarrio;
        this.cantM = M;
        this.cantN = N;
        this.manzana = new Lote[N][M];
        for(int f=0; f<this.cantN; f++){
            for(int c=0; c<this.cantM; c++){
                this.manzana[f][c] = new Lote();
            }
        }
    }

    public String getNomBarrio() {
        return nomBarrio;
    }

    public void setNomBarrio(String nomBarrio) {
        this.nomBarrio = nomBarrio;
    }
    
    // 2.a
    public void agregarComprador(Comprador C, int X, int Y){
        this.manzana[X-1][Y-1].agregarComprador(C);
    }
    
    // 2.b
    public void incrementarPorcentajePrecioLote (int X, double P){
        for (int i=0; i<this.cantM; i++){
            this.manzana[X-1][i].incrementarPorcentajePrecio(P);
        }
    }
    
    // 2.c
    public double retornarRecaudar (){
        double total = 0;
        for(int f=0; f<this.cantN; f++){
            for(int c=0; c<this.cantM; c++){
                if(this.manzana[f][c] != null){
                    total = total + this.manzana[f][c].getPrecio();
                }
            }
        }
        return total;
    }
    
    public String toString(){
        String aux;
        aux = "Barrio: "+ this.nomBarrio+"\n"+"Recaudacion actual: "+ retornarRecaudar()+"\n";
        for(int f=0; f<this.cantN; f++){
            aux += "Manzana # "+ (f+1) + "\n";
            for(int c=0; c<this.cantM; c++){
                aux += "Lote # "+(c+1)+": " + this.manzana[f][c].toString() +"\n";
            }
        }
        return aux;
    }
}
