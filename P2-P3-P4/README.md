# Desarrollo de Software - Práctica 2

## Ejercicio Grupal - Diseño Adaptativo y Perfectivo

En este ejercicio grupal, nuestro equipo se ha centrado en adaptar y mejorar la Actividad 3 de la Práctica 1, la cual consistía en el desarrollo de un sistema para la creación de personajes para un videojuego. Utilizamos Flutter y Dart para implementar una interfaz de usuario (UI) que permitiera a los usuarios interactuar con las diferentes funcionalidades del sistema.

### Patrones de Diseño Utilizados

- **Patrón Builder**: Para la creación de personajes, implementamos el patrón Builder. Definimos una clase abstracta `PersonajeBuilder` que contiene métodos para la construcción de personajes, y clases concretas `GuerreroBuilder` y `ArqueroBuilder` que implementan dichos métodos para crear personajes específicos. Esto nos permitió crear personajes con diferentes atributos de manera modular y escalable.

- **Patrón Decorador**: Para la implementación de la armadura de los personajes, utilizamos el patrón Decorador. Definimos una interfaz `Armadura` con un método para dar apariencia, y clases concretas `ArmaduraSimple`, `ArmaduraDeFuego` y `ArmaduraDePlanta` que implementan esta interfaz y permiten modificar la armadura en tiempo de ejecución.

### Funcionalidades Implementadas

- **Creación de Personajes**: Los usuarios pueden crear personajes eligiendo entre un Guerrero o un Arquero y configurando sus atributos, como arma, habilidad y armadura.

- **Selección de Armadura**: Se ofrece al usuario la posibilidad de elegir entre diferentes tipos de armadura (simple, de fuego o de planta) para equipar a sus personajes.

- **Interfaz de Usuario Intuitiva**: Diseñamos una interfaz de usuario amigable que guía al usuario a través del proceso de creación de personajes y selección de armadura. Utilizamos widgets Flutter para crear una experiencia de usuario fluida y receptiva.

### Instrucciones de Compilación y Ejecución

1. Clonar el repositorio del proyecto desde GitHub.
2. Abrir el proyecto en un editor de código compatible con Flutter (por ejemplo, Visual Studio Code).
3. Ejecutar el comando `flutter pub get` para obtener las dependencias necesarias.
4. Ejecutar la aplicación en un emulador o dispositivo Android/iOS utilizando el comando `flutter run`.

### Capturas de Pantalla

![Captura de Pantalla 1](screenshot1.png)
*Interfaz de Usuario: Creación de Personaje*

![Captura de Pantalla 2](screenshot2.png)
*Interfaz de Usuario: Selección de Armadura*

### Colaboradores

- Nombre Apellido (@nombreusuario1)
- Nombre Apellido (@nombreusuario2)
- Nombre Apellido (@nombreusuario3)
- Nombre Apellido (@nombreusuario4)

### Licencia

Este proyecto está licenciado bajo la [Licencia MIT](https://opensource.org/licenses/MIT).

