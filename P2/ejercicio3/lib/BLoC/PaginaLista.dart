import 'package:ejercicio3/BLoC/paginapersonajefinal.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:flutter/rendering.dart';

class PaginaLista extends StatelessWidget{
  late List<PersonajeBuilder> personajes;

  static final PaginaLista _instance = PaginaLista._internal();

  factory PaginaLista() {
    return _instance;
  }

  PaginaLista._internal() {
    personajes = [];
  }

  void agregarPersonaje(PersonajeBuilder personaje) {
    personajes.add(personaje);
  }

  void eliminarPersonaje(PersonajeBuilder personaje) {
    personajes.remove(personaje);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemCount: personajes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(personajes[index].getTipoPersonaje()! + " creado con éxito con armadura " + personajes[index].getArmadura()!.darApariencia()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaginaPersonajeFinal(personaje: personajes[index],
                )
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: Icon(Icons.home),
      ),
    );
  }  
}