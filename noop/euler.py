import numpy as np

"""Método de Euler para integrar la ecuación diferencial de segundo orden"""
#f = Ecuación Diferencial de segundo orden.
#x = Vector de posición.
#v = Vector de velocidad.
#h = dt
def eulerMethod(f, x, v, h):
    ximas1 = x + v*h + (f(x))*h*h
    vimas1 = v + (f(x))*h
    return ximas1, vimas1
