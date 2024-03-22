from carrera import Carrera

class CarreraMontaña(Carrera):
    def __init__(self,bicis, tasa_abandono=0.2):
        Carrera.__init__(self,bicis,tasa_abandono)

    def __clone__(self):
        Carrera.__clone__(self)

    def __copy__(self):
        return super().__copy__()
    
    def __deepcopy__(self, memo=None):
        return super().__deepcopy__(memo)
         
    def clone(self):
        return Carrera.__copy__(self)
