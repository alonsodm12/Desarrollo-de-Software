import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/BLoC/paginapersonajefinal.dart';
import 'package:ejercicio3/BLoC/BLoCeleccionboton.dart';

class PaginaMago extends StatelessWidget {
  PersonajeBuilder personaje;
  Key? key;
  PaginaMago({this.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/images/fondo.jpg'),
            fit: BoxFit.cover, // Ajusta la imagen para cubrir el fondo
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "MAGO",
                  style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 248, 195, 97),
                      fontFamily: "FuenteTitulo"),
                ),
              ],
            ),
            // Fila para la habilidad y el arma
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Contenedor para la habilidad
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('../assets/images/duro.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white, // Color del borde
                      width: 2, // Ancho del borde
                    ),
                  ),
                  width: 500,
                  height: 500,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image:
                              AssetImage('../assets/images/habilidadmago.jpg'),
                          height: 400,
                          width: 400),
                      Text("HABILIDAD",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "FuenteTitulo")),
                    ],
                  ),
                ),
                // Contenedor para el arma
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('../assets/images/duro.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white, // Color del borde
                      width: 2, // Ancho del borde
                    ),
                  ),
                  width: 500,
                  height: 500,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image:
                              AssetImage('../assets/images/varita-remove.png'),
                          height: 300,
                          width: 300),
                      Text("ARMA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "FuenteTitulo")),
                    ],
                  ),
                ),
              ],
            ),
            // Opciones para elegir armaduras
            const SizedBox(height: 10),
            const Text("Elige una armadura:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "FuenteTitulo")),
            const SizedBox(height: 1),
            // Sección con dos botones para la elección de la armadura.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(context, "Armadura Fuego",
                    '../assets/images/armadura_fuego.jpg', personaje),
                buildButton(context, "Armadura Planta",
                    '../assets/images/armadura_verde.jpg', personaje),
              ],
            ),
            // Botón para regresar
            const SizedBox(height: 10),
            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Regresar", style: TextStyle(fontSize: 20)),
            ),
            // Botón para ir al final
            const SizedBox(height: 10),
            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.yellow,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaginaPersonajeFinal(
                          personaje: personaje)), // Navega a PaginaMago
                );
              },
              child: const Text("Final", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
