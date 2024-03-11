from abc import ABC, abstractmethod

class FactoriaCarrerayBicicleta(ABC):
    
    @abstractmethod
    def crear_bicicleta(self):
        pass
    
    @abstractmethod
    def crear_carrera(self):
        pass
