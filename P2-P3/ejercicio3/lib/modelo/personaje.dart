import 'package:ejercicio3/modelo/armadura.dart';

//Producto final

class Personaje{
  Armadura? armadura;
  String? arma;
  String? habilidad;
  String? tipoPersonaje;
  
  Personaje({this.arma, this.armadura, this.habilidad, this.tipoPersonaje});

  factory Personaje.fromJson(Map<String, dynamic> json){
    return Personaje(
      arma: json['arma'] as String?,
      habilidad: json['habilidad'] as String?,
      tipoPersonaje: json['tipoPersonaje'] as String?,
      armadura: json['armadura'] as Armadura?
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'arma': arma,
      'habilidad': habilidad,
      'tipoPersonaje': tipoPersonaje,
      'armadura': armadura
    };
  }

  String mostrarPersonaje() {
    if(arma != null && habilidad != null && armadura != null){
      String armaduratxt = armadura!.darApariencia();
      return "Armadura: $armaduratxt, Arma: $arma, Habilidad: $habilidad";
    }
    else {
      return "El personaje no se ha creado correctamente.";
    }
  }

  String getArmadura() {
    String armaduratxt = armadura!.darApariencia();
    return armaduratxt;
  }

  String getArma() {
    return arma!;
  }

  String getHabilidad() {
    return habilidad!;
  }

  String getTipoPersonaje(){
    return tipoPersonaje!;
  }

  void setArmadura(Armadura armadura) {
    assert(armadura.darApariencia() == 'Armadura Básica' || armadura.darApariencia() == 'Armadura de planta' || armadura.darApariencia() == 'Armadura de fuego', 'La armadura pasada no es la correcta');
    this.armadura = armadura;
  }

  /* Widget mostrarPersonajeWidget() {
    return Column(
      children: [
        Text("Armadura: ${armadura!.darApariencia()}"),
        Text("Arma: $arma"),
        Text("Habilidad: $habilidad"),
      ],
    );
  } */
}
