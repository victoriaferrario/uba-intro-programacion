module TestParcial where

import Test.HUnit
import EjerciciosParcial

-- Casos de Test

runStock = runTestTT testsStock

testsStock = test [
    " Casobase lista vacia :" ~: (generarStock [] ) ~?= [],
    " Caso  lista una cosa :" ~: (generarStock ["m", "b", "pera", "pera", "m"] ) ~?= [("m",2), ("b",1), ("pera",2)],
    " Caso lista completa  :"~: (generarStock ["manzana"] ) ~?= [("manzana",1)]
    ]
