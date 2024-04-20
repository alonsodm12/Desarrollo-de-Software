import 'package:ejercicio3/personaje_builder.dart';

class Director {
  final PersonajeBuilder _builder;

  Director(this._builder);

  void buildPersonaje(String tipo) {
    _builder.createNewPersonaje(tipo);
    _builder.addArmadura();
    _builder.addArma();
    _builder.addHabilidad();
  }
}
