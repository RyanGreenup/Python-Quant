using Shapefile
using Luxor

## Hello World

@svg begin
    Forward(Turtle(), 100)
    Turn(Turtle(), 90)
    Forward(Turtle(), 100)
end


function mysquare(t, len)
    @svg begin
        for i in 1:4
            Forward(t, len)
            Turn(t, 90)
        end
    end
end
🐢 = Turtle()
mysquare(🐢, 200)


function poly(t, len, n)
    @svg begin
        for i in 1:n
            Forward(t, len)
            Turn(t, 360/n)
        end
    end
end
poly(🐢, 50,7)



function Psuedocircle(t, r)
        circ = 2*π*r
        n = 999
        for i in 1:n
            Forward(t, circ/n)
            Turn(t, 360/n)
        end
end

@svg begin
Psuedocircle(🐢, 50)
end


function Psuedoarc(t, r, θ)
        circ = 2*π*r
        prop = θ/360
        n = 999
        for i in 1:(n*prop)
            Forward(t, circ/n)
            Turn(t, 360/n)
    end
end

@svg begin
    Psuedoarc(🐢, 50, 180)
end 

@svg Psuedoarc(🐢, 50, 180) 400 1200 "/tmp/blah.svg"

@svg circle(O, 20, :fill) 400 1200 "/tmp/test.svg"


### Make Spiral

using Luxor
Drawing(1000, 1000, "hello-world.png")
origin()
sethue("red")
fontsize(50)
text("hello world")
Forward(Turtle(), 100)
finish()
preview()

🐢 = Turtle()
preview()

@svg begin
    Forward( 🐢, 100)
end

