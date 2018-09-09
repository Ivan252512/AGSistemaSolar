"""El objetivo de este programa es crear una simulación de las fuerzas gravi-
tacionales que influyen en la trayectoria de una nave espacial en el sistema
solar y que parte desde la Tierra hacia otro planeta, también se utilizaron
algoritmos genéticos para encontrar las rutas que llevaras a la nave más cerca
de su destino."""

#Programa para evaluar la ultima generación obtenida en el .txt que
#produce el el script de entrenamiento.

#Importamos la función de evaluación de entrenamiento.
from funcion import f

"""Evaluación para las mejores trayectorias en el .txt"""

#Cargamos desde el archivo txt
file=open('Luna.txt', 'r')
trayectorias=[]
linea=''
for i in file.read():
    if(i!='\n' and i!='['):
        linea+=i
        if i==',' or i==']':
            trayectorias.append(float(linea[:len(linea)-1]))
            linea=''

trayectoriasSeparadas=[]
unaTrayectoria=[]
cont=1
for i in trayectorias:
    unaTrayectoria.append(i)
    if cont>=5:
        trayectoriasSeparadas.append(unaTrayectoria)
        unaTrayectoria=[]
        cont=0
    cont+=1

print(trayectoriasSeparadas)

#Evaluamos cada trayectoria:
for i in trayectoriasSeparadas:
    f(i[0],i[1],i[2])
