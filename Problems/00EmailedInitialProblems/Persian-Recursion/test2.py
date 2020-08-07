import numpy as np
import matplotlib.pyplot as plt
import sympy as sp

mat = np.array([
    [1, 2, 3, 3, 4, 5, 9],
    [4, 5, 6, 3, 4, 5, 9],
    [7, 8, 9, 3, 4, 5, 9],
    [4, 5, 6, 3, 4, 5, 9],
    [4, 5, 6, 3, 4, 5, 9],
    [4, 5, 6, 3, 4, 5, 9],
    [4, 5, 6, 3, 4, 5, 9]
])


fig = plt.figure()

#1
#2
for i in range(10):
    mat = sp.exp(sp.ln(1.1)*mat) - 3*mat + 10
#    mat = np.exp(mat)
    ax = fig.add_subplot(111)
    ax.matshow(mat)
    plt.draw()
    plt.pause(0.00001)
    print(i)

input("<Hit Enter To Close>") #3


#2: # [python - How do I plot in real-time in a while loop using matplotlib? - Stack Overflow](https://stackoverflow.com/questions/11874767/how-do-i-plot-in-real-time-in-a-while-loop-using-matplotlib)
#1: # [python - Updating a matrix plot in matplotlib during for cycle - Stack Overflow](https://stackoverflow.com/questions/35781577/updating-a-matrix-plot-in-matplotlib-during-for-cycle)
#3: # [python - Prevent figures from closing when running a script from the command line - Stack Overflow](https://stackoverflow.com/a/55543807/12843551)



