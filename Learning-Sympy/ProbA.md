# Problem A

## Part 1

> - There are five numbers between 1 and 500 which have the following
property: if $n=d_{1} d_{2} \cdots d_{k}$ then
$n=d_{1}^{3}+d_{2}^{3}+\cdots+d_{k}^{3}$ (e.g. $153=1^{3}+5^{3}+3^{3}$
). Find these numbers.

So this isn't too difficult to implement, the part that I can't figure out is
how to prove that all these numbers would be less than 500.

First take the following definitions:

$$
\begin{aligned}
f(n) = \sum^n_{i=1}\left[ d_i^3 \right], \qquad \forall n \in \mathbb{Z}^+
\end{aligned}
$$

### Extract a list of digits

First we need to find a way to extract all the elements from a number, if this
was `string` we might use the `.split()` attribute (equivalently `strsplit` in
***R***), but because it's a number it will actually behave similar to a list of
numbers and so instead [List
Comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions)
can be used.

```python
num = 238923
digits = [ str(num)[i] for i in range(len(str(num)))]
print(digits)
```
    ['2', '3', '8', '9', '2', '3']

This gives us a list of `str` though, so instead, inside the comprehension we
can wrap the value in `int()` to get something useful.

```python
num = 238923
digits = [ int(str(num)[i]) for i in range(len(str(num)))]
print(digits)
```
    ['2', '3', '8', '9', '2', '3']

### Sum the digits

Next it is necessary to define a way to `return` $\sum^n_{i=1}\left[d_i\right]$, in this
case I've just used a loop to go through the digits.

```python
def sumDigits(num):
    digits = [ int(str(num)[i]) for i in range(len(str(num)))]

    val = 0
    for i in digits:
        val = i**3 + val
    return val

answer = sumDigits(983291)
print(answer)
```
    2006

In order to find when $f(n) = n$, an empty list can be initialised and `for`
each value in the `range` from 1 to 500, `if` that property is satisfied the
value can be `append`ed to the list:

```python
matches = []
for i in range(500):
    if sumDigits(i) == i:
        matches.append(i)

print(matches)
```
    [0, 1, 153, 370, 371, 407]


### Conclusion

So putting this all together:


```python
def main(maxVal):
    matches = []
    for i in range(maxVal):
        if sumDigits(i) == i:
            matches.append(i)

    return matches

def sumDigits(num):
    digits = [ int(str(num)[i]) for i in range(len(str(num)))]

    val = 0
    for i in digits:
        val = i**3 + val
    return val


main(500)
```
    [0, 1, 153, 370, 371, 407]

hence,

$$
\begin{aligned}
n = \sum^n_{i=1}\left[ d_i^3 \right], \qquad \forall n \in \left\{ 0, 1,
153, 370, 371, 407 \right\}
\end{aligned}
$$

where:

* $n$ is composed of digits $d_1 d_2 d_3 ...$