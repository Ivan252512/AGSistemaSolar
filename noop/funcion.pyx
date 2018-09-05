"""Función de evaluación"""

#vpython es una librería para visualización gráfica.
import numpy as np
from vpython import *
from euler import eulerMethod

#Constantes y condiciones iniciales.
G= 39.4784176 # AU³ YR⁻² SM-¹
UAkm = 1.496e+8 #km
Msol = 1.989e+30 #kg
pi = np.pi
dospi=2*pi
pimedios=pi/2

#Diferencial a usar
dt=0.00000190781 # 1 min

"""Mercurio"""
rmerc=0.38          #radio
mmerc=0.166e-6      #masa
vmerc=sqrt(G/rmerc) #velocidad tangencial
wmerc=vmerc/rmerc   #velocidad angular

"""Venus"""
rvenus=0.723
mvenus=2.44e-6
vvenus=sqrt(G/rvenus)
wvenus=vvenus/rvenus

"""Tierra"""
rearth = 1
mearth = 3.004e-6
vearth = sqrt(G/rearth)
wearth = vearth/rearth

"""Luna"""
rluna = 1 + (356000/UAkm)
mluna = (7.349e+22)/Msol
vluna = sqrt(G/rluna) + (2412743/UAkm)/(27.32/365)
wluna = vluna/rluna

"""Marte"""
rmarte=1.53 #Distancia media al Sol del planeta de destino UA
mmarte=3.214e-7 #Masa del planeta de destino MS
vmarte=sqrt(G/rmarte)  #Velocidad de Marte
wmarte=vmarte/rmarte   # Velocidad angular de Marte

"""Satélites de Júpiter"""
"""Io"""
rio = 5.2 + (421600/UAkm)
mio = (8.94e+22)/Msol
vio = sqrt(G/rio) + (17.334/UAkm)*(60*60*24*365)
wio = vio/rio

"""Europa"""
reuropa = 5.2 + (671100/UAkm)
meuropa = (4.8e+22)/Msol
veuropa = sqrt(G/reuropa) + (13.740/UAkm)*(60*60*24*365)
weuropa = veuropa/reuropa

"""Ganimedes"""
rgan = 5.2 + (1070400/UAkm)
mgan = (1.48e+23)/Msol
vgan = sqrt(G/rgan) + (10.88/UAkm)*(60*60*24*365)
wgan = vgan/rgan

"""Calisto"""
rcal = 5.2 + (1882770/UAkm)
mcal = (1.08e+23)/Msol
vcal = sqrt(G/rcal) + (8.204/UAkm)*(60*60*24*365)
wcal = vcal/rcal

"""Jupiter"""
rjup=5.2
mjup=954.79e-6 #-4
vjup=sqrt(G/rjup)
wjup=vjup/rjup

"""Satélite más grande de Saturno"""
"""Titán"""
rtit = 9.57 + 1221870/UAkm
mtit = (1.345e+23)/Msol
vtit = sqrt(G/rtit) + (5.57/UAkm)*(60*60*24*365)
wtit = vtit/rtit

"""Saturno"""
rsat=9.57
msat=285.88e-6
vsat=sqrt(G/rsat)
wsat=vsat/rsat

"""Urano"""
rur=19.3
mur=43.66e-6
vur=sqrt(G/rur)
wur=vur/rur

"""Neptuno"""
rnep=30.2
mnep=51.51e-6
vnep=sqrt(G/rnep)
wnep=vnep/rnep

#Ángulos para trabajar en coordenadas polares
ANG=pi/2
sa = sin(ANG)
ca = cos(ANG)
sca = sin(pimedios+ANG)
cca = cos(pimedios+ANG)
sat = sin(3*pi/8)
cat = cos(3*pi/8)
scat = sin(pimedios+3*pi/8)
ccat = cos(pimedios+3*pi/8)

#Generación de objetos a representar con su posición, masa y velocidad.
Sun = sphere(pos=vector(0,0,0),
             radius=695508/UAkm, color=color.yellow,make_trail=True, interval=10)
Sun.mass = 1
Sun.v = vector(0, 0, 0)

Earth = sphere(pos=vector(rearth*cat,rearth*sat,0),
               radius=6371/UAkm, color=color.blue,make_trail=True, interval=10)
Earth.mass = mearth
Earth.v = vector(vearth*ccat, vearth*scat, 0)

Luna = sphere(pos=vector(rluna*cat,rluna*sat,0),
               radius=1737/UAkm, color=color.white,make_trail=True, interval=10)
Luna.mass = mluna
Luna.v = vector(vluna*ccat, vluna*scat, 0)

Mercury = sphere(pos=vector(rmerc*ca,rmerc*sa,0),
                 radius=2440/UAkm, color=color.orange,make_trail=True, interval=10)
Mercury.mass = mmerc
Mercury.v = vector(vmerc*cca, vmerc*sca, 0)

Venus = sphere(pos=vector(rvenus*ca,rvenus*sa,0),
               radius=6052/UAkm, color=color.yellow,make_trail=True, interval=10)
Venus.mass = mvenus
Venus.v = vector(vvenus*cca, vvenus*sca, 0)

Mars = sphere(pos=vector(rmarte*ca,rmarte*sa,0),
              radius=3390/UAkm, color=color.red,make_trail=True, interval=10)
Mars.mass = mmarte
Mars.v = vector(vmarte*cca, vmarte*sca, 0)

Io = sphere(pos=vector(rio*ca,rio*sa,0),
              radius=1822/UAkm, color=color.orange,make_trail=True, interval=10)
Io.mass = mio
Io.v = vector(vio*cca, vio*sca, 0)

Europa = sphere(pos=vector(reuropa*ca,reuropa*sa,0),
              radius=1561/UAkm, color=color.white,make_trail=True, interval=10)
Europa.mass = meuropa
Europa.v = vector(veuropa*cca, veuropa*sca, 0)

Ganimedes = sphere(pos=vector(rgan*ca,rgan*sa,0),
              radius=2634/UAkm, color=color.white,make_trail=True, interval=10)
Ganimedes.mass = mgan
Ganimedes.v = vector(vgan*cca, vgan*sca, 0)

Calisto = sphere(pos=vector(rcal*ca,rcal*sa,0),
              radius=2410/UAkm, color=color.blue,make_trail=True, interval=10)
Calisto.mass = mcal
Calisto.v = vector(vcal*cca, vcal*sca, 0)

Jupyter = sphere(pos=vector(rjup*ca,rjup*sa,0),
                 radius=69911/UAkm,color=color.orange,make_trail=True, interval=10)
Jupyter.mass = mjup
Jupyter.v = vector(vjup*cca, vjup*sca, 0)

Titan = sphere(pos=vector(rtit*ca,rtit*sa,0),
                 radius=2575/UAkm,color=color.orange,make_trail=True, interval=10)
Titan.mass = mtit
Titan.v = vector(vtit*cca, vtit*sca, 0)

Saturn = sphere(pos=vector(rsat*ca,rsat*sa,0),
                radius=58232/UAkm, color=color.cyan,make_trail=True, interval=10)
Saturn.mass = msat
Saturn.v = vector(vsat*cca, vsat*sca, 0)

SaturnRing=ring(pos=Saturn.pos, axis=vector(0,0,1), radius=107000/UAkm, thickness=0.0001)

Uranus = sphere(pos=vector(rur*ca,rur*sa,0),
                radius=25362/UAkm, color=color.blue,make_trail=True, interval=10)
Uranus.mass = mur
Uranus.v = vector(vur*cca, vur*sca, 0)

Neptune = sphere(pos=vector(rnep*ca,rnep*sa,0),
                 radius=24622/UAkm, color=color.blue,make_trail=True, interval=10)
Neptune.mass = mnep
Neptune.v = vector(vnep*cca, vnep*sca, 0)
movBody = ([Sun,Mercury,Venus,Luna,Earth,Mars,Io,Europa,Ganimedes,
              Calisto,Jupyter,Titan,Saturn,Uranus,Neptune])

destino = Mars

"""Es la función principal, descripción en el archivo .pdf adjunto"""
def f(vx,vy,iteraciones):
    global movBody, dt
    print(vx,vy,iteraciones)

    #Herramientas de visual python para la visualización
    scene.width = 1400
    scene.height = 700
    scene.title = "Trayectorias óptimas en el Sistema Solar"
    scene.range = 36

    tiempo=0
    contimp=0
    ccel = [Sun,Mercury,Venus,Earth,Mars,Jupyter,Saturn,Uranus,Neptune]
    #Primer distancia Nave-destino, se usa abajo, se le resta un poco a
    #conveniencia, para lograr que las trayectorias se encaminen al destino.

    #cambiamos la posición inicial de la nave a la actual de la Tierra.
    Ship = sphere(pos=Earth.pos+vector(0,Earth.radius,0),
                  radius=0.0001/UAkm,
                  color=color.orange,make_trail=True, interval=10)
    Ship.mass = 546700/Msol
    Ship.v = Earth.v + vector(vx, vy, 0.0)
    movBody.append(Ship)
    ccel.append(Ship)

    while True:
        rate(50)
        scene.center = Ship.pos
        #Función para mover todos los cuerpos
        computeForces(movBody)
        if contimp==1000:
            print(tiempo)
            contimp=0
        #Hacemos una lista con todas las distancias Nave-Destino.
        tiempo+=1
        contimp+=1
        if(mag(Ship.pos-destino.pos)<=destino.radius*5):
            break


"""Mover cuerpos"""

def computeForces(cuerpos):
    global SaturnRing, dt, Saturn, Earth
    cont=0
    for body in cuerpos:

        #Condición para que la nave no atraviese planetas.

        if cont==15 and mag(Earth.pos-body.pos)<Earth.radius:
            body.pos = Earth.pos + vector(0,Earth.radius,0)

        else:
            #Aceleración del planeta
            xarray = np.array([body.pos.x, body.pos.y, body.pos.z])
            varray = np.array([body.v.x, body.v.y, body.v.z])
            ximas1, vimas1 = eulerMethod(acel, xarray, varray, dt)
            #de la velocidad y posición del planeta.
            body.pos = vector(ximas1[0],ximas1[1],ximas1[2])
            body.v = vector(vimas1[0],vimas1[1],vimas1[2])
            SaturnRing.pos = Saturn.pos

        cont+=1



"""Calcular aceleraciones para impedir divisiones entre cero"""
def acel(x):
    global movBody

    distancias = []
    for i in movBody:
        distancias.append(x-vectorToNpArray(i.pos))

    a = np.array([0.0,0.0,0.0])
    j=0
    for i in movBody:
        norma = np.linalg.norm(distancias[j])
        if norma>0.0:
            a +=  i.mass * (distancias[j] / norma**3)
        j+=1

    return -G * a



def vectorToNpArray(vec):
    return np.array([vec.x, vec.y, vec.z])
