from carrera import Carrera

class CarreraMontaña(Carrera):
    def __init__(self,bicis):
        Carrera.__init__(self,bicis,0.2)