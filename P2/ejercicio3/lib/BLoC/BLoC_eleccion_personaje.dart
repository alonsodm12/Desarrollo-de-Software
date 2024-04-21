import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/mago_builder.dart';
import 'package:ejercicio3/BLoC/PaginaMago.dart';
import 'package:ejercicio3/BLoC/PaginaGuerrero.dart';

buttonPressed(String buttonText, BuildContext context) {
  if (buttonText == "GUERRERO") {
    PersonajeBuilder personaje = GuerreroBuilder();
    Director director = Director(personaje);
    director.buildPersonaje("guerrero");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PaginaGuerrero(personaje: personaje);
    }));
  } else if (buttonText == "MAGO") {
    PersonajeBuilder personaje = MagoBuilder();
    Director director = Director(personaje);
    director.buildPersonaje("mago");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PaginaMago(personaje: personaje);
    }));
  }
}

Widget buildButton(String buttonText, String imageRoute, BuildContext context) {
  return Flexible(
    child: InkWell(
      onTap: () {
        buttonPressed(buttonText, context);
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
                height: 700, // Altura fija para la imagen
                width: 500,
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
              if (buttonText == "MAGO")
                Container(
                  width: 400,
                  height: 250,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "En los dominios de lo oculto, se alza Aslan."
                    " Con su varita mágica en mano, desata trucos encantadores y "
                    "hechizos devastadores por igual. Su destreza con la varita "
                    "lo convierte en un maestro de la magia, capaz de conjurar "
                    "maravillas y derrotar a sus enemigos con un solo movimiento.",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "FuenteTitulo"),
                    textAlign: TextAlign.justify,
                  ),
                )
              else if (buttonText == "GUERRERO")
                Container(
                  width: 400,
                  height: 250,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "En los campos de batalla ardientes, avanza "
                    "Kael, Su figura imponente "
                    "se destaca contra el resplandor de su arma, una "
                    "espada que danza a su comando. Con mirada fiera y "
                    "determinación inquebrantable, Kael avanza entre las cenizas, "
                    "dejando tras de sí la destrucción de aquellos que osan enfrentarlo.",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "FuenteTitulo"),
                    textAlign: TextAlign.justify,
                  ),
                )
            ],
          ),
        ),
      ),
    ),
  );
}
