package Practica1;

/*
 * Bicicleta
 */
public abstract class Bicicleta {

    
    private int identificador;
    //jaime
    Bicicleta(int identificador){
        this.identificador=identificador;
    }
    public abstract Bicicleta crearBicicleta();
}
