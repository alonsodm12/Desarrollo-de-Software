package Ejercicio1;
import java.util.ArrayList;

/*
 * Carrera
 */
public abstract class Carrera{
    private ArrayList<Bicicleta> bicicletas=new ArrayList<>();

    public abstract Carrera crearCarrera();
}