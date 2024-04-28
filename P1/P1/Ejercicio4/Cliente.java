/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicio4;

import javax.swing.JFrame;

public class Cliente {
    private GestorFiltros gestorFiltros;

    public Cliente(GestorFiltros gestorFiltros) {
        this.gestorFiltros = gestorFiltros;
    }

    public void enviarPeticion(double revoluciones, EstadoMotor estadoMotor) {
        gestorFiltros.peticionFiltros(revoluciones, estadoMotor);
    }

    public static void main(String[] args) {
        
        // Crear una instancia del salpicadero
        Salpicadero salpicadero = new Salpicadero();
        
        CadenaFiltros cadenaFiltros = new CadenaFiltros(salpicadero);

        
        cadenaFiltros.cambiarObjetivo(salpicadero);
        
        JFrame frame = new JFrame("Salpicadero");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Agregar el salpicadero al marco
        frame.getContentPane().add(salpicadero);

        // Hacer visible el marco
        frame.pack();
        frame.setVisible(true);
        
        FiltroCalcularVelocidad filtroCalcularVelocidad = new FiltroCalcularVelocidad(15);
        FiltroRepercutirRozamiento filtroRepercutirRozamiento = new FiltroRepercutirRozamiento();
        
        GestorFiltros gestorF= new GestorFiltros(cadenaFiltros);
        gestorF.addFiltro(filtroCalcularVelocidad);
        gestorF.addFiltro( filtroRepercutirRozamiento);
        
        Cliente cliente = new Cliente(gestorF);
        cliente.enviarPeticion(0, EstadoMotor.APAGADO);
    
        
    }
}
