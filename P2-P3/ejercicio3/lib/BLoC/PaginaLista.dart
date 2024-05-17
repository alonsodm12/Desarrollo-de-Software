import 'package:ejercicio3/BLoC/paginapersonajefinal.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personajes_lista.dart';

class PaginaLista extends StatelessWidget {

  PersonajeLista personajes = PersonajeLista();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Elimina la flecha hacia atrás
        title: const Text(
          'Lista de Personajes',
          style: TextStyle(
            fontSize: 20, // Tamaño de fuente más grande
            fontWeight: FontWeight.bold, // Texto en negrita
          ),
        ),
        centerTitle: true, // Centra el título
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 148, 148, 148), // Fondo gris claro
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(55), // Bordes redondeados
          child: ListView.builder(
            itemCount: personajes.obtenerCantidadPersonajes(),
            itemBuilder: (context, index) {
              final personaje = personajes.obtenerPersonajePorIndice(index);
              Color containerColor;
              if (personaje.getTipoPersonaje()!.toLowerCase() == 'guerrero') {
                containerColor = const Color.fromARGB(255, 243, 97, 87);
              } else if (personaje.getTipoPersonaje()!.toLowerCase() == 'mago') {
                containerColor = const Color.fromARGB(255, 102, 181, 247);
              } else {
                containerColor = Colors.black;
              }
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Bordes redondeados
                ),
                child: Container(
                  color: containerColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      '${_capitalizeFirstLetter(personaje.getTipoPersonaje())} creado con éxito con armadura ${personaje.getArmadura()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black, // Texto en negro
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaginaPersonajeFinal(
                            personaje: personaje,
                          ),
                        ),
                      );
                    },
                     trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        personajes.eliminarPersonaje(personaje);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Añadir Personaje',
            style: TextStyle(
              fontSize: 16, // Tamaño de fuente más grande
              fontWeight: FontWeight.bold, // Texto en negrita
            ),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  String _capitalizeFirstLetter(String text) {
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }
}
