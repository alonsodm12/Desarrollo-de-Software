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

  group('Test Patron Decorator', () {

		PersonajeBuilder personajeguerrero = GuerreroBuilder();

		Armadura armadura = ArmaduraSimple("ArmaduraBasica");
		Armadura armaduraFuego = FuegoDecorador(armadura);

		Armadura armadura2 = ArmaduraSimple("ArmaduraBasica");
		Armadura armaduraPlanta = PlantaDecorador(armadura2);


		setUp((){
			Director director = Director(personajeguerrero);
			director.buildPersonaje("guerrero");

			personajeguerrero.setArmadura(armaduraFuego);
		});
		
		test('Comprobar que la armadura que elige el usuario se crea y se le aigna dinamicamente al personaje.', (){
			
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura de Fuego');
		});

		test('Prueba para comprobar que si asignamos una armadura y luego la cambiamos se refleja en el personaje.', (){
			
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura de Fuego');

			personajeguerrero.setArmadura(armaduraPlanta);
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura de Planta');
		});

		test('Comprobar que cuando creo una armadura el dar aparienza funciona a corde a dicho objeto.', (){
			expect(armaduraPlanta.darApariencia(), 'Armadura de Planta');
			expect(armaduraFuego.darApariencia(), 'Armadura de Fuego');
		});

		test('Comprobar que si al set armadura se le pasa un objeto por parámetro que no es armadura da error.', (){
			var noArmadura = 'no armadura';

			expect(() => personajeguerrero.setArmadura(noArmadura), throwsA(isA<AssertionError>()));
		});
	});

  group('Test Patron Builder', () {

		PersonajeBuilder personajeguerrero = GuerreroBuilder();
		PersonajeBuilder personajemago = MagoBuilder();

		test('Comprobar que si creamos un personaje, se crea con sus características', (){
			Director director = Director(personajeguerrero);
    	director.buildPersonaje("guerrero");

			expect(personajeguerrero.personaje?.getArma(), 'Espada');
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura Básica');
			expect(personajeguerrero.personaje?.getHabilidad(), 'Lucha');
		});

		test('Comprobar que si usamos mostrar personaje sin crearlo con el director nos da error.', (){
			expect(personajeguerrero.personaje?.mostrarPersonaje(), 'El personaje no se ha creado correctamente.');
		});

		test('Prueba para comprobar que el personaje final se crea correctamente', (){
			Director directorGuerrero = Director(personajeguerrero);
    	directorGuerrero.buildPersonaje("guerrero");

			Armadura armadura = ArmaduraSimple("ArmaduraBasica");
			Armadura armaduraFuego = FuegoDecorador(armadura);

			personajeguerrero.setArmadura(armaduraFuego);

			expect(personajeguerrero.personaje?.mostrarPersonaje(), 'Armadura: Armadura de fuego, Arma: Espada, Habilidad: Lucha');

			Director directorMago = Director(personajemago);
    		directorMago.buildPersonaje("mago");

			Armadura armadura2 = ArmaduraSimple("ArmaduraBasica");
			Armadura armaduraPlanta = PlantaDecorador(armadura2);

			personajemago.setArmadura(armaduraPlanta);

			expect(personajemago.personaje?.mostrarPersonaje(), 'Armadura: Armadura de planta, Arma: Varita, Habilidad: Magía');
		});

    test('Comprobamos que director es el que construye el personaje', (){
      
    });
	});
}