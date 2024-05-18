import 'package:ejercicio3/modelo/armadura_simple.dart';
import 'package:ejercicio3/modelo/fuego_decorador.dart';
import 'package:ejercicio3/modelo/planta_decorador.dart';

abstract class Armadura {
  String darApariencia();
  Map<String, dynamic> toJson();

  static Armadura fromJson(Map<String, dynamic> json) {
    switch (json['tipo']) {
      case 'fuego':
        return FuegoDecorador.fromJson(json);
      case 'planta':
        return PlantaDecorador.fromJson(json);
      case 'basica':
      return ArmaduraSimple.fromJson(json);
      default:
        throw Exception('Tipo de armadura desconocido');
    }
  }
}
