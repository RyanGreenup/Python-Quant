#------------------------------------------------------------
#--- Dragon -------------------------------------------------
#------------------------------------------------------------
using Luxor, Shapefile

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
end 1000 1000 "/tmp/a.png"

#------------------------------------------------------------
#---- Animation ---------------------------------------------
#------------------------------------------------------------
# * Use GR to Save a Bunch of Images
  ## GR is faster than PyPlot
function make_dragon(i, filename)
    @png begin
        🐢 = Turtle()
        Turn(🐢, 180)
        Penup(🐢)
        Forward(🐢, 200)
        Pendown(🐢)
        Turn(🐢, 180)
        dragon(🐢, i, 400)
    end 1000 1000 filename
end


function save_images(count)
    try
        mkdir("/tmp/gifs")
    catch
    end
    for i in 1:count
        name = string("/tmp/gifs/j", lpad(i, 5, "0"), ".png")
        make_dragon(i, name)
    end
end

save_images(15) # Number  and Res
# ;convert -delay 40 *.png 0.gif # Requires imagemagick
# ;ffmpeg # (Use ffmpeg, it's more reliable and verbose)
#------------------------------------------------------------
#-- Calculate Dimension -------------------------------------
#------------------------------------------------------------

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