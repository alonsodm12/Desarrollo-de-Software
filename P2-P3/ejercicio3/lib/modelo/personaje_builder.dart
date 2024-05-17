import 'package:ejercicio3/modelo/personaje.dart';
import 'package:ejercicio3/modelo/armadura.dart';

abstract class PersonajeBuilder {
  // La interrogación es para que el atributo pueda ser null
  Personaje? personaje;
  
  String? usuario;

  PersonajeBuilder() {
    personaje = null;
  }

  void createNewPersonaje(String? tipoPersonaje) {
    personaje = Personaje();
    personaje!.tipoPersonaje = tipoPersonaje;
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
