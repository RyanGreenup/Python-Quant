#------------------------------------------------------------
#--- Function -----------------------------------------------
#------------------------------------------------------------

# n_i+1 = 3n_i ==> n = 3^n
function dust(ICMat, width)
    B = ICMat
    h  = size(B)[1]
    w  = size(B)[2]
    Z  = zeros(Int, h, w)
    B = [Z Z B Z;
         B Z Z Z;
         Z Z Z B;
         Z B Z Z]
    if (3*w)<width
        B = dust(B, width)
    end
    return B
end

#------------------------------------------------------------
#-- Plot ----------------------------------------------------
#------------------------------------------------------------
using GR, Plots
using Plots
gr()
p1 = Plots.plot(dust(fill(1, 1, 1), 2),
                    st=:heatmap, clim=(0,1),
                    color=:coolwarm,
                colorbar_title="", ticks = true, legend = false, yflip = true, fmt = :svg)
p2 = Plots.plot(dust(fill(1, 1, 1), 4),
                    st=:heatmap, clim=(0,1),
                    color=:coolwarm,
                colorbar_title="", ticks = true, legend = false, yflip = true, fmt = :svg)

p3 = Plots.plot(dust(fill(1, 1, 1), 16),
                    st=:heatmap, clim=(0,1),
                    color=:coolwarm,
                colorbar_title="", ticks = true, legend = false, yflip = true, fmt = :svg)

p4 = Plots.plot(dust(fill(1, 1, 1), 65),
                    st=:heatmap, clim=(0,1),
                    color=:coolwarm,
                colorbar_title="", ticks = true, legend = false, yflip = true, fmt = :svg)

title = plot(title = "Plot title", grid = false, showaxis = false, bottom_margin = -50Plots.px)

all_dust = Plots.plot(p1, p2, p3, p4, layout = (2, 2), legend = false)
Plots.savefig(all_dust, "./cantr-dust.png")



(mat = dust(fill(1, 1, 1), 9^2)) |> size
p1 = GR.imshow(mat)

## Export
using Random; Random.seed!(7)
name = String("/tmp/$(randstring(6)).png")
GR.savefig(name)
;convert -resize 600x600 -quality 100 $name $name 


#------------------------------------------------------------
#-- Dimension -----------------------------------------------
#------------------------------------------------------------
# Each time it iterates there are 5 more
# but the overall dimensions of the square increases by a factor of 3
# so 3^D=5 ==> log_3(5) = log(5)/log(3) = D 

mat2 = dust(fill(1, 1, 1), 1000)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = dust(fill(1, 1, 1), 500)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Vicsek_fractal#Construction
log(5)/log(3)

