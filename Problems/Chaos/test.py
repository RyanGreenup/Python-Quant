MAX_INTERATION = 100

def mandelbrot(c):
    z = 0
    n = 0
    while abs(z) <= 2 and n < MAX_INTERATION:
        z = z*z + c
        n = n + 1
    return n
