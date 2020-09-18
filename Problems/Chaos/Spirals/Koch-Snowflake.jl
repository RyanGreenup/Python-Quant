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

function Triangle(n)
    🐢 = Turtle()
    dist = 600/n  # Perimeter of 600
    for i in 1:n
        Forward(🐢, dist)
        Turn(🐢, -360/n)
    end
    Forward(🐢, dist)
end

function linePoint()
    # Recenter
    🐢 = Turtle()
    Penup(🐢)
    Turn(🐢, 180)
    Forward(🐢, 200)
    Turn(🐢, 180)
    Pendown(🐢)
    # Make Spike
    Forward(🐢, 100)
    Turn(🐢, -60)
    Forward(🐢, 100)
    Turn(🐢, 2*60)
    Forward(🐢, 100)
    Turn(🐢, -60)
    Forward(🐢, 100)
    # Turn Back
    Penup(🐢)
    Turn(🐢, -180)
    Forward(🐢, 3*100)
    Pendown(🐢)
    Turn(🐢, -180)
end
@svg begin
    linePoint()
end


function snowflake(length, level, 🐢)
    if level == 0
        Forward(🐢, length)
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
@svg begin
    🐢 = Turtle()
    for i in 1:6
        snowflake(200000, 6, 🐢)
        Turn(🐢, 60)
    end
end

#







function snowflake(length, level, 🐢)
    if level == 0
        Forward(🐢, length)
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
@svg begin
    🐢 = Turtle()
    snowflake(60000, 5, 🐢)
    rotate(60)
end

#
















#------------------------------------------------------------
#-- Minkowski Sausage ---------------------------------------
#------------------------------------------------------------

function linePoint()
    🐢 = Turtle()
    for i in 1:8
        # Recenter
        # Make Spike
        Forward(🐢, 10)
        Turn(🐢, -90)
        Forward(🐢, 10)
        Turn(🐢, 90)
        Forward(🐢, 10)
        Turn(🐢, 90)
        Forward(🐢, 2*10)
        Turn(🐢, -90)
        Forward(🐢, 10)
        Turn(🐢, -90)
        Forward(🐢, 10)
        Turn(🐢, 90)
        Forward(🐢, 10)
        # Remaining Turn
        Turn(🐢, -90)
    end
end
@svg begin
    linePoint()
end