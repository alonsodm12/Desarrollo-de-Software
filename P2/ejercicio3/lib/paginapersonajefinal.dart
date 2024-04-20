import 'package:flutter/material.dart';
import 'package:ejercicio3/personaje_builder.dart';

class PaginaPersonajeFinal extends StatelessWidget {
  PersonajeBuilder personaje;
  Key? key;
  PaginaPersonajeFinal({this.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text('Personaje final creado'),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (personaje.getTipoPersonaje() == "mago")
              Column(
                children: [
                  Text(
                    'Mago creado, con las siguientes características:',
                  ),
                  Column(
                    children: [
                      Text("Armadura: ${personaje.personaje?.getArmadura()}"),
                      Text("Arma: ${personaje.personaje?.getArma()}"),
                      Text("Habilidad: ${personaje.personaje?.getHabilidad()}"),
                    ],
                  ),
                  if (personaje.personaje?.getArmadura() ==
                      "Armadura de planta")
                    Image.asset(
                      '../assets/images/gandalf.jpg',
                      width: 400,
                      height: 400,
                    )
                  else if (personaje.personaje?.getArmadura() ==
                      "Armadura de fuego")
                    Image.asset(
                      '../assets/images/sauron.jpg',
                      width: 400,
                      height: 400,
                    )
                  else if (personaje.personaje?.getArmadura() ==
                      "Armadura Basica")
                    Image.asset(
                      '../assets/images/basica.jpg',
                      width: 400,
                      height: 400,
                    )
                ],
              )
            else if (personaje.getTipoPersonaje() == "guerrero")
              Column(
                children: [
                  Text(
                    'Guerrero creado, con las siguientes características:ç',
                  ),
                  Column(
                    children: [
                      Text("Armadura: ${personaje.personaje?.getArmadura()}"),
                      Text("Arma: ${personaje.personaje?.getArma()}"),
                      Text("Habilidad: ${personaje.personaje?.getHabilidad()}"),
                    ],
                  ),
                  if (personaje.personaje?.getArmadura() ==
                      "Armadura de planta")
                    Image.asset(
                      '../assets/images/gandalf.jpg',
                      width: 400,
                      height: 400,
                    )
                  else if (personaje.personaje?.getArmadura() ==
                      "Armadura de fuego")
                    Image.asset(
                      '../assets/images/sauron.jpg',
                      width: 400,
                      height: 400,
                    )
                  else
                    Image.asset(
                      '../assets/images/basica.jpg',
                      width: 400,
                      height: 400,
                    )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
