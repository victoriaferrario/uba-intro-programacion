{--
problema relacionesValidas (relaciones: seq⟨String x String⟩) : Bool {
  requiere: {True}
  asegura: {(res = true) <=> relaciones no contiene ni tuplas repetidas1, ni tuplas con ambas componentes iguales}
}
1 A los fines de este problema consideraremos que dos tuplas son iguales si el par de elementos que las componen (sin importar el orden) son iguales. 
--}

type Relaciones = [(String,String)]


relacionesValidas :: Relaciones -> Bool 
relacionesValidas (x:[]) = True
relacionesValidas (x:xs)
    | tuplaRepetida x xs = False 
    | otherwise = relacionesValidas xs 


tuplaRepetida :: (String,String) -> Relaciones -> Bool 
tuplaRepetida _ [] = False 
tuplaRepetida n (x:xs)
    | n == x || (fst n == snd x && snd n == fst x) = True 
    | otherwise = tuplaRepetida n xs


{--
problema personas (relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res no tiene elementos repetidos}
  asegura: {res tiene exactamente los elementos que figuran en alguna tupla de relaciones, en cualquiera de sus posiciones}
}
--}
relaciones = [("a","b"),("c","b"),("a","b")]

personas :: Relaciones -> [String]
personas [] = []
personas (x:xs) = sinRepetidos (relacionesALista (x:xs))


relacionesALista :: Relaciones -> [String]
relacionesALista [] = []
relacionesALista (x:xs) = fst x : snd x : relacionesALista xs

quitarTodasApariciones :: (Eq t) => t -> [t] -> [t]
quitarTodasApariciones _ [] = []
quitarTodasApariciones n (x:xs)
    | n == x = quitarTodasApariciones n xs
    | otherwise = x : quitarTodasApariciones n xs 

sinRepetidos :: (Eq t) => [t] -> [t]
sinRepetidos (x:[]) = [x]
sinRepetidos (x:xs) = x : sinRepetidos (quitarTodasApariciones x xs)


{--
problema amigosDe (persona: String, relaciones: seq⟨String x String⟩) : seq⟨String⟩ {
  requiere: {relacionesValidas(relaciones)}
  asegura: {res tiene exactamente los elementos que figuran en las tuplas de relaciones en las que una de sus componentes es persona}
} 
--}

