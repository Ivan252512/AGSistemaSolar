import numpy as np
import random
from funcionOptimizada import f
import multiprocessing

"""Algoritmo genético"""

"""Genera cadenas binarias de n bits"""

def generaIndividuo(bits):
    cadena=""
    for i in range(bits):
        cadena+=str(random.randint(0, 1))
    return cadena

"""Convierte valores binarios a decimales con punto decimal, en el intervalo
   [a,b]"""

def binToDec(bin,a,b):
    n=len(bin)
    dec=0
    for i in bin:
        if i=='1':
            dec+=2**(n-1)
        n-=1
    return  a+((dec)/(2**len(bin)-1))*(b-a)

"""Función de reproducción, cruza los "genes" de dos individuos, se utiliza
   cruce uniforme"""

def cruza(bin1,bin2):
    if(len(bin1)==len(bin2)):
        hijo=""
        for i in range(len(bin1)):
            rand=random.randint(0,1)
            if (rand==0):
                hijo+=bin1[i]
            else:
                hijo+=bin2[i]
        return hijo
    else:
        return ("Los binarios deben tener la misma longitud difieren en " +
                 str(abs(len(bin1)-len(bin2))) + " dígitos.")

"""Función de mutación, cambia aleatoriamente el valor de un gen"""

def mutacion(bin):
    rand=random.randint(0,len(bin)-1)
    if(bin[rand]=="0"):
        bin[rand]="1"
    if(bin[rand]=="1"):
        bin[rand]="0"
    return bin

"""Crea una población de individuos"""
def poblacion(cantidad,bitsDeCadaIndividuo):
    pob=[]
    for i in range(cantidad):
        pob.append(generaIndividuo(bitsDeCadaIndividuo))
    return pob


"""Algoritmo de selección de mínimos, recibe una función de evaluación y una
   lista con individuos(cadenas de binarios) a evaluar, selecciona al 50% más
   apto, los reproduce y la descendencia remplaza al 50% menos apto"""

def eval(x):
    return [f(x[0],x[1],x[2]),x[3],x[4],x[2]]

resultado = []

evaluaciones = []
def evolucion(a,b,individuosx,individuosy,iteraciones):
    global evaluaciones, resultado
    print("---------------------------------------------------------")
    if len(individuosx)!=len(individuosy):
        return "Las poblaciones iniciales deben tener la misma longitud."
    #Selección

    aEvaluar = []

    for i in range(len(individuosx)):
        aEvaluar.append([binToDec(individuosx[i],a,b),
                         binToDec(individuosy[i],a,b),
                         iteraciones,
                         individuosx[i],
                         individuosy[i]])

    p = multiprocessing.Pool(4)
    evaluacion = p.map(eval, aEvaluar)


    evaluacion.sort()

    for i in evaluacion:
        resultado.append([i[0] + iteraciones/10, i[1],i[2],i[3]])

    mejores50=evaluacion[:int(0.5*len(evaluacion))]
    #Reproducción
    hijos=[]
    mejores50bin=[]
    for i in range(len(mejores50)):
        mejores50bin.append([mejores50[i][1],mejores50[i][2]])
        hijos.append([cruza(mejores50[random.randint(0,len(mejores50)-1)][1],
                            mejores50[random.randint(0,len(mejores50)-1)][1]),
                      cruza(mejores50[random.randint(0,len(mejores50)-1)][2],
                            mejores50[random.randint(0,len(mejores50)-1)][2])])
    #Mutación, solo los hijos mutan, escogemos el 10% al azar, 5 veces.
    for i in range(int(len(hijos)*0.4)):
        for i in range(len(hijos[0])/4):
            randx=random.randint(0,len(hijos)-1)
            hijos[randx][0]=mutacion(hijos[randx][0])
            randy=random.randint(0,len(hijos)-1)
            hijos[randy][1]=mutacion(hijos[randy][1])
    #Junta a los padres y a los hijos
    nuevaGeneracion=mejores50bin+hijos
    genx=[]
    geny=[]
    for i in range(len(nuevaGeneracion)):
        genx.append(nuevaGeneracion[i][0])
        geny.append(nuevaGeneracion[i][1])

    if(iteraciones==0):
        resultado.sort()
        decimales=[]
        for i in resultado:
            decimales.append([binToDec(i[1],a,b),binToDec(i[2],a,b),
                              i[3],i[0]])
        return decimales
    else:
        return  evolucion(a,b,genx,geny,iteraciones-1)
