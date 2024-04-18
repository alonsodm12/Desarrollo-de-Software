import 'package:ejercicio3/armadura_decorador.dart';
import 'package:ejercicio3/armadura.dart';

class FuegoDecorador extends ArmaduraDecorador {

  FuegoDecorador(Armadura armadura) : super(armadura);
  
  @override
  String darApariencia() {
    return "Armadura de fuego";
  }
}
