package Ejercicio1;
import java.util.*;

public class FactoriaCarretera implements FactoriaCarrerayBicicleta{

    // Constructor
    public FactoriaCarretera() {
        super();
    }

    // Metodo crear Carrera
    /* @Override
    public Carrera createCarrera() {
        return new CarreraCarretera();
    } */

    // Metodo crear Carrera
    //Jaime
    @Override
    public Carrera crearCarrera() {
        return new CarreraCarretera();
    }

    // Metodo crear Bicicleta
    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaCarretera();
    }

}
