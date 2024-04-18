import 'package:ejercicio3/fuego_decorador.dart';
import 'package:ejercicio3/personaje_builder.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/guerrero_builder.dart';
import 'package:ejercicio3/director.dart';
import 'package:ejercicio3/armadura.dart';
import 'package:ejercicio3/planta_decorador.dart';
import 'package:ejercicio3/armadura_simple.dart';
import 'package:ejercicio3/mago_builder.dart';
import 'package:ejercicio3/PaginaMago.dart';
import 'package:ejercicio3/PaginaGuerrero.dart';

void main() {
  GuerreroBuilder personajeGuerrero = GuerreroBuilder();
  Director director = Director(personajeGuerrero);
  director.buildPersonaje();
  print(personajeGuerrero.personaje?.mostrarPersonaje());

  Armadura armadura = ArmaduraSimple("ArmaduraBasica");
  Armadura armaduraPlanta = PlantaDecorador(armadura);

  personajeGuerrero.setArmadura(armaduraPlanta);
  print(personajeGuerrero.personaje?.mostrarPersonaje());

  Armadura armadura2 = ArmaduraSimple("ArmaduraBasica");
  Armadura armaduraFuego = FuegoDecorador(armadura2);

  MagoBuilder personajeMago = MagoBuilder();
  Director director2 = Director(personajeMago);
  director2.buildPersonaje();

  personajeMago.setArmadura(armaduraFuego);
  print(personajeMago.personaje?.mostrarPersonaje());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Creación Personajes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String output = "";

class _MyHomePageState extends State<MyHomePage> {

  buttonPressed(String buttonText) {

    if (buttonText == "Guerrero") {
      PersonajeBuilder personaje = GuerreroBuilder();
      Director director = Director(personaje);
      director.buildPersonaje();
      setState(() {
          output = "Guerrero\n";
          output += personaje.personaje!.mostrarPersonaje();
        });
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return const PaginaGuerrero();
      }));
    } else if (buttonText == "Mago") {
      PersonajeBuilder personaje = MagoBuilder();
      Director director = Director(personaje);
      director.buildPersonaje();
      setState(() {
          output = "Mago\n";
          output += personaje.personaje!.mostrarPersonaje();
        });
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return const PaginaMago();
      }));
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.teal),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[buildButton("Mago"), buildButton("Guerrero")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children :<Widget>[Text(overflow: TextOverflow.ellipsis, output)]
            ),
          ],
        ),
      ),
    );
  }
}
