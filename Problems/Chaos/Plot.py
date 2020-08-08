import pathlib
import os
from PIL import Image, ImageDraw

MAX_INTERATION = 100


def mandelbrot(c):
    z = 0
    n = 0
    while abs(z) <= 2 and n < MAX_INTERATION:
        z = z*z + c
        n = n + 1
    return n


# Image Size
WIDTH = 60000
HEIGHT = 40000

#Plot Window

RE_START = -2
RE_END = 1
IM_START = -1
IM_END = 1

palette = []

im = Image.new('RGB', (WIDTH, HEIGHT), (0, 0, 0))
draw = ImageDraw.Draw(im)

## So What if I made this a matrix and then just did matplotlib?
## Instead of converting mat co-ordinates to complex plane, maybe it would
## be nicer to convert complex plane to back to mat points.abs(
## Then I just need to be able to regenerate it with something like manipulate.
## Interesting
# https://github.com/JuliaGizmos/Interact.jl
)

for x in range(WIDTH):
    for y in range(HEIGHT):
        # Convert Pixel Co-ordinate to complex Number
        c = complex(RE_START + (x/WIDTH) * (RE_END - RE_START),
                    IM_START + (y / HEIGHT) * (IM_END - IM_START))
        # Compute the number of iterations
        m = mandelbrot(c)
        # The colour depends on the number of iterations
        color = 255 - int(m * 255 / MAX_INTERATION)
        # Plot the Point
        draw.point([x, y], (color, color, color))
