-- import Test.HUnit
module EjerciciosParcial where

--Ejercicio 1 

generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (x:xs) = generarTuplaPrimerElemento : generarStock listaSinPrimer
    where 
        generarTuplaPrimerElemento = (x, cantApariciones x (x:xs))
        listaSinPrimer = quitarTodos x xs

cantApariciones :: (Eq t) => t -> [t] -> Integer
cantApariciones _ [] = 0
cantApariciones x (y:ys)
    | x == y = 1 + cantApariciones x ys 
    | otherwise = cantApariciones x ys  

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos x (y:ys)
    | x == y = quitarTodos x ys
    | otherwise = y : quitarTodos x ys

---Ejemplo ["m", "b", "pera", "pera", "m"]

-- Ejercicio 2
stockDeProducto :: [(String,Integer)] -> String
stockDeProducto 