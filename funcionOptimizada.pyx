import cuerposCelestes as cc
import numpy as np


#Constantes
G= 39.4784176 # AU³ YR⁻² SM⁻¹
UAkm = 1.496e+8 #km
Msol = 1.989e+30 #kg
ANG= np.pi/2
sa = np.sin(ANG)
ca = np.cos(ANG)
sca = np.sin(np.pi/2+ANG)
cca = np.cos(np.pi/2+ANG)

#Diferencial a usar
dt=0.0001902587 # 100 min

"""Mercurio"""
rmerc=0.38          #radio
mmerc=0.166e-6      #masa
vmerc=np.sqrt(G/rmerc) #velocidad tangencial
wmerc=vmerc/rmerc   #velocidad angular

"""Venus"""
rvenus=0.723
mvenus=2.44e-6
vvenus=np.sqrt(G/rvenus)
wvenus=vvenus/rvenus

"""Tierra"""
rearth = 1
mearth = 3.004e-6
vearth = np.sqrt(G/rearth)
wearth = vearth/rearth

"""Luna"""
rluna = 1 + (356000/UAkm)
mluna = (7.349e+22)/Msol
vluna = np.sqrt(G/rluna) + (2412743/UAkm)/(27.32/365)
wluna = vluna/rluna

"""Marte"""
rmarte=1.53 #Distancia media al Sol del planeta de destino UA
mmarte=3.214e-7 #Masa del planeta de destino MS
vmarte=np.sqrt(G/rmarte)  #Velocidad de Marte
wmarte=vmarte/rmarte   # Velocidad angular de Marte

"""Satélites de Júpiter"""
"""Io"""
rio = 5.2 + (421600/UAkm)
mio = (8.94e+22)/Msol
vio = np.sqrt(G/rio) + (17.334/UAkm)*(60*60*24*365)
wio = vio/rio

"""Europa"""
reuropa = 5.2 + (671100/UAkm)
meuropa = (4.8e+22)/Msol
veuropa = np.sqrt(G/reuropa) + (13.740/UAkm)*(60*60*24*365)
weuropa = veuropa/reuropa

"""Ganimedes"""
rgan = 5.2 + (1070400/UAkm)
mgan = (1.48e+23)/Msol
vgan = np.sqrt(G/rgan) + (10.88/UAkm)*(60*60*24*365)
wgan = vgan/rgan

"""Calisto"""
rcal = 5.2 + (1882770/UAkm)
mcal = (1.08e+23)/Msol
vcal = np.sqrt(G/rcal) + (8.204/UAkm)*(60*60*24*365)
wcal = vcal/rcal

"""Jupiter"""
rjup=5.2
mjup=954.79e-6 #-4
vjup=np.sqrt(G/rjup)
wjup=vjup/rjup

"""Satélite más grande de Saturno"""
"""Titán"""
rtit = 9.57 + 1221870/UAkm
mtit = (1.345e+23)/Msol
vtit = np.sqrt(G/rtit) + (5.57/UAkm)*(60*60*24*365)
wtit = vtit/rtit

"""Saturno"""
rsat=9.57
msat=285.88e-6
vsat=np.sqrt(G/rsat)
wsat=vsat/rsat

"""Urano"""
rur=19.3
mur=43.66e-6
vur=np.sqrt(G/rur)
wur=vur/rur

"""Neptuno"""
rnep=30.2
mnep=51.51e-6
vnep=np.sqrt(G/rnep)
wnep=vnep/rnep

Sun = cc.celestialBody(1.0, 695508/UAkm, np.array([0.0,0.0,0.0]),
                       np.array([0.0,0.0,0.0]))

Mercury = cc.celestialBody(mmerc, 2440/UAkm, np.array([rmerc*ca, rmerc*sa,0]),
                           np.array([vmerc*cca, vmerc*sca, 0]))

Venus = cc.celestialBody(mvenus, 6052/UAkm, np.array([rvenus*ca,rvenus*sa,0]),
                        np.array([vvenus*cca, vvenus*sca, 0]))

Luna = cc.celestialBody(mluna, 1737/UAkm, np.array([rluna*cat,rluna*sat,0]),
                        np.array([vluna*ccat, vluna*scat, 0]))

Earth = cc.celestialBody(mearth, 6371/UAkm, np.array([rearth*cat,rearth*sat,0.0]),
                         np.array([vearth*ccat,vearth*scat,0.0]))

Mars = cc.celestialBody(mmarte, 3390/UAkm, np.array([rmarte*ca,rmarte*sa,0]),
                        np.array([vmarte*cca, vmarte*sca, 0]))

Io = cc.celestialBody(mio, 1822/UAkm, np.array([rio*ca,rio*sa,0]),
                        np.array([vio*cca, vio*sca, 0]))

Europa = cc.celestialBody(meuropa, 1561/UAkm, np.array([reuropa*ca,reuropa*sa,0]),
                        np.array([veuropa*cca, veuropa*sca, 0]))

Ganimedes = cc.celestialBody(mgan, 2634/UAkm, np.array([rgan*ca,rgan*sa,0]),
                        np.array([vgan*cca, vgan*sca, 0]))

Calisto = cc.celestialBody(mcal, 2410/UAkm, np.array([rcal*ca,rcal*sa,0]),
                        np.array([vcal*cca, vcal*sca, 0]))

Jupyter = cc.celestialBody(mjup, 71492/UAkm, np.array([rjup*ca,rjup*sa,0]),
                        np.array([vjup*cca, vjup*sca, 0]))

Titan = cc.celestialBody(mtit, 2575/UAkm, np.array([rtit*ca,rtit*sa,0]),
                        np.array([vtit*cca, vtit*sca, 0]))

Saturn = cc.celestialBody(msat, 58232/UAkm, np.array([rsat*ca,rsat*sa,0]),
                        np.array([vsat*cca, vsat*sca, 0]))

Uranus = cc.celestialBody(mur, 25362/UAkm, np.array([rur*ca,rur*sa,0]),
                            np.array([vur*cca, vur*sca, 0]))

Neptune = cc.celestialBody(mnep, 24622/UAkm, np.array([rnep*ca,rnep*sa,0]),
                        np.array([vnep*cca, vnep*sca, 0]))

movBody = [Sun,Mercury,Venus,Luna,Earth,Mars,Io,Europa,Ganimedes,
              Calisto,Jupyter,Titan,Saturn,Uranus,Neptune]


"""Es la función principal, descripción en el archivo .pdf adjunto"""
def f(vx,vy,angulo,anguloNave,iteraciones):
    global movBody, dt, Msol, UAkm, rearth, mearth, vearth, wearth, rluna
    global mluna, vluna, wluna

    sat = np.sin(np.pi*angulo)
    sat = np.cos(np.pi*angulo)
    sca = np.sin(np.pi*(0.5 + angulo))
    cca = np.cos(np.pi*(0.5 + angulo))

    Luna = cc.celestialBody(mluna, 1737/UAkm, np.array([rluna*cat,rluna*sat,0]),
                            np.array([vluna*ccat, vluna*scat, 0]))

    Earth = cc.celestialBody(mearth, 6371/UAkm,
                             np.array([rearth*cat,rearth*sat,0.0]),
                             np.array([vearth*ccat,vearth*scat,0.0]))

    destino = Mars #Destino, se puede cambiar a cualquier planeta o Satélite.

    iteraciones = iteraciones + 1
    tiempoLimite = 10000 #Número máximo de iteraciones, 1 año.
    tiempo = 0
    tiempoEnOrbita = 0

    #Condición de penalización para que la rapidez de la nave no supere el
    #límite impuesto.
    if not (40320/UAkm)*(24*365)<np.sqrt(vx**2+vy**2)<(60000/UAkm)*(24*365):
        #Imprime los valores a evaluar y su resultado.
        print(vx,vy,iteraciones, 100, 100 + np.log10(iteraciones))
        return 100

    posiciones=[]

    #cambiamos la posición inicial de la nave a la actual de la Tierra.
    Ship = cc.celestialBody(546700/Msol, 0.0001/UAkm,
           Earth.pos+np.array([Earth.radius*np.cos(np.pi*anguloNave),
                               Earth.radius,0.0]),
           Earth.vel+np.array([vx, vy, 0.0]))
    movBody.append(Ship)
    #Primer distancia Nave-destino, se usa abajo, se le resta un poco a
    #conveniencia, para lograr que las trayectorias se encaminen al
    #destino.
    distOriginal=np.linalg.norm(Ship.pos-destino.pos)-0.001
    #Movemos cada uno de los cuerpos en el sistema.

    while True:
        #Tiempo inicial del viaje de la nave, es decir, la nave puede iniciar
        #su trayectoria mucho después de que se inicie la simulación.

        co = 0
        for body in movBody:
            #Aceleración del planeta
            if co==15 and np.linalg.norm(Earth.pos-body.pos)<Earth.radius:
                body.pos = Earth.pos + np.array([0,Earth.radius,0])
                tiempoEnOrbita -= 200
            else:
                body.mov(acel(body.pos),dt)
            co += 1

        #Condicion para beneficiar a las trayectorías que ponen en
        #orbita a la nave sobre el destino.
        if (np.linalg.norm(Ship.pos-destino.pos)<=
            destino.radius*6*np.sqrt(iteraciones)):
          tiempoEnOrbita += 50

        #Si la distancia nave-destino es menor que 0.005 UA, se sale del
        #while y regresa el valor más cercano.
        if(np.linalg.norm(Ship.pos-
                        destino.pos)<=destino.radius*2*np.sqrt(iteraciones)):
            print(vx,vy,iteraciones,
                  np.linalg.norm(Ship.pos-destino.pos) +
                                (tiempo/100-tiempoEnOrbita)/tiempoLimite,
                  np.linalg.norm(Ship.pos-destino.pos) +
                                ((tiempo/100-tiempoEnOrbita)/tiempoLimite +
                                np.log10(iteraciones)))
            return (np.linalg.norm(Ship.pos-destino.pos) +
                   (tiempo/100-tiempoEnOrbita)/tiempoLimite)

        #Si la nave se acerca mucho al Sol, se sale del while y regresa
        #un valor de penalización.
        if(np.linalg.norm(Ship.pos-Sun.pos)<0.5):
            print(vx,vy,iteraciones,50 , 50 + np.log10(iteraciones))
            return 50

        #Hacemos una lista con todas las distancias Nave-Destino.
        posiciones.append(np.linalg.norm(Ship.pos-destino.pos))

        #Contador que se ocupa para saber cuando iniciar el viaje de la nave.
        tiempo+=1

        #Condición de finalización del while, evitar un ciclo infinito.
        if(tiempo>=tiempoLimite):
            break

    #Acomodamos de menor a mayor las distancias nave-destino.
    posiciones.sort()

    #Si la menor distancia a la que la nave estuvo del destino es menor
    #que la distancia original(Tierra-destino), de la cual sale la nave
    if  posiciones[0]<distOriginal:
        print(vx,vy,iteraciones,
               posiciones[0] + (tiempo/100-tiempoEnOrbita)/tiempoLimite,
               (posiciones[0] + (tiempo/100-tiempoEnOrbita)/tiempoLimite +
               np.log10(iteraciones)))
        return posiciones[0] + (tiempo/100-tiempoEnOrbita)/tiempoLimite

    print(vx,vy,iteraciones,
          np.linalg.norm(Ship.pos-destino.pos) +
                        (tiempo/100-tiempoEnOrbita)/tiempoLimite,
          np.linalg.norm(Ship.pos-destino.pos) +
                        (tiempo/100-tiempoEnOrbita)/tiempoLimite +
                        np.log10(iteraciones))
    return (np.linalg.norm(Ship.pos-destino.pos) +
           (tiempo/100-tiempoEnOrbita)/tiempoLimite)


"""Calcular aceleraciones para impedir divisiones entre cero"""
def acel(x):
    global movBody

    distancias = []
    for i in movBody:
        distancias.append(x-i.pos)

    a = np.array([0.0,0.0,0.0])
    j=0
    for i in movBody:
        norma = np.linalg.norm(distancias[j])
        if norma>0.0:
            a +=  i.mass * (distancias[j] / norma**3)
        j+=1

    return -G * a
