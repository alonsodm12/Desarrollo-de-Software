import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personaje.dart';
import 'package:ejercicio3/BLoC/BLoC_Constructor_Imagen.dart';

class PaginaPersonajeFinal extends StatelessWidget {
  final Personaje personaje;

  const PaginaPersonajeFinal({Key? key, required this.personaje})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    double ancho = 500, alto = 500;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personaje final creado',
          style: TextStyle(
            fontSize: 24, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../assets/images/fondo.jpg'),
            fit: BoxFit.cover, // Ajusta la imagen para cubrir el fondo
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (personaje.getTipoPersonaje() == "mago")
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Mago creado, con las siguientes características:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            Image.asset(
                              '../assets/images/gandalf1.jpg',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Habilidad: ${personaje.getHabilidad()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            Image.asset(
                              '../assets/images/habilidadmago.jpg',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 20), // Espacio entre las dos filas de imágenes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Arma: ${personaje.getArma()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            Image.asset(
                              '../assets/images/varita-remove.png',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Armadura: ${personaje.getArmadura()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            buildCharacterImage(
                                personaje.getArmadura()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              if (personaje.getTipoPersonaje() == "guerrero")
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Guerrero creado, con las siguientes características:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            Image.asset(
                              '../assets/images/sauron1.jpg',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Habilidad: ${personaje.getHabilidad()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            Image.asset(
                              '../assets/images/habilidadGuerrero.jpg',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 20), // Espacio entre las dos filas de imágenes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Arma: ${personaje.getArma()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            Image.asset(
                              '../assets/images/espada.png',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Armadura: ${personaje.getArmadura()}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "FuenteTitulo"
                              ),
                            ),
                            buildCharacterImage(
                                personaje.getArmadura()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
