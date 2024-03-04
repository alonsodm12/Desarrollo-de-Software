package Ejercicio1;
import java.util.*;

public class FactoriaMontaña implements FactoriaCarrerayBicicleta{

    // Constructor
    public FactoriaMontaña() {
        super();
    }

    /* // Metodo crear Carrera
    @Override
    public Carrera createCarrera() {
        return new CarreraMontaña();
    } */

    // Metodo crear Carrera
    //Jaime
    @Override
    public Carrera crearCarrera() {
        return new CarreraMontaña();
    }

    // Metodo crear Bicicleta
    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaMontaña();
    }

}
