import 'package:ejercicio3/modelo/armadura_decorador.dart';
import 'package:ejercicio3/modelo/armadura.dart';
import 'package:ejercicio3/modelo/armadura_simple.dart';

class FuegoDecorador extends ArmaduraDecorador {

  FuegoDecorador(Armadura super.armadura);
  
  @override
  String darApariencia() {
    return "Armadura de fuego";
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'tipo': 'fuego',
    };
  }

  static Armadura fromJson(Map<String, dynamic> json){
    return FuegoDecorador(ArmaduraSimple('Armadura Basica'));
  }
}
