import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio3/modelo/personajes_lista.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';
import 'package:ejercicio3/modelo/mago_builder.dart';

void main() {
  
	group('Test Lista de personajes', () {
    
    late PersonajeLista lista;
    PersonajeBuilder personaje = GuerreroBuilder();
    Director director = Director(personaje);

    setUp((){
      director.buildPersonaje("guerrero");
	    lista = PersonajeLista();
		lista.removePersonajes();
    });

    test('Prueba de que los personajes creados se añaden a la lista', () {
      lista.agregarPersonaje(personaje);
      
      expect(lista.personajes.contains(personaje), true);
      lista.eliminarPersonaje(personaje);
    });

    test('Prueba de que los personajes contenidos en la lista se pueden eliminar', () {
      
      lista.agregarPersonaje(personaje);
      lista.eliminarPersonaje(personaje);

      expect(lista.obtenerCantidadPersonajes(), 0);
    });

    /* test('Prueba de que a una lista solo se pueden añadir objetos Personaje', () {
      var objetoNoPersonaje = 'No soy un personaje';

      expect(() => lista.agregarPersonaje(objetoNoPersonaje), throwsA(isA<AssertionError>()));
    }); */
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
			
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura de fuego');
		});

		test('Prueba para comprobar que si asignamos una armadura y luego la cambiamos se refleja en el personaje.', (){
			
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura de fuego');

			personajeguerrero.setArmadura(armaduraPlanta);
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura de planta');
		});

		test('Comprobar que cuando creo una armadura el dar aparienza funciona a corde a dicho objeto.', (){
			expect(armaduraPlanta.darApariencia(), 'Armadura de planta');
			expect(armaduraFuego.darApariencia(), 'Armadura de fuego');
		});

		/* test('Comprobar que si al set armadura se le pasa un objeto por parámetro que no es armadura da error.', (){
			var noArmadura = 'no armadura';

			expect(() => personajeguerrero.setArmadura(noArmadura), throwsA(isA<AssertionError>()));
		}); */
	});

  group('Test Patron Builder', () {

		late PersonajeBuilder personajeguerrero;
		late PersonajeBuilder personajemago;

    setUp((){
      personajeguerrero = GuerreroBuilder();
      personajemago = MagoBuilder();
    });

		test('Comprobar que si creamos un personaje, se crea con sus características', (){
			Director director = Director(personajeguerrero);
    	director.buildPersonaje("guerrero");

			expect(personajeguerrero.personaje?.getArma(), 'Espada');
			expect(personajeguerrero.personaje?.getArmadura(), 'Armadura Básica');
			expect(personajeguerrero.personaje?.getHabilidad(), 'Lucha');
		});

		test('Comprobar que si usamos mostrar personaje sin crearlo con el director nos da error.', (){
			expect(personajeguerrero.personaje?.mostrarPersonaje(), null);
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

			expect(personajemago.personaje?.mostrarPersonaje(), 'Armadura: Armadura de planta, Arma: Varita mágica, Habilidad: Magía');
		});
	});
}