import 'package:ejercicio3/personaje.dart';
import 'package:ejercicio3/armadura.dart';

abstract class PersonajeBuilder {
  // La interrogación es para que el atributo pueda ser null
  Personaje? personaje;
  String? tipoPersonaje = "";

  PersonajeBuilder() {
    personaje = null;
  }

  void createNewPersonaje(String? tipo_personaje) {
    personaje = Personaje();
    tipoPersonaje = tipo_personaje;
  }

  String? getTipoPersonaje() {
    return tipoPersonaje;
  }

  //MEJORAS
  void setArmadura(Armadura armadura);

  Armadura? getArmadura();

  ////////////////////////

  //Metodo a implementar
  void addArma();

  //Metodo a implementar
  void addArmadura();

  //Metodo a implementar
  void addHabilidad();
}
