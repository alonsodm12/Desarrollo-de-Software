from Armadura import Armadura

class ArmaduraSimple(Armadura) :
    def __init__(self, armadura):
        self.armadura = armadura
    
    def dar_apariencia(self):
        return self.armadura