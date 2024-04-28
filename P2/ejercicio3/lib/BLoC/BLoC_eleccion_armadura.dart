import 'package:ejercicio3/BLoC/PaginaLista.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:ejercicio3/BLoC/paginapersonajefinal.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';

void buttonPressed(
    BuildContext context, String buttonText, PersonajeBuilder personaje) {
  if (buttonText == "Armadura Fuego") {
    Armadura armadura = ArmaduraSimple("ArmaduraBasica");
    Armadura armaduraFuego = FuegoDecorador(armadura);

    personaje.setArmadura(armaduraFuego);
    PaginaLista().agregarPersonaje(personaje);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PaginaLista();
    }));
  } else if (buttonText == "Armadura Planta") {
    Armadura armadura = ArmaduraSimple("ArmaduraBasica");
    Armadura armaduraPlanta = PlantaDecorador(armadura);

    personaje.setArmadura(armaduraPlanta);
    PaginaLista().agregarPersonaje(personaje);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PaginaLista();
    }));
  }
    else{
      Armadura armadura = ArmaduraSimple("ArmaduraBasica");
      

      personaje.setArmadura(armadura);
      PaginaLista().agregarPersonaje(personaje);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PaginaLista();   
      }
      ));
  }
}
Widget buildButton(BuildContext context, String buttonText, String imageRoute,
    PersonajeBuilder personaje) {
  return Flexible(
    child: InkWell(
      onTap: () {
        buttonPressed(context, buttonText, personaje);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.white, width: 3.0)),
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
                child: Text(
                  buttonText,
                  style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "FuenteTitulo"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
