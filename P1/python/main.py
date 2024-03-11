from factoria_carretera_bicicleta import FactoriaCarrerayBicicleta
from factoria_montaña import FactoriaMontaña
from factoria_carretera import FactoriaCarretera
from carrera import Carrera

class main():

    factoria_m=FactoriaMontaña(10)
    factoria_c=FactoriaCarretera(9)

    carrera_m=factoria_m.crear_carrera()
    carrera_c=factoria_c.crear_carrera()

    carrera_m.mostrar_carrera()
    carrera_c.mostrar_carrera()

if __name__ == "__main__":
    main()