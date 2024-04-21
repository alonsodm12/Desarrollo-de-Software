import 'package:ejercicio3/modelo/armadura.dart';

abstract class ArmaduraDecorador extends Armadura{
  
  Armadura? armaduraDecorada;

  ArmaduraDecorador(this.armaduraDecorada);

  @override
  String darApariencia(){
    return armaduraDecorada!.darApariencia();
  }
}