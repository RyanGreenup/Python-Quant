# Mathematical Induction Using Python
## Problem 1
$$
1\hspace{3px}+\hspace{3px}2\hspace{3px}+\hspace{3px}...\hspace{3px}+\hspace{3px}n\hspace{3px} =\hspace{3px} \frac{n(n+1)}{2}
$$
We start by defining $p(n) = \frac{n(n+1)}{2}$
```python
from sympy import *
n,k = symbols("n k")  
p = Lambda(n, (n * (n+1)) / 2)
print(pretty(p))
```
Next, we evaluate $p$ at $n = 1$
```python
n = 1
print(p(n))
```
Now we assume this is true for n = k.

$$
    p(k)\hspace{3px}=\hspace{3px}1\hspace{3px}+\hspace{3px}2\hspace{3px}+\hspace{3px}...\hspace{3px}+\hspace{3px}k\hspace{3px} =\hspace{3px} \frac{k(k+1)}{2}
$$

By doing this, we've created an assumption about the *k-th* output of *p* and we can utilise this in our next step when proving $p(k+1)\hspace{3px}=\hspace{3px}p(k)\hspace{3px}+\hspace{3px}k\hspace{3px}+\hspace{3px}1$.

So first we observe that

$$
    p(k+1)\hspace{3px} = \hspace{3px}1\hspace{3px}+\hspace{3px}2\hspace{3px}+\hspace{3px}...\hspace{3px}+\hspace{3px}k\hspace{3px}+\hspace{3px}k\hspace{3px}+\hspace{3px}1
$$

And we must show

$$
    1\hspace{3px}+\hspace{3px}2\hspace{3px}+\hspace{3px}...\hspace{3px}+\hspace{3px}k\hspace{3px}+\hspace{3px}k\hspace{3px}+\hspace{3px}1\hspace{3px}=\hspace{3px}p(k)\hspace{3px}+\hspace{3px}k\hspace{3px}+\hspace{3px}1\hspace{3px}=\hspace{3px}p(k+1)
$$

We do this by equating the two statments
```python
if(p(k) + k + 1 == p(k+1)):
    print("True. By the principle of Mathematical Induction, p(n) = " + pretty(p(n)))
else:
    print("False")
```

## Problem 2
$$
    1^2\hspace{3px}+\hspace{3px}2^2\hspace{3px}+\hspace{3px}...\hspace{3px}+\hspace{3px}n^2\hspace{3px} =\hspace{3px} \frac{n(n+1)(2n+1)}{6}
$$
Same principle applies here. Define a funcion *g(n)*

<!-- $$
    g(n)\hspace{3px}=\hspace{3px}1^2\hspace{3px}+\hspace{3px}2^2\hspace{3px}+\hspace{3px}...\hspace{3px}+\hspace{3px}n^2\hspace{3px} =\hspace{3px} \frac{n(n+1)(2n+1)}{6}
$$ -->
```python
g = Lambda(n, (n*(n+1)*(2*n + 1))/6
print(g)
```

Assume true for *n = k*

```python
print(g(k))
```

Prove true for *n = k + 1*
```python
if(factor(g(k) + k**2 + 2*k + 1) == g(k + 1)):
    print("True. By the principle of Mathematical Induction, p(n) = " + pretty(p(n)))
else:
    print("False")
```
