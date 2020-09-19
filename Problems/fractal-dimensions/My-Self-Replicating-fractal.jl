function matJoin(A, B)
    function nrow(X)
        return size(X)[1]
    end
    function ncol(X)
        return size(X)[2]
    end
    emptymat = zeros(Bool, max(size(A)[1], size(B)[1]) ,sum(ncol(A) + ncol(B)) )
    emptymat[1:nrow(A), 1:ncol(A)] = A
    emptymat[1:nrow(B), (ncol(A)+1):ncol(emptymat)] = B
    return emptymat
end

function mywalk(B, n)
    for i in 1:n 
        B = matJoin(B, rotl90(B));
    end
    return B
end

using GR
GR.imshow(mywalk([1 1 1 ; 1 0 0 ; 1 0 0], 13))

#------------------------------------------------------------
#-- Dimension -----------------------------------------------
#------------------------------------------------------------
# Each time it iterates there are 5 more
# but the overall dimensions of the square increases by a factor of 3
# so 3^D=5 ==> log_3(5) = log(5)/log(3) = D 

mat2 = mywalk(fill(1, 1, 1), 10)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = mywalk(fill(1, 1, 1), 11)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Vicsek_fractal#Construction
# log(5)/log(3) # what would this dimension be ???

