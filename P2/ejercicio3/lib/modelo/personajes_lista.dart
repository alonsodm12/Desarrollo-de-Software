import 'package:ejercicio3/modelo/personaje.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';

class PersonajeLista{

  List<PersonajeBuilder> personajes = [];

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
}