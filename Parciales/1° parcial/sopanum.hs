{--
SOPA NÚMEROS

Una sopa de nu ́meros es un juego que consiste en descubrir
propiedades de un tablero de dimensiones n × m con n y m > 0, 
en los que en cada posici ́on hay un nu ́mero entero positivo. 
Cada posici ́on se identifica con una dupla (i, j) en el cual 
la primera componente corresponde a una fila y la segunda a una columna.

A modo de ejemplo, la siguiente figura muestra un tablero de 5 × 4 
en el que el nu ́mero 13 aparece en la posici ́on (1, 1) y el nu ́mero 5
aparece en la posici ́on (4, 3). 

Notar que tanto la numeracio ́n de las filas como la de las columnas 
comienzan en 1.


Un camino en un tablero est ́a dado por una secuencia de posiciones adyacentes
en la que solo es posible desplazarse desde una posici ́on dada hacia 
la posici ́on de su derecha o hacia la que se encuentra debajo. 

En otras palabras, un camino de longitud l en un tablero se define como 
una secuencia con l posiciones, ordenadas de manera tal que el elemento 
i- ́esimo es la posici ́on resultante de haberse movido hacia la derecha 
o hacia abajo desde la posici ́on (i-1)- ́esima. 

Siguiendo con el ejemplo, a continuaci ́on puede observarse un camino de 
longitud 5 que representa la sucesi ́on Fibonacci y que empieza en la 
posici ́on (2,1) y termina en (4,3) del tablero.

Para manipular las sopas de nu ́meros en Haskell vamos a representar el tablero
como una lista de filas de igual longitud. 
A su vez, cada fila vamos a representarla como una lista de enteros positivos.
Las posiciones vamos a representarlas con tuplas de dos nu ́meros enteros 
positivos y un camino va a estar dado por una lista de posiciones.

Para implementar esta sopa de nu ́meros nos enviaron las siguientes 
especificaciones y nos pidieron que hagamos el desarrollo enteramente 
en Haskell, utilizando los tipos requeridos y solamente las funciones 
que se ven en la materia Introducci ́on a la Programaci ́on / Algoritmos 
y Estructuras de Datos I (FCEyN-UBA). 

Asumimos los siguientes renombres de tipos de datos en las especificaciones 
de los ejercicios:
--}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use foldr" #-}


type Fila = [(Integer)]
type Tablero = [Fila]
type Posicion = (Integer, Integer)
-- Observaci ́on: las posiciones son: (fila, columna) 
type Camino = [Posicion]

-- Ejemplos
------ Tablero de 3x3 
tablero3x3 = [[6,2,10],[6,2,8],[7,6,2]]
camino = [(1,1), (2,1), (3,1), (3,2)]  --  = valoresdeCamino  =  [6,6,7,6]
{--
6 2 10 
6 2 8
7 6 2 
--}

-- EJERCICIO 5
maximo :: Tablero -> Integer 
maximo [x] = maximofila x
maximo (x:xs)
    | maximofila x > maximo xs = maximofila x
    | otherwise = maximo xs 

maximofila :: Fila -> Integer
maximofila [x] = x 
maximofila (x:xs)
    | x > maximofila xs = x
    | otherwise = maximofila xs


--- otra manera de hacer el ejercicio 1 es aplicando esta función 
--- las filas y su orden no es relevante (pero me sirve para el 6 je)
unificarFilas :: Tablero -> Fila
unificarFilas [] = [] 
unificarFilas (x:xs) = x ++ unificarFilas xs  

--EJERCICIO 6
masRepetido :: Tablero -> Integer 
masRepetido (x:xs) = masRepetidoalt (unificarFilas (x:xs))

contarEnTablero :: Fila -> Integer -> Integer 
contarEnTablero [] _ = 0
contarEnTablero (x:xs) n 
    |  n == x = 1 + contarEnTablero xs n
    |  otherwise = contarEnTablero xs n

masRepetidoalt :: Fila -> Integer 
masRepetidoalt [] = 0
masRepetidoalt (x:xs)
    | contarEnTablero (x:xs) x > masRepetidoalt xs = x 
    | otherwise = masRepetidoalt xs
 

-- EJERCICIO 7 
valoresDeCamino :: Tablero -> Camino -> [Integer]
valoresDeCamino _ [] = []
valoresDeCamino (t:ts) (c:cs) = buscarColumnaenFila (buscarFilaenTablero (t:ts) (fst c)) (snd c) : valoresDeCamino (t:ts) cs


-- precond = tablero tiene entre 0 y Int filas si o si 
buscarFilaenTablero :: Tablero -> Integer -> Fila 
buscarFilaenTablero (x:xs) n
    | n == 1 = x
    | otherwise = buscarFilaenTablero xs (n-1)

buscarColumnaenFila :: Fila -> Integer -> Integer
buscarColumnaenFila (x:xs) n
    | n == 1 = x
    | otherwise = buscarColumnaenFila xs (n-1)

-- EJERCICIO 8 
esCaminoFibo :: [Integer] -> Integer -> Bool 
esCaminoFibo (x:xs) n = (x:xs) == fibonacciDesdeHasta n (ultimoElemento xs)

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1 
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibonacciDesdeHasta :: Integer -> Integer -> [Integer]
fibonacciDesdeHasta n x 
    | x == n = [fibonacci x] 
    | otherwise = fibonacci n : fibonacciDesdeHasta (n+1) x

ultimoElemento :: [Integer] -> Integer
ultimoElemento [x] = x
ultimoElemento (x:xs) = ultimoElemento xs

