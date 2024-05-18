import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/personaje.dart';
import 'package:ejercicio3/modelo/personajes_lista.dart';
import 'package:ejercicio3/BLoC/paginapersonajefinal.dart';
import 'package:ejercicio3/BLoC/PaginaCrearPersonaje.dart';
void main() {
  runApp(const GestorPersonajes());
}

class GestorPersonajes extends StatelessWidget {
  const GestorPersonajes({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creador de personajes',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255, 255), // Hace que el fondo del Scaffold sea transparente
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true, // Extiende el fondo detrás de la barra de aplicación
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('../assets/images/fondo.jpg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el fondo
            ),
          ),
          child: GestorPersonajesMain(personaje: Personaje()),
        ),
      ),
    );
  }
}

class GestorPersonajesMain extends StatefulWidget {
  
  final Personaje personaje;

  Personaje getPersonaje(){
    return personaje;
  }
  GestorPersonajesMain({required this.personaje});
  @override
  _GestorPersonajesMainState createState() => _GestorPersonajesMainState();
}

class _GestorPersonajesMainState extends State<GestorPersonajesMain> {

  late PersonajeLista personajes = PersonajeLista();
  late Personaje personaje;
  
  String currentUser = "Jaime";
  List<String> users = ["Jaime", "Jose", "Alonso", "Carlos"];

  @override
  void initState() {
    super.initState();
    personaje = widget.personaje;
    _cargarPersonajesIniciales();
  }

  void _cargarPersonajesIniciales() async {
    try {
      await personajes.cargarPersonaje(currentUser);
      setState(() {});
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }

  void _addTask() async {
    try {
      await personajes.agregar(Personaje(armadura: personaje.armadura, arma: personaje.arma, habilidad: personaje.habilidad, tipoPersonaje: personaje.tipoPersonaje, usuario: currentUser, id: null));
    } catch (e) {
      print("Error adding task: $e");
    }
    
    setState(() {});
  }

  void _deleteTask(Personaje personaje) async {
    try {
      await personajes.eliminar(personaje);
    } catch (e) {
      print("Error deleting task: $e");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Lista de Personajes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,

        actions: <Widget>[
          DropdownButton<String>(
            value: currentUser,
            icon: const Icon(Icons.arrow_downward),
            onChanged: (String? newValue) {
              if (newValue != null && newValue != currentUser) {
                setState(() {
                  currentUser = newValue;
                  _cargarPersonajesIniciales();
                });
              }
            },
            items: users.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 148, 148, 148), // Fondo gris claro
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(55), // Bordes redondeados
          child: ListView.builder(
            itemCount: personajes.personajes.length,
            itemBuilder: (context, index) {
              final personaje = personajes.personajes[index];
              Color containerColor;
              if (personaje.getTipoPersonaje().toLowerCase() == 'guerrero') {
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
                      /* '${_capitalizeFirstLetter(personaje.getTipoPersonaje())} creado con éxito', */
                      /* 'Personaje creado', */
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
                        _deleteTask(personaje);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Crear Personaje',
                    style: TextStyle(
                      fontSize: 16, // Tamaño de fuente más grande
                      fontWeight: FontWeight.bold, // Texto en negrita
                    ),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    heroTag: 'crearPersonaje',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CrearPersonaje(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Añadir Personaje',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    heroTag: 'añadirPersonaje',
                    onPressed: _addTask,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
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
