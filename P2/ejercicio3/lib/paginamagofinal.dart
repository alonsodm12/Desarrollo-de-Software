import 'package:flutter/material.dart';

class PaginaMagoFinal extends StatelessWidget {
  const PaginaMagoFinal({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        title: Text('Mago Creado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Fila para la habilidad y el arma
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Contenedor para la habilidad
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 2, // Ancho del borde
                  ),
                ),
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lightbulb_outline, size: 50),
                    Text("Habilidad del Mago",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              // Contenedor para el arma
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 2, // Ancho del borde
                  ),
                ),
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lightbulb, size: 50),
                    Text("Arma del Mago",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          // Opciones para elegir armaduras
          SizedBox(height: 20),
          Text(
            "Armado con:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Armadura 1
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Color del borde
                        width: 2, // Ancho del borde
                      ),
                    ),
                    width: 100,
                    height: 100,
                    child: Icon(Icons.shield, size: 30),
                  ),
                  Text("Armadura 1", style: TextStyle(fontSize: 14)),
                ],
              ),
              // Armadura 2
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Color del borde
                        width: 2, // Ancho del borde
                      ),
                    ),
                    width: 100,
                    height: 100,
                    child: Icon(Icons.shield, size: 30),
                  ),
                  Text("Armadura 2", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          // Botón para regresar
          SizedBox(height: 20),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Regresar", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
