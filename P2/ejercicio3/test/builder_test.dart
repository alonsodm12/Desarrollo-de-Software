import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/mago_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';

void main() {
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