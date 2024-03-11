from abc import ABC, abstractmethod

class Bicicleta(ABC):

    def __init__(self,identificador):
        self.identificador=identificador
    
    def __copy__(self,memo=None):
        if memo is None:
            memo = {}

        
        identificador=copy.deepcopy(self.identificador,memo)
        new = self.__class__(
            self.identificador
        )
        new.__dict__= copy.deepcopy(self.__dict__,memo)
        
        return new



