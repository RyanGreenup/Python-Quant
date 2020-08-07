from __future__ import division
from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
init_printing()
init_printing(use_latex='mathjax', latex_mode='equation')


import pyperclip
def lx(expr):
    pyperclip.copy(latex(expr))
    print(expr)

import numpy as np
import matplotlib as plt

# Dot Products different between numpy and sympy
# https://stackoverflow.com/questions/49940433/sympy-notation-for-matrix-multiplication

a = np.array([[1, 2, 3], [4, 5, 6]])
b = np.array([[7, 8, 9, 10], [11, 12, 13, 14], [15, 16, 17, 18]])
print(a)
a.shape
print(a.shape)
print(b.shape)
print(a.dot(b).shape)


def nrow(mat):
    mat.shape[0]

def ncol(mat):
    mat.shape[1]