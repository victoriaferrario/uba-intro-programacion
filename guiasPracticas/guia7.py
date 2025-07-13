#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Guia 7 = Problemas Sobre Listas 
notación de tipos 

x: int 
 : float , : bool, :str
 
x: list [tipo_dato] = [elementos, lista]
x: dict[str,float] = {” c l a v e ” : 2 . 0 }


lista vacia 
un elemento 
dos elementos
el mismo elemento

    

"""

import math 
import random 

# EJERCICIO 1
def pertenece (s: list[int], e:int) -> bool:
    res = False 
    for elemento in s :
        if elemento == e :
            res = True
    return res

def pertenece_2 (s: list[int], e:int) -> bool:
    i = 0
    while s[i] != e and not (i == len(s)-1):
        i += 1
    return i < len(s) or s[-1] == e

def pertenece_str (s: list[str], e:str) -> bool:
    res = False 
    for elemento in s :
        if elemento == e :
            res = True
    return res


# EJERCICIO 2y
def divide_a_todos(s: list[int], e:int) -> bool:
    for elemento in s :
        if elemento % e == 0 :
            res= True 
        else: res = False 
    return res

# EJERCICIO 3
def suma_total(s: list[int]) -> int:
    suma: int = 0 
    for elem in s:
        suma =+ elem
    return suma

# EJERCICIO 4
def maximo (s: list[int]) -> int:
    m = s[0]
    for i in range (1,len(s)):
        if s[i] > m:
            m = s[i]
    return m 

# EJERCICIO 5
def minimo (s: list[int]) -> int:
    m = s[0]
    for i in range (1,len(s),1):
        if s[i] < m:
            m = s[i]
    return m 
        
# EJERCICIO 6
def ordenados (s: list[int]) -> bool:
    cont = 0
    for i in range (len(s)-1):
        if s[i] < s[i+1]: cont += 1
    return cont == len(s)-1

# EJERCICIO 7 
def pos_maximo (s:list[int]) -> int:
    if len(s) == 0 : i = -1
    else:
        i = 0
        while s[i] != maximo(s):
            i += 1
    return i

#EJERCICIO 8 
def pos_minimo (s:list[int]) -> int:
    if len(s) == 0 : i = -1
    else:
        i = 0
        while s[i] != minimo(s):
            i += 1
    return i

#EJERCICIO 9 
def long_mayorASiete (s:list[str]) -> bool:
    x = 0
    for i in s:
        if len(i) > 7 : x+=1
    return x > 0 

#EJERCICIO 10 
#aux 
def reverso (s:str) -> str:
    nueva:str = ""
    for i in range (len(s)-1,-1,-1):
        nueva += s[i]
    return nueva
        
def es_palindroma (s:str) -> bool:    
    return reverso(s) == s

#EJERCICIO 11
def iguales_consecutivos (s: list[int]) -> bool: 
    res = False 
    i = 0
    
    while len(s) >= 3 and res == False:
        if s[i] == s[i+1] == s[i+2]:
            res = True 
        else: iguales_consecutivos(s[1:])
        # representando la "tail" de la lista
        i += 1
        
    return res


#EJERCICIO 12

####### función no usada
def cant_letra (s:str, char:str) -> int: 
    res = 0
    for i in range (len(s)):
        if s[i] == char: res += 1
    return res 
########################################


def vocales_distintas (s:str) -> bool: 
    vocales = ["a","e","i","o","u"]
    cont_vocales_distintas = 0 
    i = 0
    
    while cont_vocales_distintas < 3 and i < len(vocales): 
        if pertenece_str(s, vocales[i]):
            cont_vocales_distintas += 1
        i += 1 
            
    return cont_vocales_distintas >= 3


#EJERCICIO 13
def pos_secuencia_ordenada_mas_larga (s: list[int]) -> int: 
    final: list[int] = [0]
    i: int = 1
    
    while i < len(s):
        e: list[int] = list()
        
        while i < len(s) and s[i-1] <= s[i]: 
            e.append(i-1)
            i += 1
        
        if len(e) > len(final) : final = e
            
        i += 1
        
    return final[:1]
    # debería returnar un integer no una lista con un elemento 
    

# EJERCICIO 14
# aux 
def cant_digitos(s:int) -> int:
    i = 1
    e = 0
    x = s
    while x >= 1:
        e += 1
        x = s / (10 ** i)
        i += 1
    return e 

# aux 
def numero_a_digitos(s:int) -> list[int]: 
    d = cant_digitos(s)
    if  d >= 1:
        lis: list[int] = [math.floor(s / (10 ** (d - 1)))]
                    ## agrego primer numero a la lista       
        lis +=  (numero_a_digitos(s % (10 ** (d-1))))
                    ## recursión sin el primer numero
    else : lis = list()
                    ## caso base                
    return lis

def cantidad_digitos_impares(s: list[int]) -> int:
    cont_impares = 0 
    for numero in s :
        for i in range (cant_digitos(numero)):
            if numero_a_digitos(numero)[i] % 2 != 0:
                cont_impares += 1
    
    return cont_impares
        


# PARTE 2 ##############################################

# EJ 2 ##################

# EJERCICIO 1 
def CeroEnPosicionesPares (s:list[int]):
    for i in range (0,len(s)) :
        if s[i] % 2 == 0: 
            s[i] = 0 
    return s

# EJERCICIO 2
def CeroEnPosicionesPares2 (s:list[int]):
    x = []
    for i in range (0, len(s)):
        if s[i] % 2 == 0 : x.append(0)
        else: x.append(s[i])
    return x

#EJERCICIO 3
def sin_vocales (s:str) -> str:
    vocales = ["a","e","i","o","u"]
    x = ""
    for i in range (len(s)):
        if not(pertenece_str(vocales, s[i])): x += s[i]
    return x

#EJERCICIO 4
def reemplaza_vocales (s:str) -> str:
    vocales = ["a","e","i","o","u"]
    x = ""
    for i in range (len(s)):
        if pertenece_str(vocales, s[i]):
            x += "-"
        else : x += s[i]
    return x

#EJERCICIO 5
def dar_vuelta_str (s:str) -> str:
    x = ""
    for i in range (len(s)):
        x: str = s[i] + x        
    return x

#EJERCICIO 6
#### no especifica nada sobre el orden final, asumo
#### que conservo la ultima aparición de cada caracter

def eliminar_repetidos (s:str) -> str: 
    x = ""
    for i in range (len (s)):
        if not (pertenece_str(s[(i+1):], s[i])):
            x += s[i]
    return x 

    
# EJ 3 ##################
def resultadoMateria (notas: list[int]) -> int :
    ## promedio
    suma_notas = 0 
    res = 3
    
    for nota in notas :
        if nota >= 4: 
            suma_notas += nota 
        else:  
            return res
             
    
    promedio_notas = suma_notas / len(notas)
    
    if promedio_notas >= 7 :
        res = 1
    else: 
        if promedio_notas >= 4 and promedio_notas < 7: 
            res = 2
        else : res = 3 
            
    return res

# EJ 4 ##################
def saldoActual (t: list[tuple()]) -> int: 
    saldo = 0 
    for movimiento in t :
        if movimiento[0] == "I": 
            saldo += movimiento[1]
        else: # en otro caso debe ser "R" de retiro, resto
            saldo = saldo - movimiento[1]
    return saldo 


# PARTE 3 ##############################################

Matriz_num = list[list[int]]

matriz = [[1,2,3],[4,5,6],[1,3]]

def pertenece_a_cada_uno_version_1(s: Matriz_num, e:int, res:list[bool]) :
    for fila in s:
        if pertenece(fila, e):
            res.append(True)
        else: 
            res.append(False)
            

def pertenece_a_cada_uno_version_2(s: Matriz_num, e:int) -> list[bool]:
    res:list[bool] = []

    for fila in s:
        if pertenece(fila, e):
            res.append(True)
        else: 
            res.append(False)
            
    return res
            
# Ejercicio 6 

#(1)
def es_matriz(s: Matriz_num) -> bool:
    cont: int = 0
    if len(s) > 0: 
        for fila in s :
            if len(fila) > 0 and len(fila) == len(s[0]):
                cont += 1
    return cont == len(s) 

#(2)
def filas_ordenadas(m: Matriz_num) -> bool: 
    res=True
    i = 0 
    while i < len(m) and res == True :
        if not ordenados(m[i]):
            res = False 
        i += 1
    return res 

#(3)
def columna(m: Matriz_num, c: int) -> list[int]:
    res: list[int] = []
    for fila in m :
        res.append(fila[c])
    return res

#(4)
def columnas_ordenadas(m: Matriz_num) -> list[bool]:
    res: list[bool] = []
    for c in range (len(m[0])) :
        if ordenados(columna(m, c)):
            res.append(True)
        else: res.append(False)
    return res

#(5)
def trasponer(m: Matriz_num) -> Matriz_num:
    nueva_matriz: Matriz_num = []
    for c in range(len(m[0])):
        nueva_matriz.append(columna(m,c))
        
    return nueva_matriz

## EJEMPLOS
matriz = [[1,8,3],[4,5,6]]

# PARTE 4 ##############################################

def construir_lista()-> list[str]: 
    s: str = ':)'
    res: list[str] = []
    while s != '' and s != 'listo':
        s = input('nombre alumno -->')
        res.append(s)
    return res 

def siete_y_medio() -> tuple(str,list[int]):
    cartas: list[int] = [0,1,2,3,4,5,6,7,10,11,12]
    s:str = 'o:'
    cartas_acumuladas: list[int] = []
    lista_suma: list[int] = []
    while suma_total(lista_suma) != 7.5 and s != 'p':
        s = input('plantao = p * otra más = +')
        if s == '+':
            carta_random = random.choice(cartas)
            cartas_acumuladas.append(carta_random)
            if pertenece([10,11,12], carta_random):
                lista_suma.append(0.5)
            else: lista_suma.append(carta_random)
    
    
    
    
    
    
    
    

    
    
            
            
            
