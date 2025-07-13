from queue import Queue as Cola
# Parcial Victoria Ferrario 1C2025

# Ejercicio 1
def cantidad_parejas_que_suman(s: list[int], n: int) -> int:
    tuplas_lista:list[tuple[int,int]] = generar_tuplas_posibles(s)
    res:list[tuple[int,int]] = []
    for (x,y) in tuplas_lista: 
        #sumo ambas componentes de las tuplas posibles si da n agrego a res
        if x+y == n :
            # podría generar un contador alternativamente
            res.append((x,y))
    return len(res)

# AUX: dada una lista, genera todas las tuplas posibles
def generar_tuplas_posibles(s: list[int]) -> list[tuple[int,int]]:
    res:list[tuple[int,int]] =[]
    copia:list[int] = s.copy()
    for i in range(len(s)):
        primer_el:int = copia.pop(0)
        for n in copia:
            res.append((primer_el, n))
    return res


# Ejercicio 2 
def pasar_por_autoservicio(clientes: Cola[tuple[str, str, int]]) -> str:
    copia_clientes_esperando: Cola[tuple[str, str, int]] = Cola()
    ya_paso: bool = False
    nombre_cliente_paso: str = "aquí va el nombre"
    
    while not clientes.empty():
        cliente: tuple[str, str, int] = clientes.get()
        if cliente[1] != "efectivo" and cliente[2] <= 15 and ya_paso == False and cliente[2] > 0: 
            ya_paso = True 
            nombre_cliente_paso = cliente[0]
        else: 
            copia_clientes_esperando.put(cliente)
            
    # Restauro Cola sin el primer cliente que cumple las condiciones
    while not copia_clientes_esperando.empty():
        quedo: tuple[str,str,int] = copia_clientes_esperando.get()
        clientes.put(quedo)
        
    return nombre_cliente_paso


# Ejercicio 3 
def intercambiar_e_invertir_columnas(A: list[list[int]], col1: int, col2: int) -> None:
    # Para manejarme con más facilidad traspongo la matriz
    #  trabajo con filas, no con columnas, y cuando la cambio por la original
    #  la traspongo devuelta ;)
    
    matriz_t: list[list[int]] = trasponer_m(A)
    matriz_t = invertir_fila(matriz_t, col1)
    matriz_t = invertir_fila(matriz_t, col2)
    
    columna_cambiar1 = matriz_t[col1]
    columna_cambiar2 = matriz_t[col2]
    
    for i in range(len(matriz_t)):
        if i == col1 :
            matriz_t[i] = columna_cambiar2
        elif i == col2: 
            matriz_t[i] = columna_cambiar1
            
    # Al ser inout devuelvo el resultado cambiando el paramentro de entrada
    final = trasponer_m(matriz_t)
    for i in range(len(A)): 
        A[i] = final[i]
        
#AUX: cambia las columnas por filas
def trasponer_m(A: list[list[int]]) -> list[list[int]]:
    B: list[list[int]] = []
    for i in range(len(A[0])):
        fila_nueva: list[int] = []
        for fila in A:
            fila_nueva.append(fila[i])
        B.append(fila_nueva)
    return B 
#AUX: invierte el orden de los elementos en una fila n-esima
def invertir_fila(A: list[list[int]], n:int) -> list[list[int]]:
    res: list[list[int]] = []
    for i in range(len(A)):
        if i == n:
            res.append(invertir_lista(A[i]))
        else: res.append(A[i])
    return res
#AUX: invierte el orden de una lista
def invertir_lista(s: list[int]) -> list[int]:
    res: list[int] = []
    for i in range(len(s)-1,-1,-1):
        res.append(s[i])
    return res


# Ejercicio 4
# precond: las claves de censo1 = censo2 -> ambos misma len
def mantuvieron_residencia(censo1: dict[str, str], censo2: dict[str, str]) -> dict[str, int]:
    localidades_cant: dict[str, int] = {}
    for nombre in censo1.keys():
        if censo1[nombre] == censo2[nombre]:
            if censo1[nombre] not in localidades_cant.keys():
                localidades_cant[censo1[nombre]] = 1
            else: localidades_cant[censo1[nombre]] += 1
    return localidades_cant





































