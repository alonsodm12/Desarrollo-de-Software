from abc import ABC, abstractmethod

class Bicicleta(ABC):

    def __init__(self,identificador):
        self.identificador=identificador