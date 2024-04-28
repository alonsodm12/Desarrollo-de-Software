from PersonajeBuilder import PersonajeBuilder
from Armadura import Armadura
from ArmaduraSimple import ArmaduraSimple
from FuegoDecorador import FuegoDecorador

class GuerreroBuilder(PersonajeBuilder):
    def add_arma(self):
        self.personaje.arma = "Lanzallamas"

    def add_armadura(self):
        self.personaje.armadura = ArmaduraSimple("Armadura Basica")

    def add_habilidad(self):
        self.personaje.habilidad = "Lucha"
    
    def set_armadura(self, armadura):
        self.personaje.armadura = armadura
        
    def get_armadura(self):
        return self.personaje.armadura