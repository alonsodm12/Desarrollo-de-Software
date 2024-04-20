import 'package:flutter/material.dart';
import 'package:ejercicio3/personaje_builder.dart';
import 'package:ejercicio3/guerrero_builder.dart';
import 'package:ejercicio3/director.dart';
import 'package:ejercicio3/mago_builder.dart';
import 'package:ejercicio3/PaginaGuerrero.dart';
import 'package:ejercicio3/paginamagofinal.dart';

class PaginaMago extends StatelessWidget {
  const PaginaMago({Key? key});

  void buttonPressed(BuildContext context, String buttonText) {
    if (buttonText == "Armadura1") {
      PersonajeBuilder personaje = GuerreroBuilder();
      Director director = Director(personaje);
      director.buildPersonaje();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const PaginaGuerrero();
      }));
    } else if (buttonText == "Mago") {
      PersonajeBuilder personaje = MagoBuilder();
      Director director = Director(personaje);
      director.buildPersonaje();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const PaginaMago();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "MAGO",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Fila para la habilidad y el arma
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Contenedor para la habilidad
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 2, // Ancho del borde
                  ),
                ),
                width: 500,
                height: 500,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lightbulb_outline, size: 100),
                    Text("Habilidad del Mago",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              // Contenedor para el arma
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 2, // Ancho del borde
                  ),
                ),
                width: 500,
                height: 500,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lightbulb, size: 100),
                    Text("Arma del Mago",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
          // Opciones para elegir armaduras
          const SizedBox(height: 20),
          const Text(
            "Elige una armadura:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Opción 1
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Color del borde
                        width: 2, // Ancho del borde
                      ),
                    ),
                    width: 300,
                    height: 300,
                    child: Icon(Icons.shield, size: 80),
                  ),
                  const Text("Armadura1", style: TextStyle(fontSize: 18)),
                ],
              ),
              // Opción 2
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Color del borde
                        width: 2, // Ancho del borde
                      ),
                    ),
                    width: 300,
                    height: 300,
                    child: Icon(Icons.shield, size: 80),
                  ),
                  const Text("Armadura2", style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          // Botón para regresar
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Regresar", style: TextStyle(fontSize: 20)),
          ),
          // Botón para ir al final
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const PaginaMagoFinal()), // Navega a PaginaMago
              );
            },
            child: const Text("Final", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
