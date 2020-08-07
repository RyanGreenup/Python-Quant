#!/usr/bin/python

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