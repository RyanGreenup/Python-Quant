# 
# ╭━╮╭━╮╱╱╱╱╭━━━╮
# ┃┃╰╯┃┃╱╱╱╱┃╭━╮┃
# ┃╭╮╭╮┣╮╱╭╮┃╰━━┳━━┳╮╭┳━━┳━┳━━╮
# ┃┃┃┃┃┃┃╱┃┃╰━━╮┃╭╮┃┃┃┃╭╮┃╭┫┃━┫
# ┃┃┃┃┃┃╰━╯┃┃╰━╯┃╰╯┃╰╯┃╭╮┃┃┃┃━┫
# ╰╯╰╯╰┻━╮╭╯╰━━━┻━╮┣━━┻╯╰┻╯╰━━╯
# ╱╱╱╱╱╭━╯┃╱╱╱╱╱╱╱┃┃
# ╱╱╱╱╱╰━━╯╱╱╱╱╱╱╱╰╯
#  This is actuall Sierpinskies Carpet
#------------------------------------------------------------
#-- Motivation ----------------------------------------------
#------------------------------------------------------------
# B=Array{Int}(undef, 1,1)
B=fill(1, 1, 1)
B

h  = size(B)[1]
w  = size(B)[2]
Z  = zeros(Int, h, w)
B = [Z B Z ;
     Z Z Z ;
     B Z B]

#------------------------------------------------------------
#--- Function -----------------------------------------------
#------------------------------------------------------------
using LinearAlgebra
function selfRep(ICMat, width)
    B = ICMat
    h  = size(B)[1]
    w  = size(B)[2]
    Z  = zeros(Int, h, w)
Bt=transpose(B)
B = 0.5*[Bt B Bt ;
         B Z B ;
         Bt B Bt]
    if (4*w)<width
        B = selfRep(B, width)
    end
    return B
end

#------------------------------------------------------------
#-- Plot ----------------------------------------------------
#------------------------------------------------------------
using GR
(mat = selfRep([1 0 0; 0 1 0; 0 0 1], 600)) 
GR.imshow(mat)

## Export
using Random #; Random.seed!(7)
name = String("/tmp/$(randstring(6)).png")
GR.savefig(name)
;convert -resize 600x600 -quality 100 $name $name 

for i in range(10, 400; length = 20)
    print(i)
    (mat = selfRep([0 1 0; 0 0 0; 1 0 1], i)) |> size
    GR.imshow(mat)
    name = string("/tmp/frac/", lpad(string(round(i)), 9, "0"), ".png")
    print(name, "\n")
    GR.savefig(name)
end

mat = [1 2 3; 4 5 6; 7 8 9]

mat[1,:]

function flip(mat)
    newmat=zeros(Int, size(mat)[1], size(mat)[2])
    for i in 1:size(mat)[1]
        newmat[i,:]=reverse(mat[:,i])
    end
    newmat = transpose(newmat)
    return newmat
end
mat
rotate(mat)
