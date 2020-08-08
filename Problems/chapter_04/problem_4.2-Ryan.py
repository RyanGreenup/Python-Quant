# Test
from __future__ import division
from sympy import *
a, b, c, d, e, f = symbols('a b c d e f')
init_printing()
init_printing(use_latex='mathjax', latex_mode='equation')


import pyperclip
def lx(expr):
    pyperclip.copy(latex(expr))
    print(expr)

import numpy as np
import matplotlib as plt

mylist = [[[[a, b], 2], [[c, d], 3]], [[[a, b], 2, [[e, f], 3]]]]


import operator
import functools
l = functools.reduce(operator.concat, mylist)

l = functools.reduce(operator.concat, mylist); l

def flatten(l):
    flat_list = [item for sublist in l for item in sublist]
    return flat_list
flatten(flatten(mylist))

def flatten(list):

    new_list = []
    for item in mylist:
        if type(item) is list:
            print("sublist detected")
            for subitem in item:
                new_list.append(subitem)
        else:
            new_list.append(item)
    return new_list

flatten(flatten(flatten(mylist)))



for item in mylist:
    if type(item) is list:
        for subitem in item:
            print(subitem)
    else:
        print(item)


new_list = []
for item in mylist:
    if type(item) is list:
        for subitem in item:
            new_list.append(subitem)
    else:
        new_list.append(item)
new_list
mylist

# This won't work
# Testing for types in python is stupid.

def flatten(list):
    new_list = []
    for item in list:
        if type(item) is list:
            for subitem in item:
                new_list.append(subitem)
        elif type(item) is not list:
            new_list.append(item)
        else:
            print("ERROR: Element is neither a list nor a non-list")
            return 0
    return new_list


# This is good but notice that it fails:

def isIterable(x):
    try:
        iter(x)
        return True
    except: 
        return False

isIterable([1,2]) # True
isIterable([3])   # True
isIterable(4)     # False

# instead use iter()
    # iter will succeed for an object for which items can be pulled from
    # but throw an error otherwise 
      # https://stackoverflow.com/a/61139278/12843551

def flatten(list):
    new_list = []
    for item in list:
        if isIterable(item):
            for subitem in item:
                new_list.append(subitem)
        elif not isIterable(item):
            new_list.append(item)
        else:
            print("ERROR: Element is neither a iterable or a non-iterable")
            return 0
    return new_list

mylist
flatten(flatten(mylist))
flatten(flatten(flatten(mylist)))
flatten(flatten(flatten(flatten(mylist))))


def myFlat(list, n):
    # Loops equivalent to recursion, usually faster aswell
    for i in range(n-1):
        list = flatten(list)
    return list

mylist
myFlat(mylist, 5)







