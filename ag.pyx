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
    bin = list(bin)
    for i in range(int(len(bin)/random.randint(1,5))):
        rand=random.randint(0,len(bin)-1)
        if(bin[rand]=="0"):
            bin[rand]="1"
        if(bin[rand]=="1"):
            bin[rand]="0"
    return "".join(bin)

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
   return [f(x[0],x[1],x[2]),x[3],x[4],x[5],x[6]]

resultado = []

evaluaciones = []
def evolucion(a,b,t,individuosx,individuosy,individuost,iteraciones):
    global evaluaciones, resultado
    print("---------------------------------------------------------")
    if len(individuosx)!=len(individuosy)!=len(individuost):
        return "Las poblaciones iniciales deben tener la misma longitud."
    #Selección

    aEvaluar = []
    evaluacionRepetida = []

    for i in range(len(individuosx)):
        contiene = False
        for j in resultado:
            if (j[1]==individuosx[i] and j[2]==individuosy[i] and
                j[3]==individuost[i]):
                evaluacionRepetida.append([j[0], j[1], j[2], j[3], iteraciones])
                contiene = True
                print(binToDec(j[1],a,b), binToDec(j[2],a,b),
                      int(binToDec(j[3],0,t)), j[0])
                break

        if not contiene:
            aEvaluar.append([binToDec(individuosx[i],a,b),
                             binToDec(individuosy[i],a,b),
                             int(binToDec(individuost[i],0,t)),
                             individuosx[i],
                             individuosy[i],
                             individuost[i],
                             iteraciones])

    p = multiprocessing.Pool(4)
    evaluacionNoRepetida = p.map(eval, aEvaluar)

    evaluacion = evaluacionRepetida + evaluacionNoRepetida

    evaluacion.sort()

    for i in evaluacion:
        resultado.append(i)

    mejores50=evaluacion[:int(0.5*len(evaluacion))]
    #Reproducción
    hijos=[]
    mejores50bin=[]


    for i in range(len(mejores50)):
        mejores50bin.append([mejores50[i][1],mejores50[i][2],mejores50[i][3]])
        hijos.append([cruza(mejores50[random.randint(0,int(len(mejores50)/4)-1)][1],
                            mejores50[random.randint(0,int(len(mejores50)/4)-1)][1]),
                      cruza(mejores50[random.randint(0,int(len(mejores50)/4)-1)][2],
                            mejores50[random.randint(0,int(len(mejores50)/4)-1)][2]),
                      cruza(mejores50[random.randint(0,int(len(mejores50)/4)-1)][3],
                            mejores50[random.randint(0,int(len(mejores50)/4)-1)][3])])

    #Mutación, solo los hijos mutan.
    for i in range(int(len(hijos)/random.randint(1,4))):
        randx=random.randint(0,len(hijos)-1)
        hijos[randx][0]=mutacion(hijos[randx][0])

        randy=random.randint(0,len(hijos)-1)
        hijos[randy][1]=mutacion(hijos[randy][1])

        randt=random.randint(0,len(hijos)-1)
        hijos[randt][2]=mutacion(hijos[randt][2])


    #Junta a los padres y a los hijos
    nuevaGeneracion=(mejores50bin[:len(mejores50bin)/2]+
                     mejores50bin[:len(mejores50bin)-len(mejores50bin)/2]+
                     hijos)
    genx=[]
    geny=[]
    gent=[]
    for i in range(len(nuevaGeneracion)):
        genx.append(nuevaGeneracion[i][0])
        geny.append(nuevaGeneracion[i][1])
        gent.append(nuevaGeneracion[i][2])

    if(iteraciones==0):
        resultado.sort()
        decimales=[]
        for i in resultado:
            decimales.append([binToDec(i[1],a,b),binToDec(i[2],a,b),
                              int(binToDec(i[3],0,t)),i[0],i[4]])
        return decimales
    else:
        return  evolucion(a,b,t,genx,geny,gent,iteraciones-1)
