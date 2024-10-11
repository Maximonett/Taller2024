/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialalumnos;

/**
 *
 * @author maximosimonetti
 */
public class AlumnoDeGrado extends Alumno{
    private String carrera;

    public AlumnoDeGrado(String carrera, String dni, String nombre, int N) {
        super(dni, nombre, N);
        this.carrera = carrera;
    }
    
    public boolean estaGraduado(int N){
        return  super.estaGraduado(N);
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
    public void agregarMaterias(Materia unaMateria){
        super.agregarMaterias(unaMateria);
    }
    
    public String toString(){
        String aux="Alumno de Grado "+super.getNombre()+" DNI: "+super.getDni()
                +" Materias aprobadas: \n";
                for (int i=0;i<super.getCantidadDeMateriasAprobadas();i++){
                    if(super.getMateriasAprobadas()[i]!=null){
                        aux+= "Materia: "+super.getMateriasAprobadas()[i].getNombre()
                                +" Nota: "+super.getMateriasAprobadas()[i].getNota()
                                +" Fecha: "+super.getMateriasAprobadas()[i].getFecha()
                                +" Carrera: "+this.carrera+"\n";
                    }                                                                                            
                }
        return aux;
    }
}
