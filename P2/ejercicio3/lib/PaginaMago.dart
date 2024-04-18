import 'package:flutter/material.dart';

class PaginaMago extends StatelessWidget{
  const PaginaMago({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Mago")),
      body: Center(
        child: TextButton(
          onPressed: ()=>{ Navigator.pop(context)},
          child: const Text("Regresar")
        )
      )
    );
  }
}