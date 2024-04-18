import 'package:ejercicio3/personaje_builder.dart';

class Director {

  final PersonajeBuilder _builder;

  Director(this._builder);

  void buildPersonaje(){
    _builder.createNewPersonaje();
    _builder.addArmadura();
    _builder.addArma();
    _builder.addHabilidad();
  }
}