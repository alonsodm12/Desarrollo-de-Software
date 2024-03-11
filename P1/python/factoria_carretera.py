from factoria_carretera_bicicleta import FactoriaCarrerayBicicleta
from carrera_carretera import CarreraCarretera
from bicicleta_carrera import BicicletaCarretera

class FactoriaCarretera(FactoriaCarrerayBicicleta):
    def __init__(self,n):
        FactoriaCarrerayBicicleta.__init__(self)
        self.num_bicis=n 
        if n<0:
            self.num_bicis=0

    def crear_carrera(self):
        bicis = []
        for i in range(self.num_bicis):
            if(len(bicis)==0):
                bicis.append(self.crear_bicicleta())
            bicis.append(bicis[0].copy())
            
        return CarreraCarretera(bicis) 

    def crear_bicicleta(self):
        return BicicletaCarretera()
