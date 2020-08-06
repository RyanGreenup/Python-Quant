# Problem 4.1

Let $p\ = \{~a,~b,~\{~c,~d~\},~e~\}$. From this list produce the list $\{~a,~b,~c,~d~,~e~\}$.

### Solution 1
The first solution is to create a list comprehension (the slowest method of the three). These can be confusing at times, especially if they are nested for loops.


```python
list_1 = ["a", "b", ["c", "d"], "e"]
flat_list = [y for x in list_1 for y in x]
flat_list
```




    ['a', 'b', 'c', 'd', 'e']



This can also be done in one line


```python
[y for x in ["a", "b", ["c", "d"], "e"] for y in x]
```




    ['a', 'b', 'c', 'd', 'e']



Which is equivalent to


```python
l = ["a", "b", ["c", "d"], "e"]
flat_list = [] #create empty list 
for x in l:
    for y in x:
        flat_list.append(y) #append each element (y) from x to flat_list

flat_list
```




    ['a', 'b', 'c', 'd', 'e']



### Solution 2
In the second solution (the second fastest) we will use a python module called `itertools`, a class called `chain` and a function called `from_iterable()` to "flatten" the list


```python
from itertools import chain
list_1 = ["a", "b", ["c", "d"], "e"]
list(chain.from_iterable(list_1))
```




    ['a', 'b', 'c', 'd', 'e']



### Solution 3
This next approach is the fastest, using `functools.reduce()` and `operator.iconcat` to flatten the list.
`functools.reduce()` is imported from the `functools` module and takes a function, applies it to an initialised iterable and cumulatively spreads the values into the third and last argument, another iterable. Now, in this case, we are going to use `operator.iconcat` as the function which is essentially imitating the operator `+=`.


```python
import functools
import operator

lst = ["a", "b", ["c", "d"], "e"] #List to be flattened

flat_list = functools.reduce(operator.iconcat, lst, [])

print(flat_list)
```

    ['a', 'b', 'c', 'd', 'e']


## References
https://www.educative.io/edpresso/how-to-flatten-a-list-of-lists-in-python
