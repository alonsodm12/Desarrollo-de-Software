import 'package:ejercicio3/armadura_decorador.dart';
import 'package:ejercicio3/armadura.dart';

class PlantaDecorador extends ArmaduraDecorador {
  PlantaDecorador(Armadura super.armadura);

  @override
  String darApariencia() {
    return "Armadura de planta";
  }
}
