import 'package:ejercicio3/modelo/armadura.dart';
import 'package:flutter/material.dart';

//Producto final

class Personaje{
  Armadura? armadura;
  String? arma;
  String? habilidad;

  Personaje({this.armadura, this.arma, this.habilidad});

  String mostrarPersonaje() {
    String armaduratxt = armadura!.darApariencia();
    return "Armadura: $armaduratxt, Arma: $arma, Habilidad: $habilidad";
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
