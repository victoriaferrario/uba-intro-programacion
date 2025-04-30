import Distribution.Simple.Utils (xargs)

{--
Guia Práctica 5: Recursión sobre listas 
--}

--- Ejercicio 1
----- 1.1

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs 

----- 1.2
-- precond: (x:xs) tiene al menos 1 elemento 
ultimo :: [t] -> t
ultimo (x:xs)
    |  longitud xs == 0 = x
    |  otherwise = ultimo xs

----- 1.3 
-- precondicion (x:xs) tiene al menos 1 elemento 
principio :: (Eq t) => [t] -> [t]
principio [x] = []
principio (x:xs) = reverso (tail (reverso (x:xs)))

----- 1.4
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

--- Ejercicio 2
----- 2.1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e [] = False
pertenece e (x:xs) 
    | e == x = True 
    | otherwise = pertenece e xs 

----- 2.2
todosIguales :: (Eq t) => [t] -> Bool 
todosIguales [] = False
todosIguales [x] = True
todosIguales (x:xs) = pertenece x xs && todosIguales xs

----- 2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True 
todosDistintos [x] = True
todosDistintos (x:xs) = not(pertenece x xs) && todosDistintos xs

----- 2.4
hayRepetidos :: (Eq t) => [t] -> Bool 
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) 
    | pertenece x xs = True 
    | otherwise = hayRepetidos xs 

----- 2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar e [] = []
quitar e (x:xs)
    | e == x = xs 
    | otherwise = x : quitar e xs

---- 2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos e [] = []
quitarTodos e (x:xs)
    | e == x = quitarTodos e xs 
    | otherwise = x : quitarTodos e xs 

----- 2.7 
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) = x : eliminarRepetidos (quitarTodos x xs)

----- 2.8 
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True 
mismosElementos (x:xs) [] = False
-- mismosElementos [] (y:ys) = False
mismosElementos (x:xs) (y:ys) 
    | primer_elementox_pertenecelistay = mismosElementos (quitar x xs) (quitar x (y:ys)) 
    | otherwise = False
    where
        primer_elementox_pertenecelistay = pertenece x (eliminarRepetidos(y:ys))
        primer_elementoy_pertenecelistax = pertenece y (eliminarRepetidos(x:xs))

----- 2.9
capicua :: (Eq t) => [t] -> Bool
capicua x = x == reverso x

--- Ejercicio 3
----- 3.1
sumatoria :: (Num t) => [t] -> t
sumatoria [] = 0 
-- sumatoria [x] = x ----> no hace falta este caso base 
sumatoria (x:xs) = head (x:xs) + sumatoria xs 

----- 3.2
productoria :: [Integer] -> Integer 
productoria [] = 0 
productoria (x:xs) = x * productoria xs

----- 3.3
-- requiere modulo de s > 0 --> no agrego caso base de lista vacia 
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) 
    | x >= head xs = maximo (tail xs ++ [x] )
    |otherwise = maximo xs 

maximoN :: [Integer] -> Integer 
maximoN (x:[]) = x
maximoN (x:xs) 
    | x > maximoN xs = x
    | otherwise = maximoN xs


----- 3.4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN 0  y = y 
sumarN n (x:xs) = (x + n) : sumarN n xs

----- 3.5
-- requiere modulo de s > 0 --> no agrego caso base de lista vacia 
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

----- 3.6
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN ultimo (x:xs)
    where ultimo = head (reverso xs)

----- 3.7
pares :: [Integer] -> [Integer]
pares [] =[]
pares (x:xs)
    | mod x 2 == 0  = x : pares xs
    | otherwise = pares xs

----- 3.8
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n (x:xs)
    | mod x n == 0 = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs 

----- 3.9
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar y = ordenar ( quitar (maximo y) y) ++ [maximo y]

--- Ejercicio 4
----- 4(a)
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
-- aca si agregue el caso base de un elemento porque no puedo hacer el head de una lista vacia 
sacarBlancosRepetidos (x:xs)
    | (x == head xs) && (x == ' ') = ' ' : sacarBlancosRepetidos (tail xs)
    | otherwise = x : sacarBlancosRepetidos xs 

----- 4(b)
contarPalabras :: [Char] -> Integer 
contarPalabras [] = 0 
contarPalabras x = contarSinEspacioPrinciFin ( listaLimpia )
    where 
        listaLimpia = sacarespaciosprincipiofinal (x)
        -- lo divido asi porque en cada recursión elimino el primer
        -- elemento de espacio y no lo puedo medir 

sacarespaciosprincipiofinal :: [Char] -> [Char]
sacarespaciosprincipiofinal [x] = [x]
sacarespaciosprincipiofinal (x:xs) 
    | (x == ' ') && (head (reverso xs)  == ' ') = sacarBlancosRepetidos(reverso (tail (reverso xs)))
    | (x == ' ') = sacarBlancosRepetidos xs
    | (head (reverso xs)  == ' ') = sacarBlancosRepetidos (tail (reverso (x:xs)))
    | otherwise = x:xs

contarSinEspacioPrinciFin :: [Char] -> Integer
contarSinEspacioPrinciFin [] = 0
contarSinEspacioPrinciFin [x] = 1
contarSinEspacioPrinciFin (x:xs)
    | x == ' ' = 1 + contarSinEspacioPrinciFin xs
    | otherwise = contarSinEspacioPrinciFin xs

----- 4(c)
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras s = primeraP : palabras (sacarpalabra primeraP sLimpia)
    where 
        primeraP = primeraPalabra (sacarespaciosprincipiofinal s)
        sLimpia = sacarespaciosprincipiofinal s
-- palabras (x:xs)

-- precond lista limpia 
primeraPalabra ::[Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs)
    | x == ' ' =  []
    | otherwise = x : primeraPalabra xs

-- Ejemplo = ['h','o',' ','l','a',' ','e']

sacarpalabra :: [Char] -> [Char] -> [Char]
sacarpalabra _ [] = []
sacarpalabra [] y = y
sacarpalabra s (x:xs)
    | head s == x = sacarpalabra (tail s) xs


--- Ejercicio 5
----- 5.1
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada x = sumaAcumulada menosElUltimo ++  [sumatoria x]
    where menosElUltimo = reverso(tail (reverso x))

----- 5.2 
-- descomponerEnPrimos :: [Integer] -> [[Integer]]





--- Ejercicio 6

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

elNombre :: Contacto -> Nombre 
elNombre = fst 
elTelefono :: Contacto -> Telefono
elTelefono = snd

----- 6.1
enLosContactos :: Nombre -> ContactosTel -> Bool 
enLosContactos n [] = False 
enLosContactos n (x:xs)
    | n == elNombre x = True 
    | otherwise = enLosContactos n xs 

----- 6.2
agregarContacto :: Contacto -> ContactosTel -> ContactosTel 
agregarContacto cnt [] = [cnt]
agregarContacto cnt lisCont
    | enLosContactos (elNombre cnt) lisCont = buscaActualizaNumero cnt lisCont
    | otherwise = cnt : lisCont

---- precond: lista no vacia y se que E nombre en los contactosTel
buscaActualizaNumero :: Contacto -> ContactosTel -> ContactosTel 
buscaActualizaNumero cnt (x:xs)
    | elNombre cnt == elNombre x =  actualizaNum : xs
    | otherwise = buscaActualizaNumero cnt xs ++ [x]
    where  actualizaNum = (elNombre x , elTelefono cnt)

----- 6.3
eliminarContacto :: Nombre -> ContactosTel -> ContactosTel 
eliminarContacto n x 
    | not (enLosContactos n x) = x
    | otherwise = buscaSacaContacto n x 

buscaSacaContacto :: Nombre -> ContactosTel -> ContactosTel 
buscaSacaContacto n [] = []
buscaSacaContacto n (x:xs)
    | n == fst x = buscaSacaContacto n xs 
    | otherwise = x : buscaSacaContacto n xs 


{-- contactos prueba = [ 
    (['a','n','a'],['1','2','3']), 
    (['a','b','a'],['1','2','3']),
    (['a','l','e'],['4','5','5'])
    ]
--}

--- Ejercicio 7

type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool

--- 7.1
existeElLocker :: Identificacion -> MapaDeLockers -> Bool 
existeElLocker _ [] = False
existeElLocker id mapa 
    | id == fst (head mapa) = True
    | otherwise = existeElLocker id (tail mapa )

--- 7.2
-- precond : mapa exististe en la facultad
ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion 
ubicacionDelLocker _ [] = []
ubicacionDelLocker id mapa 
    | id == fst (head mapa) = snd (snd (head mapa))
    | otherwise = ubicacionDelLocker id (tail mapa)

--- 7.3
estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool 
estaDisponibleElLocker _ [] = False
estaDisponibleElLocker id mapa 
    | id == fst (head mapa) = fst (snd (head mapa))
    | otherwise = estaDisponibleElLocker id (tail mapa)

--- 7.4
ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker id mapa 
    | id == fst(head mapa) && not(fst(snd(head mapa))) = (id, (True, snd(snd(head mapa)))) : tail mapa
    | otherwise =  ocuparLocker id (tail mapa) ++ [head mapa]
