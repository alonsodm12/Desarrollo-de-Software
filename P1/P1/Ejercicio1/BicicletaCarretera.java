package Ejercicio1;

public class BicicletaCarretera extends Bicicleta{
    static int bicis=0;

    //constructor
    BicicletaCarretera(){
        super(bicis);
        bicis++;
    }
    
}