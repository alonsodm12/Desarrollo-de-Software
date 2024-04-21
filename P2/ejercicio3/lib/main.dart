import 'package:ejercicio3/modelo/personaje_builder.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/modelo/guerrero_builder.dart';
import 'package:ejercicio3/modelo/director.dart';
import 'package:ejercicio3/modelo/mago_builder.dart';
import 'package:ejercicio3/BLoC/PaginaMago.dart';
import 'package:ejercicio3/BLoC/PaginaGuerrero.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creador de personajes',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255, 255), // Hace que el fondo del Scaffold sea transparente
      ),
      home: Scaffold(
        extendBodyBehindAppBar:
            true, // Extiende el fondo detrás de la barra de aplicación
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  '../assets/images/fondo.jpg'), // Ruta de la imagen de fondo
              fit: BoxFit.cover, // Ajusta la imagen para cubrir el fondo
            ),
          ),
          child: const MyHomePage(
              title: 'Creador de Personajes'), // Coloca tu contenido aquí
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Acción que realiza la "card" cuando se hace click sobre ella.
  buttonPressed(String buttonText) {
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

  Widget buildButton(String buttonText, String imageRoute) {
    return Flexible(
      child: InkWell(
        onTap: () {
          buttonPressed(buttonText);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.white, width: 3.0)
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
                  height: 700, // Altura fija para la imagen
                  width: 500,
                ),

                // Usamos Container para el contenedor de la descripción
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(buttonText,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "FuenteTitulo"
                    )
                  ,),
                ),
                if(buttonText == "MAGO")
                  Container(
                    width: 400,
                    height: 250,
                    padding: const EdgeInsets.all(10),
                    child: const Text("En los dominios de lo oculto, se alza Aslan."
                      " Con su varita mágica en mano, desata trucos encantadores y "
                      "hechizos devastadores por igual. Su destreza con la varita "
                      "lo convierte en un maestro de la magia, capaz de conjurar "
                      "maravillas y derrotar a sus enemigos con un solo movimiento.",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "FuenteTitulo"
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  )
                else if(buttonText == "GUERRERO")
                  Container(
                    width: 400,
                    height: 250,
                    padding: const EdgeInsets.all(10),
                    child: const Text("En los campos de batalla ardientes, avanza "
                      "Kael, Su figura imponente "
                      "se destaca contra el resplandor de su arma, una "
                      "espada que danza a su comando. Con mirada fiera y "
                      "determinación inquebrantable, Kael avanza entre las cenizas, "
                      "dejando tras de sí la destrucción de aquellos que osan enfrentarlo.",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "FuenteTitulo"
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Column(
          mainAxisSize:
              MainAxisSize.max, // Ajusta el tamaño principal de la columna
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinea la columna en la parte superior
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 80.0),
              child: const Text(
                "Creador de personajes",
                style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 195, 97),
                  fontFamily: "FuenteTitulo"
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ), // Añade un espacio vertical entre el título y el texto
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Elige tu personaje principal",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "FuenteTitulo"
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 42,
            ), // Añade más espacio vertical entre el texto y los botones
            Container(
              padding: const EdgeInsets.all(
                  10), // Ajusta el relleno según lo necesites
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildButton("MAGO", '../assets/images/gandalf1.jpg'),
                  buildButton("GUERRERO", '../assets/images/sauron1.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}