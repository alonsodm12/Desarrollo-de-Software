import 'package:ejercicio3/armadura.dart';

//Producto final

class Personaje {
  
  Armadura? armadura;
  String? arma;
  String? habilidad;

  Personaje({this.armadura, this.arma, this.habilidad});

  String mostrarPersonaje() {
    String armaduratxt = armadura!.darApariencia();
    return "Armadura: $armaduratxt, Arma: $arma, Habilidad: $habilidad";
  }

}

