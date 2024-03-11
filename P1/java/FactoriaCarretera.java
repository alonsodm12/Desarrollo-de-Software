package java;
import java.util.*;

public class FactoriaCarretera implements FactoriaCarrerayBicicleta{

    private int numbicis;
    
    // Constructor
    public FactoriaCarretera(int n) {
        super();
        numbicis = n;
        if (n < 0)
            numbicis = 0;
    }

    // Metodo crear Carrera
    @Override
    public Carrera crearCarrera() {
        ArrayList<Bicicleta> bicis = new ArrayList<>();
        for(int i = 0; i < numbicis; i++){
            bicis.add(this.crearBicicleta());
        }
        return new CarreraCarretera(bicis);
    }

    // Metodo crear Bicicleta
    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaCarretera();
    }

}
