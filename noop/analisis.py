"""Análisis y gráficas para los distintos planetas"""
import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
from os import listdir
from os.path import isfile, join

# Cargamos desde el archivo txt


def cargaArchivo(nombre):
    """Carga el archivo txt en un arrayList"""
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
    file.close()
    return trayectoriasSeparadas


def getGeneraciones(trayectorias):
    """Obtiene todas las generaciones"""
    generaciones = []
    cont = 0
    for i in trayectorias:
        if i[4]==cont:
            generaciones.append(int(i[4]))
            cont += 1
    generaciones.sort()
    return generaciones

def arrayGen(trayectorias):
    """Regresa un arreglo donde cada posición tiene el fitness de todos los
    individuos de una generación"""
    gen = getGeneraciones(trayectorias)
    porGen = []
    for i in gen:
        generacion = []
        for j in trayectorias:
            if j[4]==i:
                generacion.append(j[3])
        porGen.append(generacion)
    return porGen

def mejorPorGen(trayectorias):
    """Regresa un arreglo con el fitness del mejor individuo por generacion"""
    porGen = arrayGen(trayectorias)
    mejores = []
    for i in porGen:
        i.sort()
        mejores.append(i[0])
    return mejores

def statsPorGen(trayectorias):
    """Regresa un arreglo con la media y la moda por generación"""
    porGen = arrayGen(trayectorias)
    mediaPorGen = []
    modaPorGen = []
    for i in porGen:
        mediaPorGen.append(np.mean(i))
        modaPorGen.append(stats.mode(i)[0][0])
    return mediaPorGen, modaPorGen

def getNombresArchivos(directorio,primerArchivo):
    """Obtiene los nombres de los archivos en una carpeta dada"""
    archivos = [
        i for i in listdir(directorio)
        if isfile(join(directorio,primerArchivo))]
    return archivos

def graficaMejor(archivostxt):
    """Gráfica para cada planeta mejor individuo por generación vs generación"""
    for i in archivostxt:
         trayectorias = cargaArchivo('Evaluaciones/'+i)
         gen = getGeneraciones(trayectorias)
         gen.sort(reverse=True)
         fig=plt.figure(figsize=(8, 4))
         plt.plot(gen,mejorPorGen(trayectorias))
         plt.scatter(gen,mejorPorGen(trayectorias))
         plt.title(i[:len(i)-4])
         plt.xlabel('Generación')
         plt.ylabel('Evaluación del mejor individuo')
         plt.savefig('Imagenes/'+i[:len(i)-4]+'ind.png',dpi=100)

def graficaStats(archivostxt):
    """Gráfica para estadística por generación vs generación"""
    for i in archivostxt:
         trayectorias = cargaArchivo('Evaluaciones/'+i)
         gen = getGeneraciones(trayectorias)
         gen.sort(reverse=True)
         fig=plt.figure(figsize=(8, 4))
         plt.plot(gen,statsPorGen(trayectorias)[0])
         plt.scatter(gen,statsPorGen(trayectorias)[0])
         plt.title(i[:len(i)-4])
         plt.xlabel('Generación')
         plt.ylabel('Media de la evaluación')
         plt.savefig('Imagenes/'+i[:len(i)-4]+'media.png',dpi=100)

         fig=plt.figure(figsize=(8, 4))
         plt.plot(gen,statsPorGen(trayectorias)[1])
         plt.scatter(gen,statsPorGen(trayectorias)[1])
         plt.title(i[:len(i)-4])
         plt.xlabel('Generación')
         plt.ylabel('Moda de la evaluación')
         plt.savefig('Imagenes/'+i[:len(i)-4]+'moda.png',dpi=100)

def grafSobrepuestas(archivostxt):
    for i in archivostxt:
         trayectorias = cargaArchivo('Evaluaciones/'+i)
         gen = getGeneraciones(trayectorias)
         gen.sort(reverse=True)
         fig=plt.figure(figsize=(8, 4))
         plt.plot(gen,statsPorGen(trayectorias)[0],label='Media')
         plt.plot(gen,statsPorGen(trayectorias)[1], label='Moda',linestyle='dashed')
         plt.plot(gen,mejorPorGen(trayectorias),label='Mejor individuo', linestyle=':')
         plt.title(i[:len(i)-4])
         plt.xlabel('Generación')
         plt.ylabel('Evaluación')
         plt.legend(loc=1)
         plt.savefig('Imagenes/'+i[:len(i)-4]+'.png',dpi=100)

graficaMejor(getNombresArchivos('Evaluaciones', 'Luna.txt'))
graficaStats(getNombresArchivos('Evaluaciones', 'Luna.txt'))
grafSobrepuestas(getNombresArchivos('Evaluaciones', 'Luna.txt'))
