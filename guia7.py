#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Guia 7 = Problemas Sobre Listas 
notación de tipos 

x: int 
 : float , : bool, :str
 
x: list [tipo_dato] = [elementos, lista]
x: dict[str,float] = {” c l a v e ” : 2 . 0 }


"""

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

"""
lista vacia 
un elemento 
dos elementos
el mismo elemento
"""
    

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


#FALTAN del 11 al 14





# PARTE 2 ##############################################

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
            
            
            
            
