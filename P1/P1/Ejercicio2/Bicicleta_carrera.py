from Bicicleta import Bicicleta
import copy

class BicicletaCarretera(Bicicleta):

    bicis=0

    def __init__(self, id=bicis):
        Bicicleta.__init__(self,id)
        BicicletaCarretera.bicis+=1

    def __clone__(self):
        Bicicleta.__clone__(self)

    def __copy__(self):
        return super().__copy__()
    
    def __deepcopy__(self, memo=None):
        return super().__deepcopy__(memo)
         
    def clone(self):
        return Bicicleta.__copy__(self)
