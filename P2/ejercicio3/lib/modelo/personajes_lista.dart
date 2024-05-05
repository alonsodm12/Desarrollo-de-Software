import 'package:ejercicio3/modelo/personaje_builder.dart';

class PersonajeLista {
  
  static final PersonajeLista singleton = PersonajeLista._internal();
  List<PersonajeBuilder> personajes = [];

  factory PersonajeLista() {
    return singleton;
  }

  PersonajeLista._internal();

  void agregarPersonaje(PersonajeBuilder personaje) {
    personajes.add(personaje);
  }

  void eliminarPersonaje(PersonajeBuilder personaje) {
    personajes.remove(personaje);
  }

  PersonajeBuilder obtenerPersonajePorIndice(int indice) {
    return personajes[indice];
  }

  int obtenerCantidadPersonajes() {
    return personajes.length;
  }
  void removePersonajes(){
    personajes.removeRange(0, personajes.length);
  }
}