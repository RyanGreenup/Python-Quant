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

@svg begin
    fontsize(50)
    text("hello world")
    Forward(Turtle(), 100)
end

if 2%1==1
    print(3)
else
    print(7)
end


φ = 1.61803398875
φ = 1.618033988749894848204586834365 #  6381177203 0917980576 2862135448 6227052604 6281890244 9707207204 1893911374 8475408807 5386891752 1266338622 2353693179 3180060766 7263544333 8908659593 9582905638 3226613199 2829026788 0675208766 8925017116 9620703222 1043216269 5486262963 1361443814 9758701220 3408058879 5445474924 6185695364 8644492410 4432077134 4947049565 8467885098 7433944221 2544877066 4780915884 6074998871 2400765217 0575179788 3416625624 9407589069 7040002812 1042762177 1117778053 1531714101 1704666599 1466979873 1761356006 7087480710 1317952368 9427521948 4353056783 0022878569 9782977834 7845878228 9110976250 0302696156 1700250464 3382437764 8610283831 2683303724 2926752631 16533
ψ = φ^-1
ψ = 0.61803398875
function sfSeeds(ratio)
🐢 = Turtle()
    for θ in [(ratio*2*π)*i for i in 1:6000]
        gsave()
        scale(0.05)
        rotate(θ)
        Forward(🐢, 1)
        Rectangle(🐢, 50, 50)
        grestore()
    end
    label = string("Ratio = ", round(ratio, digits = 8))
    textcentered(label, 100, 200)
end

@svg begin
    sfSeeds( φ )
end 600 600 "/tmp/out.svg"


############################################################
####### Try and Scale the seeds ############################
############################################################


φ = 1.61803398875
φ = 1.618033988749894848204586834365 #  6381177203 0917980576 2862135448 6227052604 6281890244 9707207204 1893911374 8475408807 5386891752 1266338622 2353693179 3180060766 7263544333 8908659593 9582905638 3226613199 2829026788 0675208766 8925017116 9620703222 1043216269 5486262963 1361443814 9758701220 3408058879 5445474924 6185695364 8644492410 4432077134 4947049565 8467885098 7433944221 2544877066 4780915884 6074998871 2400765217 0575179788 3416625624 9407589069 7040002812 1042762177 1117778053 1531714101 1704666599 1466979873 1761356006 7087480710 1317952368 9427521948 4353056783 0022878569 9782977834 7845878228 9110976250 0302696156 1700250464 3382437764 8610283831 2683303724 2926752631 16533
ψ = φ^-1
ψ = 0.61803398875
function sfSeeds(ratio)
🐢 = Turtle()
    i = 0
    for θ in [(ratio*2*π)*i for i in 1:189000]
    i = i + 1
        gsave()
        scale(0.05)
#        if Int(string(θ)[1])%2==0
#            Pencolor(🐢, 0.8, 0.3, 0.3)    
#        else
#            Pencolor(🐢, 0.3, 0.3, 0.8)
#        end
        rotate(θ)
        Forward(🐢, 1)
        Circle(🐢, sqrt(i))
        grestore()
    end
    label = string("Ratio = ", round(ratio, digits = 8))
    textcentered(label, 100, 200)
end
@svg begin
    sfSeeds(φ)
end 3000 3000 "/tmp/out.svg"


# It appears that the square root of the seed number causes very good iteration,
# lets increase the size

φ=1.61803398874989484820458683436563811772030917980576286213544862270526046281890244970720720418939113748475408807538689175212663386222353693179318006076672635443338908659593958290563832266131992829026788067520876689250171169620703222104321626954862629631361443814975870122034080588795445474924618569536486444924104432077134494704956584678850987433944221254487706647809158846074998871240076521705751797883416625624940758906970400028121042762177111777805315317141011704666599146697987317613560067087480710131795236894275219484353056783002287856997829778347845878228911097625003026961561700250464338243776486102838312683303724292675263116533
function sfSeeds(ratio)
🐢 = Turtle()
    i = 0
    for θ in [(ratio*2*π)*i for i in 1:30000]
    i = i + 1
        gsave()
        scale(0.05)
#        if Int(string(θ)[1])%2==0
#            Pencolor(🐢, 0.8, 0.3, 0.3)    
#        else
#            Pencolor(🐢, 0.3, 0.3, 0.8)
#        end
        rotate(θ)
        Forward(🐢, 1)
        Circle(🐢, sqrt(i))
        grestore()
    end
    # label = string("Ratio = ", round(ratio, digits = 8))
    # textcentered(label, 100, 200)
end
@svg begin
    sfSeeds(φ)
end 3000 3000 "/tmp/sunflowersqrt.svg"





## Make a bunch of animations

for ratio in range(0, φ, length = 50000) # Changes rapidly, need about 200K frames for all 0 → 1
    name = string("Flower-", ratio, ".png")   # 2400 frames makes 0:0.01 smooth
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

