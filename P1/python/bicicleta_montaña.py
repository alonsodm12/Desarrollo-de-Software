from bicicleta import Bicicleta

class BicicletaMontaña(Bicicleta):

    bicis=0

    def __init__(self):
        Bicicleta.__init__(self,BicicletaMontaña.bicis)
        BicicletaMontaña.bicis+=1
    
    def __clone__(self):
        Bicicleta.__clone__(self)
         
    def clone(self):
        return Bicicleta.__copy__(self)