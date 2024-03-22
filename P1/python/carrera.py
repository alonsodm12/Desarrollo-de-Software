from abc import ABC, abstractmethod
import copy
import time

class Carrera(ABC):

    def __init__(self,bicis,abandono):
        self.bicicletas=bicis
        self.tasa_abandono=abandono
    
    def __copy__(self):
        
        bicicletas=copy.copy(self.bicicletas)
        new = self.__class__(
            bicicletas,self.tasa_abandono
        )
        new.__dict__.update(self.__dict__)
        
        return new

    def __deepcopy__(self,memo=None):
        if memo is None:
            memo = {}

        
        bicicletas=copy.deepcopy(self.bicicletas,memo)
        new = self.__class__(
            bicicletas,self.tasa_abandono
        )
        new.__dict__= copy.deepcopy(self.__dict__,memo)
        
        return new

    def mostrar_carrera(self):
        print("Carrera con:",len(self.bicicletas) ,"bicicletas" )
        print("Tasa de abandono de: ",self.tasa_abandono)
    
    def clone():
        raise NotImplementedError("Error subclase debe implementar el metodo abastracto")
    
    def empezar_carrera(self):
        print("Carrera iniciada")
        print("Bicicletas iniciales: ",len(self.bicicletas))
        n = int(len(self.bicicletas) * self.tasa_abandono)
        for _ in range(n):
            del self.bicicletas[1]

        time.sleep(60)

        print("Carrera finalizada")
        print("Bicicletas restantes: ",len(self.bicicletas))


    