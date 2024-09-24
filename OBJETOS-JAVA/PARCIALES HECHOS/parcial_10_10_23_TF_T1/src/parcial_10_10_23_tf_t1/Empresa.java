/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial_10_10_23_tf_t1;

/**
 *
 * @author maximosimonetti
 */
public class Empresa {
    private String nombre;
    private String direccion;
    private Director director; 
    private int N;
    Encargado[] sucursales;

    public Empresa(String nombre, String direccion, Director director, int N) {
        this.sucursales = new Encargado[N];
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
    }

    public Empresa() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public Encargado[] getSucursales() {
        return sucursales;
    }

    public void setSucursales(Encargado[] sucursales) {
        this.sucursales = sucursales;
    }
    
    //Inciso 1
    
    public void cargarEncargado(int X,Encargado encargado){
        if(X>=0 && X<N){
            sucursales[X]=encargado;
            System.out.println("Encargado asignado a la sucursal "+ X);
        }else{
            System.out.println("Error: la sucursal "+ X+ " esta fuera del rango valido");
        }
        
    }
    
    public String toString(){
        String aux="Nombre "+ this.getNombre()+" Direccion: "+this.getDireccion()+" Director: "+director.toString()
                + " Encargados: \n";
                    
                    for (int i=0;i<N;i++){
                        aux+= " Sucursal " + i + " : ";
                        if (sucursales[i]!=null){
                            aux+=sucursales[i]+"\n";
                        }else{
                            aux+="Sin encargado\n";
                        }

                    }

        return aux;                              
        
    }
    
}
