/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialalumnos;

/**
 *
 * @author maximosimonetti
 */
public class AlumnoDeDoctorado extends Alumno {
    private String tituloUniversitario;
    private String universidadDeOrigen;

    public AlumnoDeDoctorado(String tituloUniversitario, String universidadDeOrigen, String dni, String nombre, int N) {
        super(dni, nombre, N);
        this.tituloUniversitario = tituloUniversitario;
        this.universidadDeOrigen = universidadDeOrigen;
    }
    
    public boolean estaGraduado(int N){
        return  super.estaGraduado(N);
    }
    
    
    public void agregarMaterias(Materia unaMateria){
        super.agregarMaterias(unaMateria);
    }
    
    public String getTituloUniversitario() {
        return tituloUniversitario;
    }

    public void setTituloUniversitario(String tituloUniversitario) {
        this.tituloUniversitario = tituloUniversitario;
    }

    public String getUniversidadDeOrigen() {
        return universidadDeOrigen;
    }

    public void setUniversidadDeOrigen(String universidadDeOrigen) {
        this.universidadDeOrigen = universidadDeOrigen;
    }
    
    public String toString(){
        String aux="Alumno de Doctorado "+super.getNombre()+" DNI: "+super.getDni()
                +" Materias aprobadas: \n";
                for (int i=0;i<super.getCantidadDeMateriasAprobadas();i++){
                    if(super.getMateriasAprobadas()[i]!=null){
                        aux+= "Materia: "+super.getMateriasAprobadas()[i].getNombre()
                                +" Nota: "+super.getMateriasAprobadas()[i].getNota()
                                +" Fecha: "+super.getMateriasAprobadas()[i].getFecha()
                                +" Titulo: "+this.tituloUniversitario
                                +" Universidad de Origen: "+this.universidadDeOrigen+"\n";
                    }                                                                                            
                }
        return aux;
    }
}
