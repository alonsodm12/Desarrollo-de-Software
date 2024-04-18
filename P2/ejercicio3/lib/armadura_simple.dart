import 'package:ejercicio3/armadura.dart';

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
