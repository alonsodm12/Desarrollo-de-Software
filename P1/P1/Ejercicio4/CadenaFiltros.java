/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejercicio4;

import java.util.ArrayList;
import java.util.List;
 

public class CadenaFiltros {
    private List<Filtro> filtros = new ArrayList<>();
    private Salpicadero salpicadero;

    public CadenaFiltros(Salpicadero salpicadero) {
        this.salpicadero = salpicadero;
    }

    public void addFiltro(Filtro filtro) {
        filtros.add(filtro);
    }
    
    public void cambiarObjetivo(Salpicadero salpicader){
        
        this.salpicadero=salpicadero;
    }

    public void ejecutar(double revoluciones, EstadoMotor estadoMotor) {
            for (Filtro filtro : filtros) {
                revoluciones = filtro.ejecutar(revoluciones, estadoMotor);
            }
            salpicadero.ejecutar(revoluciones, estadoMotor);    
    }
}
