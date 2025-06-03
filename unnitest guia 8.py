import unittest
from guia8.py import generar_nros_al_azar

from queue import LifoQueue as Pila 


class test_volumen(unittest.TestCase):
    #se pueden definir los casos por separado
    def test_volumen_1(self):
        p = generar_nros_al_azar(0,0,10)
        self.assertAlmostEqual(generar_nros_al_azar(0,0,10), p.empty() == True)

    def test_volumen_nulo(self):
        self.assertAlmostEqual(volumen_esfera(0.0), 0.0, places=1)

    def test_volumen_5_25(self):
        self.assertAlmostEqual(volumen_esfera(5.25), 605.82375, places=5)

if __name__ == '__main__':
    unittest.main(verbosity=2)