#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May 12 11:43:10 2025

@author: Estudiante
"""
import math


# EJERCICIO 1

def imprimir_hola_mundo():
        print("Hola Mundo")
        
def imprimir_un_verso():
    print('yeeeeaaaa \n yeaaaaaEA \n yeEeiEeeee')
    
def raizDe2():
    res : float = round(math.sqrt(2), 4)
    return res
# round (a roundear, cantidad de decimales )

def factorial_de_dos() -> int:
    return (1*2)

def perimetro() -> float:
    return (2 * math.pi)

#EJERCICIO 2
def imprimir_saludo (nombre : str) -> str: 
    print ("Hola", nombre)
    
def raiz_cuatrada_de(n : int) -> float:
    return round(math.sqrt(n), 4)

def fahrenheit_a_celcius (n: float) -> float:
    return ((n-32)*5)/9

def imprimir_dos_veces(estribillo : str):
    print (estribillo*2)
    
def es_multiplo_de(n : int, m : int) -> bool :
    return m % n == 0

def es_par(numero: int) -> bool:
    return es_multiplo_de(numero, 2)

def cantidad_de_pizzas(comensales:int, min_cant_porciones):
    return math.ceil((comensales*min_cant_porciones)/8)
# math.ceil redondea para arriba

# EJERCICIO 2
def alguno_es_0 (numero1 , numero2):
    return numero1 == 0 or numero2 == 0
    
def ambos_son_0 (numero1, numero2):
    return numero1 == 0 and numero2 == 0 

def es_nombre_largo (nombre: str) -> bool:
    return len(nombre) > 4 and len(nombre) < 9

def es_biciesto (año : int) -> bool:
    return (año % 400 == 0) or ((año % 4 == 0) and not (año % 100 == 0))


# EJERCICIO 4

def peso_pino (centimetros: int) -> int:
    # 3 kg  de 1 a 3 metros 
    # 2 kg  de 3 metros adelante
    res : int = 0
    if centimetros >= 300:
        res = 900 + ((centimetros - 300) * 2)
    else:
        res = centimetros * 3
    return res

def es_peso_util(peso) -> bool:
    return peso >= 400 and peso <=1100

def sirve_pino(altura:int) -> bool:
    return es_peso_util(peso_pino(altura))

#EJERICIO 5 
def devolver_el_doble_si_es_par(numero:int):
    if (numero % 2 == 0):
         res = numero * 2
    else : res = numero
    return res 

def devolver_valor_si_es_par_sino_el_que_sigue (numero:int):
    if (numero % 2 == 0):
         res = numero * 2
    else : res = numero + 1
    return res 

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9 (numero:int):
    if (numero % 9 == 0):
        res = numero * 3
    else:
        if (numero % 3 == 0):
            res = numero * 2
        else : res = numero
    return res

def lindo_nombre (nombre:str) -> str: 
    if (len(nombre) >= 5):
        print("Tu nombre es lindo!")
    else: 
        print ("Nombre de mierda eh")

def elRango (numero : int):
    if numero > 20:
        print ("Mayor a dos")
    else: 
        if numero < 5:
            print ("Menor a cinco")
        else : print ("Entre 5 y 20")

def vacas_o_pala (sexo:str, edad:int) -> str:
    if (sexo == "Femenino" and edad >= 65) or (sexo == "Masculino" and edad >=60) or edad < 18:
        print ("vacas yey")
    else : print("trabajaar")
    
# EJERCICIO 6

def uno_al_diez():
    for num in range(1,10,1):
        print (num)
        
def numeros_pares_entre10y40 () -> None:
    i = 10
    while i <= 40 :
        if (i % 2 == 0):
            print ( i )
        i += 1




























