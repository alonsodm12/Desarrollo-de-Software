package Ejercicio1;

public class main {

    public static void main() {
        FactoriaCarrerayBicicleta factoriaM = new FactoriaMontaña(10);
        FactoriaCarrerayBicicleta factoriaC = new FactoriaCarretera(10);
        
        Carrera carreraM = factoriaM.crearCarrera();
        Carrera carreraC = factoriaC.crearCarrera();

        carreraM.mostrarCarrera();
        carreraC.mostrarCarrera();
    }
}
