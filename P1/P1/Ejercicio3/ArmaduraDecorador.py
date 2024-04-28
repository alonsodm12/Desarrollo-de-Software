from Armadura import Armadura

class ArmaduraDecorador(Armadura):
    def __init__(self,armadura):
        self.armadura_decorada = armadura
    
    def dar_apariencia(self):
        return self.armadura_decorada.dar_apariencia()