package java;
import java.util.ArrayList;

/*
 * Carrera
 */
public abstract class Carrera{
    
    /* ATRIBUTOS */
    
    private ArrayList<Bicicleta> bicicletas=new ArrayList<>();
    private double tasaAbandono;

    /* MÉTODOS */

    public Carrera(ArrayList<Bicicleta> bicis, double abandono){
        bicicletas = bicis;
        tasaAbandono = abandono;
    }

    public void mostrarCarrera(){
        System.out.println("Carrera con: " + bicicletas.size() + " bicicletas");
        System.out.println("Tasa de abandono de: " + tasaAbandono);
    }
}