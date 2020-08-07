---
title: Variable Scope of Nested Functions
tags: [bash, Julia, Notebooks/Programming, Programming]
created: '2020-07-19T02:18:32'
---

# Variable Scope of Nested Functions

Using Python and Julia can be very confusing if you are used to using ***R*** and `bash`. 

## Languages that pass variables up to parents

Functions defined in ***R*** and `bash` will *pass* variables up into there parent function, for example consider the following:

## ***R***

```r
outer <- function() {
  inner()
  print(x)
}

inner <- function() {
  x <- 3
}

outer()

```
    3

## `bash`

```bash
outer() {
  inner
  echo "${x}"
}

inner() {
  x=3
}

outer
```
    3

## Languages that don't pass variables up to parents

### Using Attributes

whereas in *Python* you would need to make the variable an attribute of the function first (I'm not sure if this feature exists in *Julia*?):

```python
def outer():
    x = inner()
    print(str(inner.x))

def inner():
    inner.x = 3

outer()
```

### Using Return


### Julia

```julia
function outer()
    x=subfunction()
    print(x)
end

function subfunction()
    x=4
    return x
end

outer()
```
    3

```python
def outer():
    x = inner()
    print(str(x))

def inner():
    x = 3
    return x

outer()
```
    3