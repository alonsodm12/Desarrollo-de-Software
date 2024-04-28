from abc import ABC, abstractmethod
from Personaje import Personaje

class PersonajeBuilder(ABC):
    def __init__(self):
        self.personaje = None

    def create_new_personaje(self):
        self.personaje = Personaje()

    @abstractmethod
    def add_armadura(self):
        pass
 
    @abstractmethod
    def add_arma(self):
        pass

    @abstractmethod
    def add_habilidad(self):
        pass
    """ prueba """
    @abstractmethod
    def get_armadura(self):
        pass