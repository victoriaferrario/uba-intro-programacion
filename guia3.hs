-- cd guia_3 
-- ghci 
----- :l nombre de file con .hs
----- :q quit salir de ghci
----- se prueba con el nombre de la función + input 



-- EJERCICIO 1 -----------------------------------------
-- a)
f :: Integer -> Integer 
f n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16

-- sin pattern matching
fAlt :: Integer -> Integer
f 1 = 0 
f 4 = 131
f 16 = 15

-- b)
g :: Integer -> Integer 
g n | n == 8 = 16
    | n == 16 = 4 
    | n == 131 = 1

-- c) 
--- fog
h :: Integer -> Integer 
h n = f(g n) 
--- gof (otra manera de hacerlo)
k :: Integer -> Integer 
k n = g x
    where x = f n


-- EJERCICIO 2 -----------------------------------------
-- a) Valor absoluto
-- Importante: en terminal usar paréntesis (-n)
abs :: Integer -> Integer 
abs n   | n < 0 = -n
        | otherwise = n

-- b) maximo Absoluto, devuelve el máximo de valor absoluto entre 2
maxAbsoluto :: Integer -> Integer -> Integer
maxAbsoluto x y
    | absolute x > absolute y = absolute x
    | otherwise = absolute y

-- c) maximo 3
max3 :: Integer -> Integer -> Integer -> Integer
max3 x y z
    | x > y && x > z = x
    | y > z = y
    | otherwise = z

-- d) alguno es cero
-- pattern matching
algunoEsCeroP :: (Float, Float) -> Bool
algunoEsCeroP (x, y)
    | x == 0 || y == 0 = True
    | otherwise = False

-- currificación con pattern matchin 
algunoEsCeroC :: Float -> Float -> Bool
algunoEsCeroC _ 0 = True
algunoEsCeroC 0 _ = True 
algunoEsCeroC _ _ = True 

-- sin pattern matching !!!
algunoEsCero :: (Float, Float) -> Bool
algunoEsCero (x, y) = x == 0 || y == 0
--          devuelve el resultado tal cual 

-- e) 
-- sin pattern matching !!!
ambosSonCeroP :: (Float, Float) -> Bool
ambosSonCeroP (x, y)
    | x == 0 && y == 0 = True 
    | otherwise = False 

ambosSonCero :: (Float, Float) -> Bool
ambosSonCero (x,y) = x == 0 && y == 0

-- f) en Mismo intervalo, indicar 
mismoIntervalo :: Float -> Float -> Bool 
mismoIntervalo x y = (x <= 3 && y <= 3) || (x > 7 && y > 7) || ( x <= 7 && y <=7 && x > 3 && x > 3)  

-- g) sumaDistintos
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z 
    | (x == y) && (y == z) = x
    | x == y = x + z
    | y == z = x + y
    | x == z = x + y
    | otherwise = x + y + z

-- h) esMultiploDe
-- Mod trabaja con Integers 
esMultiploDe :: Integer -> Integer -> Bool 
esMultiploDe x y = mod x y == 0
 
-- i) digitoUnidades dado un número entero, extrae su dígito de las unidades 
---- función recursiva 
---- [div] devuelve cuantas veces el primer numero puede ser dividido por el segundo
---- entendí mal solo pide el utlimo digito se hace con div x 10 
digitoUnidades :: Integer -> Integer 
digitoUnidades x 
    | x > 0 = 1 + digitoUnidades(div x 10)
    | otherwise = 0

-- j) digitoDecenas dado un número entero mayor a 9, extrae su dígito de las decenas 
---- precondición x < 9 
digitoDecenas :: Integer -> Integer
digitoDecenas x
    | x > 9 = digitoUnidades (div x 10)
    | otherwise = 0


ype Punto2D = (Float, Float)

-- Ejercicio 4. ⋆ Especificar e implementar las siguientes funciones utilizando tuplas para representar pares y ternas de
-- n´umeros.

-- a) productoInterno: calcula el producto interno entre dos tuplas de R × R.

productoInterno :: Punto2D -> Punto2D -> Float
productoInterno a b = fst a * fst b + snd a * snd b

-- b) esParMenor: dadas dos tuplas de R × R, decide si cada coordenada de la primera tupla es menor a la coordenada
esParmenor :: Punto2D -> Punto2D -> Bool
esParmenor a b = fst a  < fst b && snd a < snd b

-- c) distancia: calcula la distancia eucl´ıdea entre dos puntos de R2. 
------ Modulo de la resta entre los vectores
distancia :: Punto2D -> Punto2D -> Float
distancia a b = sqrt((fst a - fst b)**2 + (snd a- snd b)**2)


-- pwd donde esta ls todo cd abre carpeta

-- d) sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos.
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x,y,z) = x+y+z

-- e) sumarSoloMultiplos: dada una terna de n´umeros enteros y un natural, calcula la suma de los elementos de la terna que
-- son m´ultiplos del n´umero natural.
-- Por ejemplo:
-- sumarSoloMultiplos (10,-8,-5) 2 ⇝ 2
-- sumarSoloMultiplos (66,21,4) 5 ⇝ 0
-- sumarSoloMultiplos (-30,2,12) 3 ⇝ -18

-- precondición n = Natural
sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (x, y, z) n 
    | esMultiploDe x n && esMultiploDe y n && esMultiploDe z n = x + y + z
    | esMultiploDe x n && esMultiploDe y n = x + y
    | esMultiploDe y n && esMultiploDe z n = y + z 
    | esMultiploDe x n && esMultiploDe z n = x + z
    | esMultiploDe x n = x
    | esMultiploDe y n = y
    | esMultiploDe z n = z
    | otherwise = 0

-- f) posPrimerPar: dada una terna de enteros, devuelve la posici´on del primer n´umero par si es que hay alguno, o devuelve
-- 4 si son todos impares.
posPrimerPar ::(Integer, Integer, Integer) -> Integer
posPrimerPar (x, y, z)
    | esMultiploDe x 2 = 1
    | esMultiploDe y 2 = 2
    | esMultiploDe z 2 = 3
    | otherwise = 4

-- g) crearPar :: a -> b -> (a, b): a partir de dos componentes, crea un par con esos valores. Debe funcionar para ele-
-- mentos de cualquier tipo.
crearPar :: a -> b -> (a,b)
crearPar a b = (a,b)

-- h) invertir :: (a, b) -> (b, a): invierte los elementos del par pasado como par´ametro. Debe funcionar para elementos
-- de cualquier tipo.
invertir :: (a,b) -> (b,a)
invertir (a,b) = (b,a)

-- i) Reescribir los ejercicios productoInterno, esParMenor y distancia usando el siguiente renombre de tipos:
-- type Punto2D = (Float, Float)



-- Ejercicio 5. Implementar la funci´on todosMenores :: (Integer, Integer, Integer) -> Bool
f :: Integer -> Integer 
f n | n <= 7 = n * n 
    | n > 7 = 2*n - 1

g :: Integer -> Integer 
g n | esMultiploDe n 2 = div n 2
    | otherwise = 3*n + 1

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x,y,z) = (f x > g x) && (f y > g y) && (f z > g z)

-- Ejercicio 6. 

type Anio = Integer
type EsBisiesto = Bool

bisiesto :: Anio -> EsBisiesto
bisiesto a = not(not(esMultiploDe a 4) || (esMultiploDe a 100  && not(esMultiploDe a 400)))
-- el not al principio --> la especificacion define res = false 


-- Ejercicio 7.
-- a) Implementar la funci´on:
-- distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float
-- problema distanciaManhattan (p : R × R × R, q : R × R × R) : R {
-- requiere: {T rue}
-- asegura: {res = P2
-- i=0 |pi − qi|}
-- }
-- Por ejemplo:
-- distanciaManhattan (2, 3, 4) (7, 3, 8) ⇝ 9
-- distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) ⇝ 12.8

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = (abs (a-d) + abs(b-e) + abs(c-f))


-- b) Reimplementar la funci´on teniendo en cuenta el siguiente tipo: type Punto3D = (Float, Float, Float)

