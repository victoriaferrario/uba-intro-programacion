-- import Test.HUnit
module EjerciciosParcial where

-- EJEMPLOS para probar funciones a falta de testing :(
stock = [("manzana",20),("banana",1),("pera",10),("kiwi",13)]
precios = [("manzana", 3.2),("banana", 3.4),("pera", 8),("kiwi", 3.1)]


{--
SISTEMA DE STOCK 

Una reconocida empresa de comercio electr ́onico nos pide desarrollar un sistema
de stock de mercader ́ıa. La mercader ́ıa de la empresa va a ser representada 
como una secuencia de nombres de los productos, donde puede haber productos 
repetidos. El stock va a ser representado como una secuencia de tuplas de dos 
elementos, donde el primero es el nombre del producto y el segundo es la cantidad 
que hay en stock (en este caso no hay nombre de productos repetidos). 

Tambi ́en se cuenta con una lista de precios de productos representada como una
secuencia de tuplas de dos elementos, donde el primero es el nombre del 
producto y el segundo es el precio.

Para implementar este sistema nos enviaron las siguientes especificaciones 
y nos pidieron que hagamos el desarrollo enteramente en Haskell, utilizando 
los tipos requeridos y solamente las funciones que se ven en la materia 
Introducci ́on a la Programaci ́on / Algoritmos y Estructuras de Datos I 
(FCEyN-UBA).
--}



{--
EJERCICIO 1. Implementar la funci ́on generarStock :: [String] ->[(String, Int)]
problema generarStock (mercader ́ıa: seq⟨String⟩) : seq⟨String × Z⟩ { requiere: {True}
asegura: { La longitud de res es igual a la cantidad de productos distintos que hay en mercader ́ıa}
asegura: {Para cada producto que pertenece a mercader ́ıa, existe un i tal que 0 ≤ i < |res| y res[i]0=producto y res[i]1 es igual a la cantidad de veces que aparece producto en mercader ́ıa}
}
--}
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


{--
EJERCICIO 2. Implementar la funci ́on stockDeProducto :: [(String, Int))] ->String
problema stockDeProducto (stock: seq⟨String × Z⟩, producto: String ) : Z {
requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
asegura: {si no existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a 0 } asegura: {si existe un i tal que 0 ≤ i < |stock| y producto = stock[i]0 entonces res es igual a stock[i]1 }
}
--}
stockDeProducto :: [(String,Integer)] -> String -> Integer
stockDeProducto [] _ = 0
stockDeProducto (x:xs) p 
    | fst x == p = snd x
    | otherwise = stockDeProducto xs p 



{--
EJERCICIO 3. Implementar la funci ́on dineroEnStock :: [(String, Int))] ->[(String, Float)] ->Float
problemadineroEnStock(stock:seq⟨String×Z⟩,precios:seq⟨String×R⟩):R {
requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock}
requiere: {No existen dos nombres de productos (primeras componentes) iguales en precios}
requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
requiere: {Todos los precios (segundas componentes) de precios son mayores a cero}
requiere: {Todo producto de stock aparece en la lista de precios}
asegura: {res es igual a la suma de los precios de todos los productos que est ́an en stock multiplicado por la cantidad de cada producto que hay en stock}
}
Para resolver este ejercicio pueden utilizar la funci ́on del Preludio de Haskell fromIntegral que dado un valor de tipo Int devuelve su equivalente de tipo Float.
--}
dineroEnStock ::[(String, Int)] ->[(String, Double)] ->Double
dineroEnStock [] _ = 0
dineroEnStock (x:xs) (y:ys) = precioPorCantidad + dineroEnStock xs (y:ys)
    where precioPorCantidad = precioDeProducto (fst x) (y:ys) * fromIntegral(snd x)

-- precond: todo producto de la lista de precios existe en la de productos
precioDeProducto :: String ->[(String, Double)] -> Double
precioDeProducto p (x:xs)
    | p == fst x = snd x 
    | otherwise = precioDeProducto p xs


{--
Ejercicio 4. Implementar la funci ́on aplicarOferta :: [(String, Int)] ->[(String, Float)] ->[(String,Float)]
problemaaplicarOferta(stock:seq⟨String×Z⟩,precios:seq⟨String×R⟩):seq⟨String×R⟩ { requiere: {No existen dos nombres de productos (primeras componentes) iguales en stock} requiere: {No existen dos nombres de productos (primeras componentes) iguales en precios} requiere: {Todas las cantidades (segundas componentes) de stock son mayores a cero}
requiere: {Todos los precios (segundas componentes) de precios son mayores a cero}
requiere: {Todo producto de stock aparece en la lista de precios}
asegura: {|res| = |precios|}
asegura: {Para todo 0 ≤ i < |precios|, si stockDeProducto(stock, precios[i]0) > 10, entonces res[i]0 = precios[i]0 y res[i]1 = precios[i]1∗ 0,80}
asegura: {Para todo 0 ≤ i < |precios|, si stockDeProducto(stock, precios[i]0) ≤ 10, entonces res[i]0 = precios[i]0 y
res[i]1 = precios[i]1 } }
--}
-- basicamente que si hay mas (estricto) de 10 en stock se hace un 80% descuento 
aplicarOferta :: [(String, Integer)] -> [(String, Double)] -> [(String, Double)]
aplicarOferta [] _ = []
aplicarOferta (x:xs) (y:ys)
    | snd x > 10 = (fst x, precioDescuento) : aplicarOferta xs (y:ys)
    | otherwise = (fst x, precioSinDescuento) : aplicarOferta xs (y:ys)
    where
        precioSinDescuento = precioDeProducto (fst x) (y:ys)
        precioDescuento = precioSinDescuento * 0.80

