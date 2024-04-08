package Ejercicio1;

public class Main {

    public static void main(String[] args) {
        FactoriaCarrerayBicicleta factoriaM = new FactoriaMontaña(10);
        FactoriaCarrerayBicicleta factoriaC = new FactoriaCarretera(10);
        
        Carrera carreraM = factoriaM.crearCarrera();
        Carrera carreraC = factoriaC.crearCarrera();

        carreraM.start();
        carreraC.start();
    }
}
