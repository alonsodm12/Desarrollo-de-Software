from factoria_carretera_bicicleta import FactoriaCarrerayBicicleta
from carrera_montaña import CarreraMontaña
from bicicleta_montaña import BicicletaMontaña

class FactoriaMontaña(FactoriaCarrerayBicicleta):
    def __init__(self,n):
        self.num_bicis=n 
        FactoriaCarrerayBicicleta.__init__(self)
        
        if n<0:
            self.num_bicis=0

    def crear_carrera(self):
        bicis = []
        for i in range(self.num_bicis):
            bicis.append(self.crear_bicicleta())
        return CarreraMontaña(bicis) 

    def crear_bicicleta(self):
        return BicicletaMontaña()
