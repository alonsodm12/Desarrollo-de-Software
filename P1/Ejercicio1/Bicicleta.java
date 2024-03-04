package Ejercicio1;

/*
 * Bicicleta
 */
public abstract class Bicicleta {

    
    private int identificador;
    
    Bicicleta(int identificador){
        this.identificador=identificador;
    }
    public abstract Bicicleta crearBicicleta();
}
