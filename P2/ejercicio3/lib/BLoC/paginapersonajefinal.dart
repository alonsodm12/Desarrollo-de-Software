import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';

class PaginaPersonajeFinal extends StatelessWidget {
  final PersonajeBuilder personaje;

  const PaginaPersonajeFinal({Key? key, required this.personaje})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            Image.asset(
                              '../assets/images/gandalf.jpg',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Habilidad: ${personaje.personaje?.getHabilidad()}",
                              style: const TextStyle(
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            Image.asset(
                              '../assets/images/Bola-de-Fuego-remove.png',
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
                              "Arma: ${personaje.personaje?.getArma()}",
                              style: const TextStyle(
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
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
                              "Armadura: ${personaje.personaje?.getArmadura()}",
                              style: const TextStyle(
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            _buildCharacterImage(
                                personaje.personaje?.getArmadura()),
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
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            Image.asset(
                              '../assets/images/sauron.jpg',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Habilidad: ${personaje.personaje?.getHabilidad()}",
                              style: const TextStyle(
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            Image.asset(
                              '../assets/images/Lucha-remove.png',
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
                              "Arma: ${personaje.personaje?.getArma()}",
                              style: const TextStyle(
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            Image.asset(
                              '../assets/images/lanzallamas.png',
                              width: ancho,
                              height: alto,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Armadura: ${personaje.personaje?.getArmadura()}",
                              style: const TextStyle(
                                fontSize: 24, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Negrita
                              ),
                            ),
                            _buildCharacterImage(
                                personaje.personaje?.getArmadura()),
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

  Widget _buildCharacterImage(String? armadura) {
    double ancho = 500, alto = 500;
    switch (armadura) {
      case "Armadura de planta":
        return Image.asset(
          '../assets/images/armadura_verde.jpg',
          width: ancho,
          height: alto,
        );
      case "Armadura de fuego":
        return Image.asset(
          '../assets/images/armadura_fuego.jpg',
          width: ancho,
          height: alto,
        );
      default:
        return Image.asset(
          '../assets/images/basica.png',
          width: ancho,
          height: alto,
        );
    }
  }
}
