from carrera import Carrera

class CarreraCarretera(Carrera):
    def __init__(self,bicis,tasa_abandono=0.1):
        Carrera.__init__(self,bicis,tasa_abandono)
    
    def __clone__(self):
        Carrera.__clone__(self)
         
    def clone(self):
        return Carrera.__copy__(self)
