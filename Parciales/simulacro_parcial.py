#EJERCICIO 1
# problema maximas_cantidades_consecutivos (in v: seq⟨Z⟩) : Diccionario⟨Z,Z⟩ {
# requiere: { True }
# asegura: { Las claves de res son exactamente los números que aparecen al menos una vez en v }
# asegura: { Para cada clave k de res, su valor es igual a la máxima cantidad de apariciones consecutivas de k en v, donde dicha cantidad de apariciones es mayor o igual 1. }
# }

def maximas_cantidades_consecutivos(v: list[int]) -> dict[int:int]:
    dic: dict[int:int] = {}
    for i in range(len(v)): 
        if v[i] not in dic.keys(): 
            dic[v[i]] = mayor_cantidad_ap_consecutivas(v, v[i])
    return dic

def mayor_cantidad_ap_consecutivas(v: list[int], x: int) -> int: 
    cant: int = 0 
    mayor_cant: int = 0 
    for i in range (len(v)):
        if v[i] == x: 
            cant += 1 
        else:  
            if cant > mayor_cant: mayor_cant = cant
            cant = 0
            
    if cant > mayor_cant: mayor_cant = cant
    return mayor_cant

# EJERCICIO 2
# problema maxima_cantidad_primos(in A: seq⟨seq⟨Z⟩⟩) : Z 
# { requiere: { Todas las filas de A tienen la misma longitud } 
# asegura: { Existe alguna columna c en A para la cual res de sus
# elementos son números primos }
# asegura: { Todas las columnas de A tienen a lo sumo res
# elementos que son números primos } }

def maxima_cantidad_primos(A:list[list[int]]) -> int: 
    matriz_t:list[list[int]] = trasponer_matriz(A)
    cantidad_P: int = 0 
    cantidad_PM:int = 0
    for f in matriz_t: 
        cantidad_P = contador_primos(f)
        if cantidad_P > cantidad_PM: 
            cantidad_PM = cantidad_P
    if cantidad_P > cantidad_PM: 
        cantidad_PM = cantidad_P
        
    return cantidad_PM

def trasponer_matriz(A:list[list[int]]) -> list[list[int]]:
    nueva_matriz: list[list[int]]= []
    for i in range(len(A[0])):
        fila:list[int] = []
        for x in range(len(A)):
            fila.append(A[x][i])
        nueva_matriz.append(fila)
        
    return nueva_matriz
        
def contador_primos(s: list[int]) -> int: 
    cont: int = 0 
    for i in s :
        if es_primo(i):
            cont += 1 
    return cont 

def es_primo(x:int) -> bool: 
    mult: int = 1
    i: int = 2 
    while i < x and mult == 1:
        if x % i == 0: 
            mult = i
        i += 1
    return mult == 1

# EJERCICIO 3
# Dadas las siguientes definiciones:
# Tupla positiva: par de números enteros en el cual el producto de ambos números es positivo. Ejemplo: (2,3) 
# Tupla negativa: par de números enteros en el cual el producto de ambos números es negativo. Ejemplo: (3,-2) 
# Tupla nula: par de números enteros en el cual el producto de ambos números es igual a cero. Ejemplo: (0,0)
# Se pide resolver:
# problema tuplas_positivas_y_negativas(inout c: Cola⟨ZxZ⟩ ) { 
# requiere: { c no tiene tuplas repetidas }
# modifica: { c }
# asegura: { c contiene todas las tuplas positivas y todas las tuplas negativas de c@pre y además no contiene ninguna otra tupla }
# asegura: { No hay niguna tupla negativa en c que aparezca
# antes que alguna tupla positiva }
# asegura: { Para todas las tuplas positivas t1 y t2 en c, con t1 !=
# t2, si t1 aparece antes que t2 en c@pre, entonces t1 aparece antes que t2 en c }
# asegura: { Para todas las tuplas negativas t1 y t2 en c, con t1 != t2, si t1 aparece antes que t2 en c@pre, entonces t1 aparece antes que t2 en c }
# }

from queue import Queue as Cola

def tuplas_positivas_y_negativas(c: Cola[tuple[int,int]]):
    cola_pos: Cola = Cola()
    cola_neg: Cola = Cola()
    lista_pos: list[tuple[int,int]] = []
    lista_neg: list[tuple[int,int]] = []

    while not c.empty():
        tupla = c.get()
        det = tupla[0] * tupla[1]
        if det > 0 and tupla not in lista_pos: 
            cola_pos.put(tupla)
            lista_pos.append(tupla)
            
        elif det < 0 and tupla not in lista_neg: 
            cola_neg.put(tupla)
            lista_neg.append(tupla)
    
    while not cola_neg.empty():
        tupla_neg = cola_neg.get()
        cola_pos.put(tupla_neg)
    
    while not cola_pos.empty():
        tupla_final = cola_pos.get()
        c.put(tupla_final)
    
            
        # no tengo en cuenta cuando det == 0
    
        
    
c = Cola()
c.put((2,2))
c.put((3,-1))
c.put((0,0))
c.put((2,2))
c.put((1,1))
c.put((3,-4))
c.put((0,0))
c.put((3,-4))

#EJERCICIO 4
# problema resolver_cuenta(in s: string): R {
# requiere: { Cada caracter de s es '+', '-', '.' (separador decimal)
# o es un dígito }
# requiere: { No hay dos operadores consecutivos en s (los
# operadores son '+' y '-') }
# requiere: { El último caracter de s es un dígito }
# requiere: { El primer caracter de s es un dígito o un operador } 
# requiere: { En las posiciones adyacentes a cada aparición de '.'
# en s, hay un dígito }
# requiere: { Entre un operador y el operador inmediato
# siguiente hay a lo sumo(como máximo) un separador decimal } 
# requiere: { Antes del primer operador hay a lo sumo un
# separador decimal }
# requiere: { Después del último operador hay a lo sumo un
# separador decimal }
# asegura: { res es igual al resultado de la operación aritmética
# representada por s }
# }
# Hint: las funciones int o float permiten convertir strings en números enteros o flotantes respectivamente.
# Ejemplo: Para el input "+10" se debe devolver 10.

s_ejemplo1:str = "-10-2.5+10.8"
s_ejemplo2:str = "10+3-8.43"



def resolver_cuenta(s:str) -> int: 
    cuenta:float = 0 
    signo:str = "+"
    numero_entre:str = "0"
    
    for i in range(len(s)):
        if s[i] == "+" or s[i] == "-":
            if signo == "+":
                cuenta += float(numero_entre)
            elif signo == "-":
                cuenta -= float(numero_entre)
            signo:str= s[i]
            numero_entre:str = ""

        else: numero_entre += s[i]
    
    if signo == "+":
        cuenta += float(numero_entre)
    elif signo == "-":
        cuenta -= float(numero_entre)
        
    return cuenta 
            
res = resolver_cuenta(s_ejemplo1)

    















        
