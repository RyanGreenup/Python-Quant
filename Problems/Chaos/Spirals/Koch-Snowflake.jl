using Shapefile
using Luxor
using Pkg


#------------------------------------------------------------
#--- Round Snowflake Working ---------------------------------
#------------------------------------------------------------

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
🐢 = Turtle()
@png begin
    for i in 1:3
        snowflake(60000, 5, 🐢)
        Turn(🐢, 120)
    end
end 600 600 "/tmp/snowCurve.png"

#------------------------------------------------------------
#-- Flat Snowflake ----------------------------------
#------------------------------------------------------------


function snowflake(length, level, 🐢, s)
    scale(s)
    if level == 0
        HueShift(🐢, rand())
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
    levels = 7
    snowflake(9^(levels), levels, 🐢, 2)
end 2000 2000 "/tmp/snowFlat600.png"

using Images, TestImages, Colors, ImageMagick
img = load("/tmp/snowFlat600.png")
img



# Dimension of Snowflake should be log(4)/log(3) ZHU, Zhou, Jia 2003













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