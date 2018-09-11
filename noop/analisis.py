"""Análisis y gráficas para los distintos planetas"""
import numpy as np
import matplotlib.pyplot as plt

# Cargamos desde el archivo txt


def cargaArchivo(nombre):
    file = open(nombre, 'r')
    trayectorias = []
    linea = ''
    for i in file.read():
        if(i != '\n' and i != '['):
            linea += i
            if i == ',' or i == ']':
                trayectorias.append(float(linea[:len(linea)-1]))
                linea = ''

    trayectoriasSeparadas = []
    unaTrayectoria = []
    cont = 1
    for i in trayectorias:
        unaTrayectoria.append(i)
        if cont >= 5:
            trayectoriasSeparadas.append(unaTrayectoria)
            unaTrayectoria = []
            cont = 0
        cont += 1
    return trayectoriasSeparadas


def grafFitnessVSGen(trayectorias):
    fitness = []
    generaciones = []
    for i in trayectorias:
        fitness.append(i[3])
        generaciones.append(i[4])
    plt.plot(generaciones, fitness)


grafFitnessVSGen(cargaArchivo("TierraF.txt"))
