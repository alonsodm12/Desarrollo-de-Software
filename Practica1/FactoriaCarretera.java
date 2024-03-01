package Practica1;
import java.util.*;

public class FactoriaCarrera extends FactoriaCarrerayBicicleta{

    // Constructor
    public FactoriaCarrera() {
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
