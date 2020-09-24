# Sierpinsky Triangle using Pascal
# ┏━┓╋╋┏━┓
# ┃╋┣━┓┃━╋━┳━┓┏┓
# ┃┏┫╋┗╋━┃━┫╋┗┫┗┓
# ┗┛┗━━┻━┻━┻━━┻━┛

[binomial(j,i) for i in 0:4, j in 0:4]
[binomial(i,j) for i in 0:4, j in 0:4]
[binomial(j+i,i) for i in 0:4, j in 0:4]
[isodd(binomial(j+i,i)) for i in 0:9, j in 0:9]

function pascal(n)
    mat = [isodd(binomial(BigInt(j+i),BigInt(i))) for i in 0:n, j in 0:n]
    return mat
end 
GR.imshow(pascal(999))
GR.savefig("../../Report/media/pascal-sierpinsky-triangle.png")

#------------------------------------------------------------
#-- Calculate Dimension -------------------------------------
#------------------------------------------------------------

mat2 = pascal(3000)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = pascal(2000)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle
log(3)/log(2)

