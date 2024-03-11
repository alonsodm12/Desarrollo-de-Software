from carrera import Carrera

class CarreraCarretera(Carrera):
    def __init__(self,bicis):
        Carrera.__init__(self,bicis,0.1)