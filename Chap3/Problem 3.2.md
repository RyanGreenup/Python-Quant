# Problem 3.2

Define the function $f\left( x \right) = \left| \left| x \right|- 1 \right|$ in *Python* and plot
$f\left( x \right), f\left( f\left( x \right) \right)$ and
$f\left( f\left( f\left( x \right) \right) \right)$.

To understand *f(x)*, we can represent it through a piecewise function.

$$
f(x)~=~ 
\begin{cases}
x-1&\text{if}&x\ge1\\
-x+1&\text{if}&0\le x<1\\
x+1&\text{if}&-1\le x<0\\
-x+1&\text{if}&x\le-1\\
\end{cases}
$$

## <ins>The code<ins>
### Importing and Initialising
```python
from sympy import *
from sympy.plotting import *
from tabulate import tabulate
x = symbols('x')
```
### Defining the function
```python
f = Lambda(x, Abs(Abs(x) - 1))
```
### Creating x and f(x) labels
```python
input_val = ["x"]
output_val = ["f(x)"]
```

### Creating a table of values
```python
#Choose arbitrary domain, i.e. [-5, 5]
input_val = input_val + [j for j in range(-5, 6)]

output_val = output_val + [f(i) for i in range(-5,6)]

print(tabulate([input_val, output_val], tablefmt="grid"))
+------+----+----+----+----+----+---+---+---+---+---+---+
| x    | -5 | -4 | -3 | -2 | -1 | 0 | 1 | 2 | 3 | 4 | 5 |
+------+----+----+----+----+----+---+---+---+---+---+---+
| f(x) |  4 |  3 |  2 |  1 |  0 | 1 | 0 | 1 | 2 | 3 | 4 |
+------+----+----+----+----+----+---+---+---+---+---+---+
```
### Plotting f(x)
```python
plot(f(x))
```
<!-- !()[Figure_1.png] -->
![picture 1](../images/a924251be6c217f267846cdf05d0e445ad8852bdbd68e1fce6bf1d62a33f9a6b.png)  

### Plotting f(f(x))
```python
plot(f(f(x)))
```
![picture 3](../images/61f318fcf3cbfe4c0ebdea7469ce12d411ed9dcf0b2c2e1a98d888fd6a59ece3.png)  

### Plotting f(f(f(x)))
```python
plot(f(f(f(x))))
```
![picture 4](../images/66bb3477c298482f7943e41917709abb22a3e8b57be5625494ee0efd8418678e.png)  

Finally, we can obvserve that the compositions of $f(x)$ continue a shark-tooth feature with the domain still being $-\infty < x < \infty$