import 'package:ejercicio3/modelo/armadura.dart';

class ArmaduraSimple extends Armadura {
  String? armadura;

  ArmaduraSimple(String armaduranueva) {
    armadura = armaduranueva;
  }

  @override
  String darApariencia() {
    return armadura!;
  }
}
