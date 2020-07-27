############################################################
###### Question 35; Project A ##############################
############################################################

########################################
##### PREAMBLE #########################
########################################


from __future__ import division
from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
init_printing()
init_printing(use_latex='mathjax', latex_mode='equation')


########################################
##### PROBLEM ##########################
########################################


def main(r):
    match = []
    for n in range(r):
        if isprime(n**n + n + 1):
            match.append(n)
    return match

print(main(100))


