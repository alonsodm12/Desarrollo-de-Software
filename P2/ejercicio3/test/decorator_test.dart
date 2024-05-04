import 'package:flutter_test/flutter_test.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';

void main() {
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
}