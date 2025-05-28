#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed May 28 11:52:36 2025

@author: Estudiante
"""

notas = [('n', 1), ('t', 3), ('n', 8)]

def calcular_promedio_por_studiante(notas: list[tuple[str,float]]) -> dict[str, int]:
    aux: dict['str', list[float]] = {}
    for (nombre,nota) in notas: 
        aux[nombre] = []
    for (nombre, nota) in notas: 
        aux[nombre].append(nota)
        
    res: dict['str', float] = {}
    for nombre in aux.keys():
        res[nombre] = promedio(aux[nombre])
        
    return res


def promedio(notas: list[float]) -> float:
    suma:float = 0 
    for nota in notas :
        suma += nota 
    return suma / len(notas)


# ARCHIVOS 
#Ejercicio 19 

def contar_lineas(nombre_archivo: str) -> int :
    archivo = open(nombre_archivo)
    texto = archivo.read()
    
    lineas : int = 0
    for i in texto :
        if i == '\n':
            lineas += 1
    archivo.close()
    
    return lineas 

def existe_palabra(nombre_archivo : str, palabra : str) -> int:
    archivo = open(nombre_archivo)
    texto = archivo.read()
    
    existe_palabra : bool = False
    
    i: int = 0 
    x: int = 0 
    cont : int = 0 
    while i < len(texto) and not existe_palabra:        
        if palabra[x] == texto[i]:
            cont += 1
            x += 1
        else :
            x = 0
            cont = 0
        i += 1
            
        if cont == len(palabra):
            existe_palabra = True 
    
    return existe_palabra
    
def clonar_sin_comentarios(nombre_archivo: str):
    archivo = open(nombre_archivo)
    clonado = open('clon' + nombre_archivo, "w")
    
    for i in archivo.readlines():
        x:int = 0
        while x < len(i) and i[x] != ' ': 
            if i[x] != '#':
                clonado.write(i[x])
            x += 1
    archivo.close()

clonar_sin_comentarios("existe.txt") 

def agrupar_por_longitud(nombre_archivo:str) -> dict[int:int]:
    
    pass
    
def la_palabra_mas_frecuente():
    pass
    
    