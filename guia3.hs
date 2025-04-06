Mod trabaja con Integers 
— si alguno es cero en 2 e se puede usar guion bajo para lo que no importa 

— Renombre de tipos o alias, nuevo nombre para un tipo de dato que ya existe 
— type T2 = T1

type Tupla = (Integer, Integer)

— i) digitoUnidades dado un número entero, extrae su dígito de las unidades 
—— función recursiva 
—— div devuelve cuantas veces el primer numero puede ser dividido por el segundo 

digitoUnidades :: Integer -> Integer 
digitoUnidades x 
	| if (x > 0) 
	| then let x = 1 + digitoUnidades (div x 10)
	| else let x= 0

digitoUnidades :: Integer -> Integer
digitoUnidades x = mod (abs x) 10

— j) digitoDecenas dado un número entero mayor a 9, extrae su dígito de las decenas 
digitoDecenas :: Integer -> Integer
digitoDecenas x && x < 9 = div x 10
Otherwise = 0
—otherwise = “no es decenas”
