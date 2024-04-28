import 'package:flutter/material.dart';
import 'package:ejercicio3/BLoC/PaginaLista.dart'; // Importa la página de la lista de personajes
import 'package:ejercicio3/modelo/personaje_builder.dart';

import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/mago_builder.dart';
import 'package:ejercicio3/BLoC/PaginaMago.dart';
import 'package:ejercicio3/BLoC/PaginaGuerrero.dart';
import 'package:ejercicio3/BLoC/BLoC_eleccion_personaje.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creador de personajes',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255, 255), // Hace que el fondo del Scaffold sea transparente
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true, // Extiende el fondo detrás de la barra de aplicación
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('../assets/images/fondo.jpg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el fondo
            ),
          ),
          child: const MyHomePage(title: 'Creador de Personajes'), // Coloca tu contenido aquí
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Column(
          mainAxisSize: MainAxisSize.max, // Ajusta el tamaño principal de la columna
          mainAxisAlignment: MainAxisAlignment.start, // Alinea la columna en la parte superior
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 80.0),
              child: const Text(
                "Creador de personajes",
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 195, 97),
                  fontFamily: "FuenteTitulo",
                ),
              ),
            ),
            const SizedBox(height: 26), // Añade un espacio vertical entre el título y el texto
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Elige tu personaje principal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "FuenteTitulo",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),            Container(
              padding: const EdgeInsets.all(
                  10), // Ajusta el relleno según lo necesites
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildButton("MAGO", '../assets/images/gandalf1.jpg', context),
                  buildButton(
                      "GUERRERO", '../assets/images/sauron1.jpg', context),
                ],
              ),
            ), // Añade más espacio vertical entre el texto y los botones
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaLista()));
              },
              child: Text(
                'Ver lista de personajes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
