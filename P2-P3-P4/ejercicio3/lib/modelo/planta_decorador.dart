import 'package:ejercicio3/modelo/armadura_decorador.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';

class PlantaDecorador extends ArmaduraDecorador {
  PlantaDecorador(Armadura super.armadura);

  @override
  String darApariencia() {
    return "Armadura de planta";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'tipo': 'planta',
    };
  }

  static Armadura fromJson(Map<String, dynamic> json){
    return PlantaDecorador(ArmaduraSimple('Armadura Basica'));
  }
}
