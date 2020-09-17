# ╔╗─╔╦╗─╔═╗─╔╗─╔═╗──────╔╗
# ║╚╦╝╠╬═╣═╬═╣╠╗║═╬╦╦═╗╔═╣╚╦═╗╔╗
# ╚╗║╔╣║═╬═║╩╣═╣║╔╣╔╣╬╚╣═╣╔╣╬╚╣╚╗
# ─╚═╝╚╩═╩═╩═╩╩╝╚╝╚╝╚══╩═╩═╩══╩═╝
# Dimension is 1.4649 according to Wikipedia

#------------------------------------------------------------
#-- Motivation ----------------------------------------------
#------------------------------------------------------------
# B=Array{Int}(undef, 1,1)
B=fill(1, 1, 1)
B

h  = size(B)[1]
w  = size(B)[2]
Z  = zeros(Int, h, w)
B = [B Z B ;
     Z B Z ;
      B Z B]

#------------------------------------------------------------
#--- Function -----------------------------------------------
#------------------------------------------------------------
function selfRep(ICMat, width)
    B = ICMat
    h  = size(B)[1]
    w  = size(B)[2]
    Z  = zeros(Int, h, w)
    B = [B Z B ;
         Z B Z ;
          B Z B]

    total = size(ICMat)[1]*3 # I need to track the size throughout
    if (4*w)<width
        B = selfRep(B, width)
    end
    return B
end

#------------------------------------------------------------
#-- Plot ----------------------------------------------------
#------------------------------------------------------------
(mat = selfRep(fill(1, 1, 1), 100)) |> size
GR.imshow(mat)

## Export
using Random; Random.seed!(7)
name = String("/tmp/$(randstring(6)).png")
GR.savefig(name)
;convert -resize 600x600 -quality 100 $name $name 


#............................................................
#... Animation ...............................................
#............................................................

;mkdir /tmp/frac
n = 10
for i in 1:n
    mat = selfRep(fill(1, 1, 1), i)
    GR.imshow(mat)
    name = string("/tmp/frac/", lpad(i, 5, "0"), ".png")
    GR.savefig(name)
    print(100*i/n)
end
# ;convert -resize 600x600 -delay 10 /tmp/frac/*.png /tmp/frac/0.gif

#------------------------------------------------------------
#---- Random Feedback ---------------------------------------
#------------------------------------------------------------


using GR
function R(B, Z)
    if rand(1:2)==1
        return B
    else
        return Z
    end
end
function selfRep(ICMat, width)
    B = ICMat
    h  = size(B)[1]
    w  = size(B)[2]
    Z  = zeros(Int, h, w)
    B = [R(B, Z) R(B, Z) R(B, Z) ;
         Z B       Z;
         R(B, Z) R(B, Z) R(B, Z)]
    if (3*w)<width
        B = selfRep(B, width)
    end
    return B
end
mat = selfRep(fill(1, 1, 1), 100)
GR.imshow(mat)

# TODO Fix the measurement first
mat2 = selfRep(fill(1, 1, 1), 1000)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = selfRep(fill(1, 1, 1), 500)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Vicsek_fractal#Construction
log(5)/log(3)