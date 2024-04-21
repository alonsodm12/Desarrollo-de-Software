import 'package:ejercicio3/modelo/armadura_decorador.dart';
import 'package:ejercicio3/modelo/armadura.dart';

class FuegoDecorador extends ArmaduraDecorador {

  FuegoDecorador(Armadura super.armadura);
  
  @override
  String darApariencia() {
    return "Armadura de fuego";
  }
}
