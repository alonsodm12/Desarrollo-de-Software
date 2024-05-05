import 'package:flutter/material.dart';

Widget buildCharacterImage(String? armadura) {
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
