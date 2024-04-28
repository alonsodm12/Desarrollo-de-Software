/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicio4;

/**
 *
 * @author jaime
 */
public class FiltroRepercutirRozamiento implements Filtro {
    private static final double ROZAMIENTO = -1; // Valor constante de rozamiento

    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
        // Aplicar el rozamiento y devolver las revoluciones actualizadas
        revoluciones = revoluciones + ROZAMIENTO;
        if (revoluciones < 0) {
            revoluciones = 0;
        }
        return revoluciones;
    }
}
