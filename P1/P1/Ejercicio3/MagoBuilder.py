from PersonajeBuilder import PersonajeBuilder
from Armadura import Armadura
from ArmaduraSimple import ArmaduraSimple
from PlantaDecorador import PlantaDecorador

class MagoBuilder(PersonajeBuilder):
    def add_arma(self):
        self.personaje.arma = "Bolas de magía"

    def add_armadura(self):
        self.personaje.armadura = ArmaduraSimple("Armadura Basica")

    def add_habilidad(self):
        self.personaje.habilidad = "Magía"
    
    def set_armadura(self, armadura):
        self.personaje.armadura = armadura
        
    def get_armadura(self):
        return self.personaje.armadura