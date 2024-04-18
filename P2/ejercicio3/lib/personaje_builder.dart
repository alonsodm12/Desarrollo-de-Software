import 'package:ejercicio3/personaje.dart';

abstract class PersonajeBuilder {
  
  // La interrogación es para que el atributo pueda ser null
  Personaje? personaje;

  PersonajeBuilder(){
    personaje = null;
  }
  
  void createNewPersonaje(){
    personaje = Personaje();
  }

  //Metodo a implementar
  void addArma();
  
  //Metodo a implementar
  void addArmadura();

  //Metodo a implementar
  void addHabilidad();
}
