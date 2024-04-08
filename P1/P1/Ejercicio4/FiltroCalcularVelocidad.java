/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicio4;

/**
 *
 * @author jaime
 */
public class FiltroCalcularVelocidad implements Filtro {
    private double incrementoVelocidad;
    //private static final double RADIO_EJE = 0.15; // Radio del eje en metros

    public FiltroCalcularVelocidad(double incrementoVelocidad) {
        this.incrementoVelocidad = incrementoVelocidad;
    }


    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
        switch (estadoMotor) {
            case APAGADO:
            case ENCENDIDO:
                incrementoVelocidad = 0;
                break;
            case ACELERANDO:
                incrementoVelocidad = 100;
                break;
            case FRENANDO:
                incrementoVelocidad = -100;
                break;
            default:
                break;
        }

        // Aplicar incremento de velocidad y asegurarse de que no exceda el máximo
        revoluciones += incrementoVelocidad;
        if (revoluciones > 5000) {
            revoluciones = 5000;
        }

        return revoluciones;
    }
}
