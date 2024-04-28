package Ejercicio1;
import java.util.ArrayList;
import java.util.Random;
import java.lang.Thread;
 
/*
 * Carrera
 */
public abstract class Carrera extends Thread{
    
    /* ATRIBUTOS */
    
    private ArrayList<Bicicleta> bicicletas=new ArrayList<>();
    private double tasaAbandono;
    private String nombre;

    /* MÉTODOS */

    public Carrera(ArrayList<Bicicleta> bicis, double abandono, String nom){
        bicicletas = bicis;
        tasaAbandono = abandono;
        nombre = nom;
    }

    private void mostrarCarrera(){
        System.out.println("Carrera de " + nombre.toLowerCase() + " con: " + bicicletas.size() + " bicicletas");
        System.out.println("Tasa de abandono de la carrera de " + nombre.toLowerCase() +": " + tasaAbandono);
        System.out.println("INICIO DE LA CARRERA DE " + nombre + "...");
    }

    private void carreraTerminada(){
        System.out.println("...FIN DE LA CARRERA DE " + nombre);
        System.out.println("Han completado la carrera de " + nombre.toLowerCase() +": " + bicicletas.size() + " corredores.");
    }

    private void correrCarrera(){
        int quitar = (int)((double)bicicletas.size() * tasaAbandono);

        for(int i = 0; i < quitar; i++){
            Random random = new Random();
            int bici = random.nextInt(bicicletas.size());
            bicicletas.remove(bici);
        }
    }

    public void run(){
        mostrarCarrera();
        correrCarrera();
        try{
            Thread.sleep(60000);
        }catch(InterruptedException e){
            System.out.println("La carrera de " + nombre.toLowerCase() + " no se ha podido terminar");
        }
        carreraTerminada();
    }
}