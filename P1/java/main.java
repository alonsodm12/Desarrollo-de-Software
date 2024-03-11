package Ejercicio1;

public class main {

    public static void main(String[] args) {
        FactoriaCarrerayBicicleta factoriaM = new FactoriaMontaña(10);
        FactoriaCarrerayBicicleta factoriaC = new FactoriaCarretera(9);
        
        Carrera carreraM = factoriaM.crearCarrera();
        Carrera carreraC = factoriaC.crearCarrera();

        carreraM.mostrarCarrera();
        carreraC.mostrarCarrera();
    }
}
