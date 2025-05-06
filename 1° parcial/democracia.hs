{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use /=" #-}
{-# HLINT ignore "Use uncurry" #-}


{--
=======================
 Viva la democracia:
=======================

A continuación presentamos una serie de ejercicios que tienen como objetivo implementar funciones 
para sistema de escrutinio de una elección presidencial. Leer las descripciones y especificaciones 
e implementar las funciones requeridas en Haskell, utilizado sóĺamente las herramientas vistas en clase.

Las fórmulas presidenciales serán representadas por tuplas (String x String), donde la primera componente será 
el nombre del candidato a presidente, y la segunda componente será el nombre del candidato a vicepresidente.
En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la 

lista votos representará la cantidad de votos obtenidos por la fórmula del parámetro formulas en esa misma posición. 
Por ejemplo, si la lista de fórmulas es [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] y 
la lista de votos fuera [34, 56], eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, 
y la lista encabezada por Juan Pérez obtuvo 34 votos.

___________________________________________________________________________________________________________________

1) Porcentaje de Votos Afirmativos [1 punto]
problema porcentajeDeVotosAfirmativos (formulas: seq⟨String x String⟩,votos:seq< Z >, cantTotalVotos: Z) : R {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {La suma de todos los elementos de votos es menor o igual a cantTotalVotos}
 asegura: {res es el porcentaje de votos no blancos (es decir, asociados a alguna de las fórmulas) sobre el total de votos emitidos}
}
Para resolver este ejercicio pueden utilizar la siguiente función que devuelve como Float la división entre dos números de tipo Int:
--}

division :: Int -> Int -> Float
division a b = (fromIntegral a) / (fromIntegral b)

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos _ _  0 = 0 
porcentajeDeVotosAfirmativos (y:ys) (x:xs) n = (division votosAfirmativos n ) * 100
    where votosAfirmativos = sumatoria (x:xs)

-- AUX : toma los elementos de una lista y los suma
sumatoria :: (Num t) => [t] -> t 
sumatoria [x] = x 
sumatoria (x:xs) = x + sumatoria xs


{--
2) Formulas Inválidas [3 puntos]
problema formulasInvalidas (formulas: seq⟨String x String⟩) : Bool {
 requiere: {True}
 asegura: {(res = true) <=> formulas contiene un candidato se propone para presidente y vicepresidente en la misma fórmula; 
  o algún candidato se postula para presidente o vice en más de una fórmula }
--}
formulasInvalidas :: [(String,String)] -> Bool 
formulasInvalidas [] = False 
formulasInvalidas (x:xs)
    | existeEnOtrasFormulas (fst x) xs || existeEnOtrasFormulas (snd x) xs ||  fst x == snd x = True 
    | otherwise = formulasInvalidas xs 

-- AUX : comprueba que no exista el primer parametro en cualquier posición de las formulas ingresadas
existeEnOtrasFormulas :: String -> [(String,String)] -> Bool 
existeEnOtrasFormulas _ [] = False
existeEnOtrasFormulas s (x:xs)
    | s == fst x || s == snd x = True 
    | otherwise = existeEnOtrasFormulas s xs 


{--
3) Porcentaje de Votos [3 puntos]
 problema porcentajeDeVotos (vice: String, formulas: seq⟨String x String⟩,votos:seq< Z >) : R {
  requiere: {La segunda componente de algún elemento de formulas es vice}
  requiere: {¬formulasInvalidas(formulas)}
  requiere: {|formulas| = |votos|}
  requiere: {Todos los elementos de votos son mayores o iguales a 0}
  requiere: {Hay al menos un elemento de votos mayores estricto a 0}
  asegura: {res es el porcentaje de votos que obtuvo vice sobre el total de votos afirmativos}
 Para resolver este ejercicio pueden utilizar la función division presentada en el Ejercicio 1.
--}
porcentajeDeVotos :: String -> [(String,String)] -> [Int] -> Float
porcentajeDeVotos v (x:xs) (y:ys)
    | v == snd x = (division y (sumatoria (y:ys))) * 100 
    | otherwise = porcentajeDeVotos v (xs ++ [x]) (ys ++ [y])



{--
4) Menos Votado [3 puntos]
problema menosVotado (formulas: seq⟨String x String⟩, votos:seq< Z >) : String {
 requiere: {¬formulasInvalidas(formulas)}
 requiere: {|formulas| = |votos|}
 requiere: {Todos los elementos de votos son mayores o iguales a 0}
 requiere: {Hay al menos un elemento de votos mayores estricto a 0}
 requiere: {|formulas| > 0}
 asegura: {res es el candidato a presidente de formulas menos votado de acuerdo a los votos contabilizados en votos}
 A continuación te dejamos una estructura básica para resolver los ejercicios. Este código no pretende resolver ningun caso de los ejercicios planteados, es sólo una plantilla.
--}

menosVotado :: [(String,String)] -> [Int] -> String
menosVotado (y:[]) _ = fst y
menosVotado (y:ys) (x:xs)
    | x >= head xs =  menosVotado ys xs 
    | otherwise = menosVotado (y:tail ys) (x:tail xs)


