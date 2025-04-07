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
absolute :: Integer -> Integer 
absolute n 
        | n < 0 = -n
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

