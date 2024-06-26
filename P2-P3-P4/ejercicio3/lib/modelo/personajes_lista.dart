import 'package:ejercicio3/modelo/personaje.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PersonajeLista {
  
  static final PersonajeLista singleton = PersonajeLista._internal();
  List<Personaje> personajes = [];
  final String apiUrl = "http://localhost:3000/personajes";

  factory PersonajeLista() {
    return singleton;
  }

  PersonajeLista._internal();

  Future<void> cargarPersonaje(String usuario) async{
    final response = await http.get(Uri.parse('$apiUrl?usuario=$usuario'));
    if (response.statusCode == 200){
      List<dynamic> personajesJson = json.decode(response.body);

      personajes.clear();
      personajes.addAll(personajesJson.map((json) => Personaje.fromJson(json)).toList());
    } else {
      throw Exception('Failed to load task');
    }
  }

  Future<void>agregar(Personaje personaje) async{
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"personaje": personaje.toJson()}),
    );

    if(response.statusCode == 201){
      personajes.add(Personaje.fromJson(json.decode(response.body)));
    } else {
      throw Exception('Failed to add task: ${response.body}');
    }
  }

  Future<void> eliminar(Personaje personaje) async{
    final response = await http.delete(
      Uri.parse('$apiUrl/${personaje.id}'),
    );
    if(response.statusCode == 200){
      personajes.removeWhere((t) => t.id == personaje.id);
    } else {
      throw Exception('Failed to load task');
    }
  }

  Future<void> modificarArmadura(Personaje personaje, Armadura nuevaArmadura) async {
    
    final response = await http.patch(
      Uri.parse('$apiUrl/${personaje.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'personaje': {
          'armadura': nuevaArmadura.toJson(),
        }
      }),
    );

    if(response.statusCode == 200){
      personaje.armadura = nuevaArmadura;
    } else {
      throw Exception('Failed to update task');
    }
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