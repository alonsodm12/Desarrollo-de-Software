import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/modelo/armadura.dart';

class MagoBuilder extends PersonajeBuilder {
  @override
  void addArmadura() {
    super.personaje?.armadura = ArmaduraSimple("Armadura Básica");
  }

  @override
  void addHabilidad() {
    super.personaje?.habilidad = "Magía";
  }

  @override
  void addArma() {
    super.personaje?.arma = "Varita mágica";
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
