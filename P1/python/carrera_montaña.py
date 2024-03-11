from carrera import Carrera

class CarreraMontaña(Carrera):
    def __init__(self,bicis):
        Carrera.__init__(self,bicis,0.2)

    def __clone__(self):
        Carrera.__clone__(self)
         
    def clone(self):
        return Carrera.__copy__(self)
