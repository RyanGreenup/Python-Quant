# ╔╗─╔╦╗─╔═╗─╔╗─╔═╗──────╔╗
# ║╚╦╝╠╬═╣═╬═╣╠╗║═╬╦╦═╗╔═╣╚╦═╗╔╗
# ╚╗║╔╣║═╬═║╩╣═╣║╔╣╔╣╬╚╣═╣╔╣╬╚╣╚╗
# ─╚═╝╚╩═╩═╩═╩╩╝╚╝╚╝╚══╩═╩═╩══╩═╝
# Vicsek Fractal
# Dimension is 1.4649 according to Wikipedia

#------------------------------------------------------------
#-- Motivation ----------------------------------------------
#------------------------------------------------------------
# B=Array{Int}(undef, 1,1)
# B=fill(1, 1, 1)
# B=[1 1 1 ; 1 0 0 ; 1 0 0 ]
# B

# h  = size(B)[1]
# w  = size(B)[2]
# Z  = zeros(Int, h, w)
# B = [B r(B) ] 


# A = [1 0 ; 0 1; 0 0]
# B = A
# matJoin(A, B)

# val = zeros(9,9)
# val[1:2, 1:2] = [1 2 ; 3 4]
# val

# type(1==1)

#------------------------------------------------------------
#--- Function -----------------------------------------------
#------------------------------------------------------------

# n_i+1 = 3n_i ==> n = 3^n
function selfRep(ICMat, width)
    B = ICMat
    h  = size(B)[1]
    w  = size(B)[2]
    Z  = zeros(Int, h, w)
    B = [B B B;
         B Z B;
         B B B]
    if (3*w)<width
        B = selfRep(B, width)
    end
    return B
end

#------------------------------------------------------------
#-- Plot ----------------------------------------------------
#------------------------------------------------------------
using GR
(mat = selfRep(fill(1, 1, 1), 9^2)) |> size
GR.imshow(-mat)
GR.savefig("../../Report/media/Vicsek-Fractal.png")

## Export
using Random; Random.seed!(7)
name = String("/tmp/$(randstring(6)).png")
GR.savefig(name)
;convert -resize 600x600 -quality 100 $name $name 


#............................................................
#... Animation ...............................................
#............................................................

;mkdir /tmp/frac
n = 5
for i in n:1
    mat = selfRep(fill(1, 1, 1), 3^i)
    GR.imshow(mat)
    name = string("/tmp/frac/", lpad(i, 5, "0"), ".png")
    GR.savefig(name)
    print(100*i/n)
end
;convert -resize 600x600 -delay 10 /tmp/frac/*.png /tmp/frac/0.gif

#------------------------------------------------------------
#-- Dimension -----------------------------------------------
#------------------------------------------------------------
# Each time it iterates there are 5 more
# but the overall dimensions of the square increases by a factor of 3
# so 3^D=5 ==> log_3(5) = log(5)/log(3) = D 

mat2 = selfRep(fill(1, 1, 1), 1000)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = selfRep(fill(1, 1, 1), 500)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Vicsek_fractal#Construction
log(5)/log(3)

