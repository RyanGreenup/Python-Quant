using Shapefile
using Luxor
using Pkg

# See Also 
# https://stackoverflow.com/a/45213200/12843551

using Luxor
Drawing(1000, 1000, "hello-world.png")
origin()
sethue("red")
fontsize(50)
text("hello world")
Forward(Turtle(), 100)
finish()
preview()

if 2%1==1
    print(3)
else
    print(7)
end


φ = 1.61803398875
ψ = φ^-1
ψ = 0.61803398875
function sfSeeds(ratio)
    🐢 = Turtle()
    colour = true
    for θ in [(ratio*2*π)*i for i in 1:3000]
        gsave()
        scale(0.05)
        rotate(θ)
        if colour
            colour = !colour
            Pencolor(🐢, 0.8, 0.3, 0.3)    
        else
            Pencolor(🐢, 0.3, 0.3, 0.8)
        end
        Forward(🐢, 1)
        Rectangle(🐢, 50, 50)
        grestore()
    end
    label = string("Ratio = ", round(ratio, digits = 8))
    textcentered(label, 100, 200)
end
@svg begin
    sfSeeds(φ)
end 600 600


## Make a bunch of animations

for ratio in range(0, 0.01, length = 2400) # Changes rapidly, need about 200K frames for all 0 → 1
    name = string("Flower-", ratio, ".png")
    Drawing(600, 600, name)
    origin()
    background("white")
    sfSeeds(ratio)
    finish()
    preview()
end

[i for i in range(0, 1.5, length=5)] +


## * Can't be a quotient
## ** This is the definition of the golden ratio
## At the same time a perfect ratio and a value that is naturally transendenta
## pi and e don't work because they are near other fractions
## 
## There's a relationship to the fibonacci sequence that can be seen by considering the limits of the ratios of successive terms.
## 
## $\frac{1}{\psi} = \phi$




#############################################33
####Example from Docs #######################33
#############################################33



@svg begin
    spiraldata = [
    (-2, "Lituus",      50),
    (-log(0.61)/(pi/2), "Golden",      0.00009),
    (-1, "Hyperbolic", 100),
    ( 1, "Archimedes",   1),
    ( 2, "Fermat",       5)]

    grid = GridRect(O - (200, 0), 130, 50)

    for aspiral in spiraldata
        @layer begin
            translate(nextgridpoint(grid))
            spiral(last(aspiral), first(aspiral), period=20pi, :stroke)
            label(aspiral[2], :S, offset=100)
        end
    end
end

