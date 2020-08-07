# To add a new cell, type '# %%'
# To add a new markdown cell, type '# %% [markdown]'
# %%
############################################################
### Preamble ###############################################
############################################################
from __future__ import division
from sympy import *
x, y, z, t = symbols("x y z t")
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
init_printing()
init_printing(use_latex='mathjax', latex_mode='equation')

using SymPy
# %%
i, n, k = symbols("i n k", integer=True)

# %%

function S(k, n)
    # return sum([i**k for i in range(n)])
    return sympy.Sum(i^k, (i, 1, n))
end

S(k, n)

function T(n)
    sympy.Sum(i, (i, 1, n))^2
end
T(n)

expr = Eq(S(3, n), T(n)).doit()
expr = Eq(S(3, n), T(n)).doit().expand()

# %% [markdown]
# Different Sum

# %%
a = symbols("a", integer=True)


# %%
expr = sympy.Sum((S(2, 3*a+1))/S(1, 3*a+1), (a, 0, n))
expr


# %%
expr = sqrt(expr)

# %%
from sympy import *
from sympy.simplify.simplify import sum_simplify, product_simplify
from sympy.core.expr import *
from sympy.simplify.simplify import *
# from sympy.core.function import _mexpand

expr3 = sympy.sum_simplify(expr)
expr3

sympy.su


# %%
simplify(Sum((S(2, 3*a+1))/(3*a+1), (a, 0, n)))


# %%
simplify(Sum((S(2, 3*a+1))/(3*a+1), (a, 0, n))).expand()


# %%
simplify(sqrt(Sum((S(2, 3*a+1))/(3*a+1), (a, 0, n)))).expand().doit()


