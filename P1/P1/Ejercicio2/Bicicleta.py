from abc import ABC, abstractmethod
import copy

class Bicicleta(ABC):

    def __init__(self, identificador):
        self.identificador=identificador
    
    def __copy__(self):
        new = self.__class__(
            self.identificador
        )
        new.__dict__.update(self.__dict__)
        return new

    def __deepcopy__(self,memo=None):
        if memo is None:
            memo = {}

        
        new = self.__class__(
            self.identificador
        )
        new.__dict__= copy.deepcopy(self.__dict__,memo)
        
        return new



