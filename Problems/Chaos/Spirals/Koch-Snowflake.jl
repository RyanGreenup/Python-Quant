using Shapefile
using Luxor
using Pkg


#------------------------------------------------------------
#-- Dragon Curve -------------------------------------
#------------------------------------------------------------


function snowflake(length, level, 🐢, s)
    scale(s)
    if level == 0
        Forward(🐢, 100)
        Turn(🐢, -90)
        Rotate(90)
#        Rectangle(🐢, length, length)
        return
    end
    length = length/9
    snowflake(length, level-1, 🐢)
    Turn(🐢, -60)
    snowflake(length, level-1, 🐢)
    Turn(🐢, 2*60)
    snowflake(length, level-1, 🐢)
    Turn(🐢, -180/3)
    snowflake(length, level-1, 🐢)
end
@png begin
    🐢 = Turtle()
    Pencolor(🐢, 1.0, 0.4, 0.2)
    Penup(🐢)
    Turn(🐢,180)
    Forward(🐢, 200)
    Turn(🐢,180)
    Pendown(🐢)
    levels = 10
    snowflake(9^(levels), levels, 🐢, 1)
end 800 800 "./snowFlat600.png"


#------------------------------------------------------------
#-- Flat Snowflake ----------------------------------
#------------------------------------------------------------


function snowflake(length, level, 🐢, s)
    scale(s)
    if level == 0
        Forward(🐢, length)
#        Rectangle(🐢, length, length)
        return
    end
    length = length/9
    snowflake(length, level-1, 🐢)
    Turn(🐢, -60)
    snowflake(length, level-1, 🐢)
    Turn(🐢, 2*60)
    snowflake(length, level-1, 🐢)
    Turn(🐢, -180/3)
    snowflake(length, level-1, 🐢)
end
@png begin
    🐢 = Turtle()
    Pencolor(🐢, 1.0, 0.4, 0.2)
    Penup(🐢)
    Turn(🐢,180)
    Forward(🐢, 200)
    Turn(🐢,180)
    Pendown(🐢)
    levels = 10
    snowflake(9^(levels), levels, 🐢, 1)
end 800 800 "/tmp/snowFlat600.png"


#------------------------------------------------------------
#--- Round Snowflake Working ---------------------------------
#------------------------------------------------------------

function snowflake(length, level, 🐢)
if level == 0
#    Forward(🐢, length)
    Circle(🐢, 1)
    return
end
length = length/9
snowflake(length, level-1, 🐢)
Turn(🐢, -60)
snowflake(length, level-1, 🐢)
Turn(🐢, 2*60)
snowflake(length, level-1, 🐢)
Turn(🐢, -60)
snowflake(length, level-1, 🐢)
end
🐢 = Turtle()
@svg begin
for i in 1:3
    levels = 9
    snowflake(8^(levels-1), levels, 🐢)
    Turn(🐢, 120)
end
end 2000 2000 "./snowCurve.svg"



0 "/tmp/snowCurve.png"

# The starting length must be such that the final length = 1 pixel
# this depends on the levels
# The levels must hence be fit to the resolution such that
# the only variable is the resolution.
# There is only two variables levels and resolution
# length depends on the levels and for a perfect snowflake
# the levels depends on the resolution.


using Images, TestImages, Colors, ImageMagick
# Load Image Back in
img = load("/tmp/snowCurve.png")
# Convert to Grayscale so only 2D
imgg = Gray.(img)
# convert to Matrix
mat = convert(Array{Float64}, imgg)

# 1 is white
    # so make all 1s 0 and everything else 1

for i in 1:size(mat)[1]
    for j in 1:size(mat)[2]
        if mat[i, j]==1
            mat[i,j]=0
        else
            mat[i,j]=1
        end
    end
end


sum(mat)

using GR
GR.imshow(mat)
mat

mat2 = selfRep(fill(1, 1, 1), 1000)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = selfRep(fill(1, 1, 1), 500)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Vicsek_fractal#Construction
log(5)/log(3)

#------------------------------------------------------------
#--- Dragon -------------------------------------------------
#------------------------------------------------------------
function dragon(🐢, order, length)
    print(" ") # Don't remove this or code breaks, I don't know why?
    Turn(🐢, order*45)
    dragon_iterate(🐢, order, length, 1)
end
function dragon_iterate(🐢, order, length, sign)
    if order==0
        Forward(🐢, length)
    else
        rootHalf = sqrt(0.5)
        dragon_iterate(🐢, order -1, length*rootHalf, 1)
        Turn(🐢, sign * -90)
        dragon_iterate(🐢, order -1, length*rootHalf, -1)
    end
end
;mkdir /tmp/dragon
@png begin
    🐢 = Turtle()
    Turn(🐢, 180)
    Penup(🐢)
    Forward(🐢, 200)
    Pendown(🐢)
    Turn(🐢, 180)
    dragon(🐢, 15, 400)
end 1000 1000

using Images, TestImages, Colors, ImageMagick
# Load Image Back in
img = load("/tmp/dragon.png")
# Convert to Grayscale so only 2D
imgg = Gray.(img)
# convert to Matrix
mat = convert(Array{Float64}, imgg)

# 1 is white
    # so make all 1s 0 and everything else 1

for i in 1:size(mat)[1]
    for j in 1:size(mat)[2]
        if mat[i, j]==1
            mat[i,j]=0
        else
            mat[i,j]=1
        end
    end
end

