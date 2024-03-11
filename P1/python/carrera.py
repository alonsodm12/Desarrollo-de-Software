from abc import ABC, abstractmethod

class Carrera(ABC):

    def __init__(self,bicis,abandono):
        self.bicicletas=bicis
        self.tasa_abandono=abandono

    def mostrar_carrera():
        print("Carrera con: {len(bicicletas)} bicicletas")
        print("Tasa de abandono de: {tasa_abandono}")

    