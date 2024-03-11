from bicicleta import Bicicleta

class BicicletaMontaña(Bicicleta):

    bicis=0

    def __init__(self):
        Bicicleta.__init__(self,bicis)
        bicis+=1