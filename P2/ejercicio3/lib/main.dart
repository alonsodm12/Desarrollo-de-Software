import 'package:ejercicio3/fuego_decorador.dart';
import 'package:ejercicio3/personaje_builder.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/guerrero_builder.dart';
import 'package:ejercicio3/director.dart';
import 'package:ejercicio3/armadura.dart';
import 'package:ejercicio3/planta_decorador.dart';
import 'package:ejercicio3/armadura_simple.dart';
import 'package:ejercicio3/mago_builder.dart';
import 'package:ejercicio3/PaginaMago.dart';
import 'package:ejercicio3/PaginaGuerrero.dart';

void main() {
  GuerreroBuilder personajeGuerrero = GuerreroBuilder();
  Director director = Director(personajeGuerrero);
  director.buildPersonaje("Guerrero");
  print(personajeGuerrero.personaje?.mostrarPersonaje());

  Armadura armadura = ArmaduraSimple("ArmaduraBasica");
  Armadura armaduraPlanta = PlantaDecorador(armadura);

  personajeGuerrero.setArmadura(armaduraPlanta);
  print(personajeGuerrero.personaje?.mostrarPersonaje());

  Armadura armadura2 = ArmaduraSimple("ArmaduraBasica");
  Armadura armaduraFuego = FuegoDecorador(armadura2);

  MagoBuilder personajeMago = MagoBuilder();
  Director director2 = Director(personajeMago);
  director2.buildPersonaje("Mago");

  personajeMago.setArmadura(armaduraFuego);
  print(personajeMago.personaje?.mostrarPersonaje());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creador de personajes',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255,
            255), // Hace que el fondo del Scaffold sea transparente
      ),
      home: Scaffold(
        extendBodyBehindAppBar:
            true, // Extiende el fondo detrás de la barra de aplicación
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  '../assets/images/negro.jpg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el fondo
            ),
          ),
          child: const MyHomePage(
              title: 'Creador de Personajes'), // Coloca tu contenido aquí
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Acción que realiza la "card" cuando se hace click sobre ella.
  buttonPressed(String buttonText) {
    if (buttonText == "Guerrero") {
      PersonajeBuilder personaje = GuerreroBuilder();
      Director director = Director(personaje);
      director.buildPersonaje("guerrero");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const PaginaGuerrero();
      }));
    } else if (buttonText == "Mago") {
      PersonajeBuilder personaje = MagoBuilder();
      Director director = Director(personaje);
      director.buildPersonaje("mago");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PaginaMago(personaje: personaje);
      }));
    }
  }

  Widget buildButton(String buttonText, String imageRoute) {
    return Flexible(
      child: InkWell(
        onTap: () {
          buttonPressed(buttonText);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          margin: const EdgeInsets.all(25),
          elevation: 10,
          // Dentro de esta propiedad usamos ClipRRect
          child: ClipRRect(
            // Los bordes del contenido del card se cortan usando BorderRadius
            borderRadius: BorderRadius.circular(30),
            // EL widget hijo que será recortado segun la propiedad anterior
            child: Column(
              children: <Widget>[
                // Usamos el widget Image para mostrar una imagen
                Image.asset(
                  imageRoute, // Ruta de la imagen local
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir el espacio de la Card
                  height: 500, // Altura fija para la imagen
                ),

                // Usamos Container para el contenedor de la descripción
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Column(
          mainAxisSize:
              MainAxisSize.max, // Ajusta el tamaño principal de la columna
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinea la columna en la parte superior
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 80.0),
              child: const Text(
                "CREADOR DE PERSONAJES",
                style: TextStyle(
                  fontSize: 54.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ), // Añade un espacio vertical entre el título y el texto
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Elige tu personaje principal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 42,
            ), // Añade más espacio vertical entre el texto y los botones
            Container(
              padding: const EdgeInsets.all(
                  10), // Ajusta el relleno según lo necesites
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildButton("Mago", '../assets/images/gandalf.jpg'),
                  buildButton("Guerrero", '../assets/images/sauron.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
