import 'package:flutter/material.dart';
import 'package:ejercicio3/personaje_builder.dart';
import 'package:ejercicio3/paginapersonajefinal.dart';
import 'package:ejercicio3/armadura.dart';
import 'package:ejercicio3/armadura_simple.dart';
import 'package:ejercicio3/fuego_decorador.dart';
import 'package:ejercicio3/planta_decorador.dart';

class PaginaGuerrero extends StatelessWidget {
  PersonajeBuilder personaje;
  Key? key;
  PaginaGuerrero({this.key, required this.personaje});

  void buttonPressed(BuildContext context, String buttonText) {
    if (buttonText == "Armadura Fuego") {
      Armadura armadura = ArmaduraSimple("ArmaduraBasica");
      Armadura armaduraFuego = FuegoDecorador(armadura);

      personaje.setArmadura(armaduraFuego);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PaginaPersonajeFinal(personaje: personaje);
      }));
    } else if (buttonText == "Armadura Planta") {
      Armadura armadura = ArmaduraSimple("ArmaduraBasica");
      Armadura armaduraPlanta = PlantaDecorador(armadura);

      personaje.setArmadura(armaduraPlanta);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PaginaPersonajeFinal(personaje: personaje);
      }));
    }
  }

  Widget buildButton(
      BuildContext context, String buttonText, String imageRoute) {
    return Flexible(
      child: InkWell(
        onTap: () {
          buttonPressed(context, buttonText);
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
      backgroundColor: Color.fromARGB(255, 144, 18, 18),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "GUERRERO",
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
                    Image(image: AssetImage('../assets/images/Lucha-remove.png'), height: 400, width: 400),
                    Text("Habilidad del Guerrero",
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
                    Image(image: AssetImage('../assets/images/espada-remove.png'), height: 400, width: 400),
                    Text("Arma del Guerrero",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                        ),
                  ],
                ),
              ),
            ],
          ),
          // Opciones para elegir armaduras
          const SizedBox(height: 10),
          const Text(
            "Elige una armadura:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 1),
          // Sección con dos botones para la elección de la armadura.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildButton(context, "Armadura Fuego",
                  '../assets/images/armadura_fuego.jpg'),
              buildButton(context, "Armadura Planta",
                  '../assets/images/armadura_verde.jpg'),
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
          ElevatedButton(
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
    );
  }
}
