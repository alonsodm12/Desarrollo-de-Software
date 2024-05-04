import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio3/modelo/personajes_lista.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';

void main() {
	group('Test Lista de personajes', () {
    
    PersonajeLista lista = PersonajeLista();
    PersonajeBuilder personaje = GuerreroBuilder();
    Director director = Director(personaje);

    setUp((){
      
      director.buildPersonaje("guerrero");
    });

    test('Prueba de que los personajes creados se añaden a la lista', () {
      lista.agregarPersonaje(personaje);

      expect(lista.personajes.contains(personaje), true);
    });

    test('Prueba de que los personajes contenidos en la lista se pueden eliminar', () {
  
      lista.agregarPersonaje(personaje);
      lista.eliminarPersonaje(personaje);

      expect(lista.personajes.contains(personaje), false);
    });

    test('Prueba de que a una lista solo se pueden añadir objetos Personaje', () {
      var objetoNoPersonaje = 'No soy un personaje';

      expect(() => lista.agregarPersonaje(objetoNoPersonaje), throwsA(isA<AssertionError>()));
    });
	});
}