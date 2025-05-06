
-- Ejemplos 
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use null" #-}
frase = ['a','b','e','j','a']
mapeo = [('a','x'), ('b','k'),('c','x')]

-- EJERCICIO 1
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c (x:xs)
    | c == fst x = True
    | otherwise = hayQueCodificar c xs

-- EJERCICIO 2
cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar _ _ [] = 0 
cuantasVecesHayQueCodificar c (y:ys) (x:xs)
    | hayQueCodificar c (x:xs) = cantApariciones c (y:ys)
    | otherwise = 0 

-- AUX ejercicio 2 = cuenta cantidad de apariciones
cantApariciones :: Char -> [Char] -> Int
cantApariciones _ [] = 0
cantApariciones c (x:xs) 
    | c == x = 1 + cantApariciones c xs
    | otherwise = cantApariciones c xs


-- EJERCICIO 3
laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar (y:ys) (x:xs)
    | (quitarTodasApariciones y ys == []) && hayQueCodificar y (x:xs) = y
    | cuantasVecesHayQueCodificar y (y:ys) (x:xs) >= cuantasVecesHayQueCodificar (head fraseSinTodas1Ap) (y:ys) (x:xs) = laQueMasHayQueCodificar fraseSinTodas2Ap (x:xs)
    | otherwise = laQueMasHayQueCodificar fraseSinTodas1Ap (x:xs)

    where 
        fraseSinTodas1Ap = quitarTodasApariciones y (y:ys) 
        fraseSinTodas2Ap = quitarTodasApariciones (head fraseSinTodas1Ap) (y:ys)

-- AUX ej3
quitarTodasApariciones :: Char -> [Char] -> [Char]
quitarTodasApariciones _ [] = [] 
quitarTodasApariciones c (x:xs) 
    | c == x = quitarTodasApariciones c xs
    | otherwise = x : quitarTodasApariciones c xs

-- EJERCICIO 4 
codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase _ [] = []
codificarFrase [] _ = []
codificarFrase (y:ys) (x:xs) 
    | hayQueCodificar y (x:xs) = codificarLetra y (x:xs) : codificarFrase ys (x:xs)
    | otherwise = y : codificarFrase ys (x:xs)

--AUX : codifica un caracter en base a un mapeo (con la condicion que c existe en las primeras componentes de [(Char,Char)])
codificarLetra :: Char -> [(Char,Char)] -> Char
codificarLetra c (x:xs) 
    | c == fst x = snd x
    | otherwise = codificarLetra c xs



