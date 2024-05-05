import 'package:ejercicio3/modelo/armadura.dart';
import 'package:flutter/material.dart';

//Producto final

class Personaje{
  Armadura? armadura;
  String? arma;
  String? habilidad;

  String mostrarPersonaje() {
    if(arma != null && habilidad != null && armadura != null){
      String armaduratxt = armadura!.darApariencia();
      return "Armadura: $armaduratxt, Arma: $arma, Habilidad: $habilidad";
    }
    else {
      return "El personaje no se ha creado correctamente.";
    }
  }

  String getArmadura() {
    String armaduratxt = armadura!.darApariencia();
    return armaduratxt;
  }

  String getArma() {
    return arma!;
  }

  String getHabilidad() {
    return habilidad!;
  }

  Widget mostrarPersonajeWidget() {
    return Column(
      children: [
        Text("Armadura: ${armadura!.darApariencia()}"),
        Text("Arma: $arma"),
        Text("Habilidad: $habilidad"),
      ],
    );
  }
}
