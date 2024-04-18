import 'package:ejercicio3/armadura_simple.dart';
import 'package:ejercicio3/personaje_builder.dart';
import 'package:ejercicio3/armadura.dart';

class MagoBuilder extends PersonajeBuilder{

  @override
  void addArmadura(){
    super.personaje?.armadura = ArmaduraSimple("Armadura Básica");
  }

  @override
  void addHabilidad(){
    super.personaje?.habilidad = "Magía";
  }

  @override
  void addArma(){
    super.personaje?.arma = "Barita mágica";
  }

  void setArmadura(Armadura armadura){
    super.personaje?.armadura = armadura;
  }

  Armadura? getArmadura(){
    return super.personaje?.armadura;
  }
}