from factoria_carretera_bicicleta import FactoriaCarrerayBicicleta
from carrera_carretera import CarreraCarretera
from bicicleta_carrera import BicicletaCarretera

class FactoriaCarretera(FactoriaCarrerayBicicleta):
    def __init__(self,n):
        FactoriaCarrerayBicicleta.__init__(self)
        num_bicis=n 
        if n<0:
            num_bicis=0

    def crear_carrera(self):
        bicis = []
        for i in range(self.num_bicis):
            bicis.append(self.crear_bicicleta())
        return CarreraCarretera(bicis) 

    def crear_bicicleta(self):
        return BicicletaCarretera()
