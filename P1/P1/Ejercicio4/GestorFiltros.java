/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicio4;

/**
 *
 * @author jaime
 */
public class GestorFiltros {
    private CadenaFiltros cadenaFiltros;

    public GestorFiltros(CadenaFiltros cadenaFiltros) {
        this.cadenaFiltros = cadenaFiltros;
    }

    public void addFiltro(Filtro filtro) {
        cadenaFiltros.addFiltro(filtro);
    }

    public void peticionFiltros(double revoluciones, EstadoMotor estadoMotor) {
        cadenaFiltros.ejecutar(revoluciones, estadoMotor);
    }
}
