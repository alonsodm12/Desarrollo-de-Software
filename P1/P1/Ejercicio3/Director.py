class Director:
    def __init__(self, builder):
        self._builder = builder

    def build_personaje(self):
        self._builder.create_new_personaje()
        self._builder.add_armadura()
        self._builder.add_arma()
        self._builder.add_habilidad()