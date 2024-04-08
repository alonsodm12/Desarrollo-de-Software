from GuerreroBuilder import GuerreroBuilder
from MagoBuilder import MagoBuilder
from Director import Director
from Armadura import Armadura
from ArmaduraSimple import ArmaduraSimple
from FuegoDecorador import FuegoDecorador
from PlantaDecorador import PlantaDecorador

if __name__ == "__main__":
    personajeGuerrero = GuerreroBuilder()
    director = Director(personajeGuerrero)
    director.build_personaje()
    print(personajeGuerrero.personaje)

    armadura = ArmaduraSimple("ArmaduraBasica")
    armadura_planta = PlantaDecorador(armadura)

    personajeGuerrero.set_armadura(armadura_planta)
    print(personajeGuerrero.personaje)

    personajeMago = MagoBuilder()
    director2 = Director(personajeMago)
    director2.build_personaje()
    print(personajeMago.personaje)