import numpy as np

"""Clase para crear cuerpos celestes"""
class celestialBody:
    """Constructor"""
    def __init__(self, mass, radius, pos, vel):
        if (isinstance(mass, float) and isinstance(radius, float) and
            isinstance(pos, np.ndarray) and isinstance(vel, np.ndarray)
            and len(pos)==len(vel)==3):
            self.__mass = mass
            self.__radius = radius
            self.__pos = np.array(pos[:])
            self.__vel = np.array(vel[:])
        else:
            raise TypeError("La masa y el radio deben ser flotantes (float)"
                            + ", la posición y la velocidad un numpy.ndarray "
                            + "de longitud 3.")

    def mass():
        doc = "The mass property."
        def fget(self):
            return self.__mass
        return locals()
    mass = property(**mass())

    def radius():
        doc = "The radius property."
        def fget(self):
            return self.__radius
        return locals()
    radius = property(**radius())

    def pos():
        doc = "The pos property."
        def fget(self):
            return self.__pos[:]
        def fset(self, value):
            self.__pos = value[:]
        return locals()
    pos = property(**pos())

    def vel():
        doc = "The vel property."
        def fget(self):
            return self.__vel[:]
        def fset(self, value):
            self.__vel = value[:]
        return locals()
    vel = property(**vel())

    """Equals"""
    def __eq__(self, obj):
        if isinstance(obj, celestialBody):
            return (self.__mass == obj.mass and self.__radius == obj.radius and
                    self.__pos.all() == obj.pos.all() and
                    self.__vel.all() == obj.vel.all())
        return False

    """Movimiento método de Euler"""
    def mov(self, acel, dt):
        self.__pos += self.__vel*dt + acel*dt*dt
        self.__vel += acel*dt
