import 'package:flutter/material.dart';

class PaginaGuerrero extends StatelessWidget{
  const PaginaGuerrero({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Guerrero")),
      body: Center(
        child: TextButton(
          onPressed: ()=>{ Navigator.pop(context)},
          child: const Text("Regresar")
        )
      )
    );
  }
}