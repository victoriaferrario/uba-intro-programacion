-- Guia 4



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
--- lo poseyo el diablo 
iesimoDigito :: Integer -> Integer -> Integer 
-- Primer integer: n   n >= 0 
-- Segundo integer: i  cantdigitos(n) > i >= 1
iesimoDigito n 1 = div n (10^(cantDigitos n - 1))
iesimoDigito n i = iesimoDigito (sinprimerdigito n) (i - 1)

sinprimerdigito :: Integer -> Integer 
sinprimerdigito n = mod n (10^(cantDigitos n - 1)) 

cantDigitos :: Integer -> Integer
cantDigitos 0 = 0
cantDigitos n = 1 + cantDigitos(div n 10)


--Ejercicio 8 
sumaDigitos :: Integer -> Integer 
sumaDigitos n 
    | cantDigitos n == 1 = primerDigito
    | cantDigitos n > 1 = primerDigito + sumaDigitos(sinprimerdigito n)
            where primerDigito = iesimoDigito n 1

--Ejercicio 9 
esCapicua :: Integer -> Bool 
esCapicua n 
    | cantDigitos n == 0 = True 
    -- Comparo primer y ultimo dígito
    | iesimoDigito n 1 == iesimoDigito n (cantDigitos n) = esCapicua sinprimeryultimo
    | otherwise = False 
            where sinprimeryultimo = div (sinprimerdigito n) 10


-- Corrección 10201 si bien es capicua mod 10201 (10^(4)) = 201 no 0201
-- Manera más rigurosa de hacerlo = implementar funcion de invertir y luego comparar con numero original 
digitoUnidades :: Integer -> Integer 
digitoUnidades x = mod x 10

sacarUltimoDigito :: Integer -> Integer 
sacarUltimoDigito n 
    | n < 0 = -sacarUltimoDigito (-n)
    | otherwise = div n 10

invertir :: Integer -> Integer 
invertir n
    | n < 0 = - invertir (-n)
    | n < 10 = n
    | otherwise = ultimodigitoaprimero + invertir (sacarUltimoDigito n)
        where ultimodigitoaprimero = digitoUnidades n * (10^(cantDigitos n - 1))


esCapicuaBien :: Integer -> Bool 
esCapicuaBien n = n == invertir n 

------------------------------------------------------------

--Ejercicio 10
--- a 
diezasumatoria :: Integer -> Integer 
-- 2^0 = 1 caso base
diezasumatoria 0 = 1
diezasumatoria n = 2^n + diezasumatoria ( n - 1 )

---- serie geométrica debería dar lo mismo que 
diezaformula :: Integer -> Integer 
diezaformula n = div (1 - 2^(n+1)) ( 1 - 2 )

--- b
diezbsumatoria :: Integer -> Integer -> Integer 
diezbsumatoria 1 q = q 
diezbsumatoria n q = q ^ n + diezbsumatoria ( n - 1 ) q 

--Ejercicio 11
--a 
--- Importante el fromIntegral que transforma de un int a un float del preludio
eAprox :: Integer -> Float 
eAprox 0 = 1
eAprox n = fromIntegral (div 1 (factorial n)) + eAprox ( n - 1 )

--Ejercicio 12
raizDe2Aprox :: Integer -> Float 
raizDe2Aprox n = sucesion12 n - 1

sucesion12 :: Integer -> Float 
sucesion12 1 = 2
sucesion12 n = 2 + (1 / sucesion12 (n-1))

--Ejercicio 13
--- Sumatoria dentro de sumatoria, son como 10 b
sumatoriatrece :: Integer -> Integer -> Integer
sumatoriatrece n m 
    | n == 1 = 1 * m 
    | otherwise = diezbsumatoria m n + sumatoriatrece (n-1) m

--Ejercicio 14 
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m 
    -- caso base 
    | m == 0 = 0 
    | otherwise = (q ^ m) * sumatoriaiesima (m+1) n q + sumaPotencias q n (m - 1)
    -- sumatoria de a 

sumatoriaiesima :: Integer -> Integer -> Integer -> Integer 
-- puedo modificar desde donde empieza  
sumatoriaiesima i n q
    | n == i = q ^ n 
    | otherwise = q ^ n + sumatoriaiesima i ( n - 1 ) q 


----- resolución campus 
sumaPotenciasValen :: Integer -> Integer -> Integer -> Integer
sumaPotenciasValen q 1 1 = q^(1+1)
sumaPotenciasValen q n 1 = q^(n+1) + sumaPotenciasValen q (n-1) 1
sumaPotenciasValen q 1 m = q^(1+m) + sumaPotenciasValen q 1 (m-1)
sumaPotenciasValen q n m = q^(n+m) + sumaPotenciasValen q (n-1) m + sumaPotenciasValen q n (m-1) - sumaPotenciasValen q (n-1) (m-1)



--Ejercicio 15 
----- Suma de gauss =  1 + 2 + 3 + ...... + n
------- Se puede no hacer por recursión con lo siguiente 
sumaGauss :: Integer -> Integer 
sumaGauss n = div (n*(n+1)) 2

sumaRacionales :: Integer -> Integer -> Float 
sumaRacionales n m 
    | m == 1 = int sumadep
    | otherwise = (int sumadep / int m) + sumaRacionales n (m - 1)
        where 
            sumadep = sumaGauss n
            int = fromIntegral

--Ejercicio 16 

---- (a)
menorDivisor :: Integer -> Integer 
menorDivisor 1 = 1
menorDivisor n = menorDivisorDesde n 2
-- precond = n > 1
menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n k
    | mod n k == 0 = k
    | otherwise = menorDivisorDesde n (k+1)

---- (b)
esPrimo :: Integer -> Bool 
esPrimo x = menorDivisor x == x

---- (c) --> Sino tienen algún divisor en común
sonCoprimos :: Integer -> Integer -> Bool 
sonCoprimos n m = (mod n (menorDivisor m) == 0) || (mod m (menorDivisor n) == 0 )

---- (d)
nEsimoPrimo :: Integer -> Integer 
nEsimoPrimo 1 = 2
nEsimoPrimo n = proximoprimo (nEsimoPrimo (n - 1))

proximoprimo :: Integer -> Integer 
proximoprimo 1 = 2 
proximoprimo n 
    | esPrimo (n+1) = n + 1
    | otherwise = proximoprimo (n + 1)

--Ejercicio 17
esFibonacci :: Integer -> Bool 
esFibonacci m = recorreFibonacci m 0 

recorreFibonacci :: Integer -> Integer -> Bool
recorreFibonacci m n 
    | fibonacci n == m = True 
    | fibonacci n > m = False 
    | otherwise = recorreFibonacci m (n+1)


--Ejercicio 18 
mayorDigitoPar :: Integer -> Integer 
mayorDigitoPar 0 = -1
mayorDigitoPar n 
    | (n < 10) && (mod n 2 == 0)  = n 
    -- osea me quedo un solo dígito y ese dígito debe ser par
    | ultimodigito_par  && (ultimodigito >= anteultimodigito) = mayorDigitoPar (div n 100 + ultimodigito * 10 ^ (cantDigitos n-2) ) 
    -------------------------------------- aca hago recursión sacando los dos ultimos dígitos y poniendo el más grande adelante 
    | otherwise = mayorDigitoPar (div n 10 ) 
    -- cuando no es par 
    where 
        ultimodigito = iesimoDigito n (cantDigitos n )
        ultimodigito_par = mod ultimodigito 2 == 0 
        anteultimodigito = iesimoDigito n (cantDigitos n - 1 )
        anteultimodigito_par = mod anteultimodigito 2 == 0 


--Ejercicio 19 
esSumaInicialDePrimos :: Integer -> Bool 
esSumaInicialDePrimos n = sumaPrimosdesde n 0 == 0 

sumaPrimosdesde :: Integer -> Integer ->  Integer 
sumaPrimosdesde n m 
    | n <= 0 = -1
    | (n - proximoprimo m == 0 ) || esPrimo n = 0
    | otherwise = sumaPrimosdesde (n - proximoprimo m) (m + 1)



-- --Ejercicio 21 
-- pitagoras :: Integer -> Integer -> Integer -> Integer 
-- pitagoras 0 0 _ = 1
-- pitagoras m n r 
--     |  n /= 0  && cumple_pitagoras = 1 + pitagoras (m n-1 r)
--     --- p mantiene su lugar mientras itera q 
--     |  n == 0  && cumple_pitagoras = 1 + pitagoras (m-1 n )
--     | otherwise = pitagoras (m n-1 r)
--     where cumple_pitagoras = n^2 + m^2 <= r^2
