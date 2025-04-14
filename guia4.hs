factorial :: Integer -> Integer
-- signatura de la función Integer -> Integer
factorial n
    | n == 0 = 1
    | otherwise = n* factorial(n-1)
-- orden = es importante poner primero el n = 0 porque sino se cuelga
-- caso base siempre

--version alternativa con pattern matching 
factorialPM :: Integer -> Integer
factorialPM 0 = 1
factorialPM n = n * factorialPM (n-1)


-- Ejercicio 1 que devuelve el i-´esimo n´umero de Fibonacci.
-- precondición que n >= 0
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)


-- Ejercicio 2
-- precondición que n >= 0
parteEntera :: Float -> Integer
parteEntera n 
    |n < 1 = 0
    |otherwise = 1 + parteEntera (n-1)


--Ejercicio 3
esDivisible :: Integer -> Integer -> Bool
esDivisible x y 
    | x == 0 = True
    | x < 1 = False
    | otherwise = esDivisible (x-y) y

--Ejercicio 4
sumaImpares :: Integer -> Integer 
sumaImpares 0 = 0
sumaImpares n = 2*n - 1 + sumaImpares (n-1)

--Ejercicio 5 
medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n-2)

--Ejercicio 6
todosDigitosIguales :: Integer -> Bool 
todosDigitosIguales n 
    | div n 10 == 0 = True
    | mod n 10 == mod (div n 10) 10 = todosDigitosIguales (div n 10)
    | otherwise = False

--Ejercicio 7 
iesimoDigito :: Integer -> Integer -> Integer 
-- n >= 0 
-- cantdigitos(n) > i >= 1
iesimoDigito n 1 = div n 10^(cantDigitos n -1)
iesimoDigito n i = iesimoDigito (mod n 10^cantDigitos(n-1)) (i-1)


cantDigitos :: Integer -> Integer
cantDigitos 0 = 0
cantDigitos n = 1 + cantDigitos(div n 10)