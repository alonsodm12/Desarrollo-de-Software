package Practica1;
import java.util.*;

public class FactoriaMontaña extends FactoriaCarrerayBicicleta{

    // Constructor
    public FactoriaMontaña() {
        super();
    }

    // Metodo crear Carrera
    @Override
    public Carrera createCarrera() {
        return new CarreraMontaña();
    }

    // Metodo crear Bicicleta
    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaMontaña();
    }

}
