import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/modelo/armadura.dart';

class GuerreroBuilder extends PersonajeBuilder {
  @override
  void addArmadura() {
    super.personaje?.armadura = ArmaduraSimple("Armadura Básica");
  }

  @override
  void addHabilidad() {
    super.personaje?.habilidad = "Lucha";
  }

  @override
  void addArma() {
    super.personaje?.arma = "Espada";
  }

  @override
  void setArmadura(Armadura armadura) {
    super.personaje?.armadura = armadura;
  }

  @override
  Armadura? getArmadura() {
    return super.personaje?.armadura;
  }
}
