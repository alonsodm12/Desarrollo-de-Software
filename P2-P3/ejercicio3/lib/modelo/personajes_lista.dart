import 'package:ejercicio3/modelo/personaje.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PersonajeLista {
  
  static final PersonajeLista singleton = PersonajeLista._internal();
  List<Personaje> personajes = [];
  final String apiUrl = "http://localhost:30000/personajes";

  factory PersonajeLista() {
    return singleton;
  }

  PersonajeLista._internal();

  Future<void> agregarPersonaje(Personaje personaje) async{
    final response = await http.get(Uri.parse('$apiUrl?usuario=$usuario'));
  }

  void eliminarPersonaje(Personaje personaje) {
    personajes.remove(personaje);
  }

  Personaje obtenerPersonajePorIndice(int indice) {
    return personajes[indice];
  }

  int obtenerCantidadPersonajes() {
    return personajes.length;
  }
  void removePersonajes(){
    personajes.removeRange(0, personajes.length);
  }
}