from Factoria_carretera_bicicleta import *
from Factoria_montaña import FactoriaMontaña
from Factoria_carretera import FactoriaCarretera
from Carrera import *
import copy

class main():

    factoria_m=FactoriaMontaña(10)
    factoria_c=FactoriaCarretera(10)

    """ carrera_m=factoria_m.crear_carrera() """
    carrera_c=factoria_c.crear_carrera()
    carrera_m=factoria_m.crear_carrera()

    """ carrera_m.mostrar_carrera() """
    carrera_c.empezar_carrera()

    carrera_m.empezar_carrera()

if __name__ == "__main__":
    main()
