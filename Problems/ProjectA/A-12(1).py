############################################################
### Preamble ###############################################
############################################################
from __future__ import division
from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
init_printing()
init_printing(use_latex='mathjax', latex_mode='equation')

def lx(expr):
    pyperclip.copy(latex(expr))
    print(expr)
import pyperclip


############################################################
###### Code ################################################
############################################################

k, n = symbols('k n')

    #######################################
    ###### Define the Function ############
    #######################################

x, i, k, n = symbols('x i k n')
Sum(Indexed('x', i), (i, 0, 3))

def S(k, n):
    # return sum([i**k for i in range(n)])
    return Sum(i**k, (i, 1, n))

    #######################################
    ###### Define the second  Function ####
    #######################################

def T(n):
    return Sum(i, (i, 1, n))**2


# Show that (1 + 2 + ... n)^2 == (1^3 + 2^3 + 3^3 + ...)
cancel(simplify(S(3, n)-T(n)))



