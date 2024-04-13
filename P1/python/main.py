from factoria_carretera_bicicleta import *
from factoria_montaña import FactoriaMontaña
from factoria_carretera import FactoriaCarretera
from carrera import *
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