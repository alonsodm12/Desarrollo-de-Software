class Personaje:
    def __init__(self):
        self.armadura = None
        self.arma = None
        self.habilidad = None

    def __str__(self):
        return f"Personaje:\n Armadura: {self.armadura.dar_apariencia()}\n Arma: {self.arma}\n Habilidad: {self.habilidad}\n"