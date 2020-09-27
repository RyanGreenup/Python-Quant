#------------------------------------------------------------
#--- Dragon -------------------------------------------------
#------------------------------------------------------------
import turtle
import os
from math import sqrt
from tkinter import *
from PIL import Image, ImageOps

alex = turtle.Turtle()

def dragon_iterate(order, length, sign):
    if order == 0:
        alex.forward(length)
    else:
        rootHalf = sqrt(0.5)
        dragon_iterate(order -1, length*rootHalf, 1)
        alex.right(sign * -90)
        dragon_iterate(order -1, length*rootHalf, -1)

def dragon(order, length):
    print(" ") # Don't remove this or code breaks, I don't know why?
    alex.right(order*45)
    dragon_iterate(order, length, 1)

os.chdir("/Users/student/Desktop/")

dir = "dragon-curve"

if not os.path.exists(dir):
    os.mkdir(dir)

new_dir = os.getcwd() + "/dragon-curve"
os.chdir(new_dir)

alex.hideturtle()
alex.speed(0)
dragon(3,200)
ts = alex.getscreen()

ts.getcanvas().postscript(file="thing.eps")
