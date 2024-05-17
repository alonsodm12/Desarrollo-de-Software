import 'package:flutter/material.dart';
import 'package:ejercicio3/BLoC/BLoC_eleccion_personaje.dart';

class CrearPersonaje extends StatelessWidget {
  const CrearPersonaje({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/images/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const CrearPersonajeMain(title: 'Creador de Personajes'),
      ),
    );
  }
}

class CrearPersonajeMain extends StatelessWidget {
  const CrearPersonajeMain({Key? key, required this.title}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
