using GR
############################################################
### Julia / MandelBrot Functions ###########################
############################################################


function juliaSet(z, num, my_func, boolQ=true)
    count = 1
    # Define z1 as z
    z1 = z
    # Iterate num times
    while count ≤ num
        # check for divergence
        if real(z1)^2+imag(z1)^2 > 2^2
            if(boolQ) return 0 else return Int(count) end
        end
        #iterate z
        z1 = my_func(z1) # + z
        count=count+1
    end
        #if z hasn't diverged by the end
    if(boolQ) return 0 else return Int(count) end
end

function mandelbrot(z, num, my_func, boolQ = true)
    count = 1
    # Define z1 as z
    z1 = z
    # Iterate num times
    while count ≤ num
        # check for divergence
        if real(z1)^2+imag(z1)^2 > 2^2
            if(boolQ) return 0 else return Int(count) end
        end
        #iterate z
        z1 = my_func(z1) 
        count=count+1
    end
        #if z hasn't diverged by the end
    return 1 # Int(num)
    if(boolQ) return 0 else return Int(count) end
end

function test(x, y)
    if(x<1) return x else return y end
end
test(9, 999)


############################################################
##### Build a Matrix Image #################################
############################################################

function make_picture(width, height, my_func)
    pic_mat = zeros(width, height)
    zoom = 0.3
    for j in 1:size(pic_mat)[2]
        for i in 1:size(pic_mat)[1]
            x = (j-width/2)/(width*zoom)
            y = (i-height/2)/(height*zoom)
            pic_mat[i,j] = juliaSet(x+y*im, 256, my_func)
        end
    end
    return pic_mat
end

# function make_picture(width, height, my_func)
#     [ juliaSet((x-width)/2+(y-height)/2*im, 256, my_func ) for x in (1:width)/width, y in (1:height)/height ]
# end

############################################################
### Make the Outline ########################################
############################################################
# TODO this should be inside a function

"""
# Outline 
Sets all elements with neighbours on all sides to 0
## TODO
I should probably set that arbitrary 100 to something related to a mean value
maybe?
"""
function outline(mat)
    work_mat = copy(mat)
    for col in 2:(size(mat)[2]-1)
        for row in 2:(size(mat)[1]-1)
            ## Make the inside 0, we only want the outline
            neighbourhood = mat[row-1:row+1,col-1:col+1]
            if sum(neighbourhood) >= 9 # 9 squares
                work_mat[row,col] = 0
            end
        end
    end
    return work_mat
end

using GR
test_mat = make_picture(800,800, z -> z^2 + 0.37-0.2*im)
test_mat = make_picture(800,800, z -> z^2 + -0.123+0.745*im)
GR.imshow(test_mat) # PyPlot uses interpolation = "None"

test_mat = outline(test_mat)
GR.imshow(test_mat) # PyPlot uses interpolation = "None"
# GR.savefig("/home/ryan/Dropbox/Studies/2020Spring/QuantProject/Current/Python-Quant/Problems/fractal-dimensions/media/outline-Julia-set.png")

## Return the perimeter
sum(test_mat)


mat2 = outline(make_picture(350,350, z -> z^2 + -0.123+0.745*im))
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = outline(make_picture(400,400, z -> z^2 + -0.123+0.745*im))
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
# https://en.wikipedia.org/wiki/Vicsek_fractal#Construction
# 1.3934 Douady Rabbit
#


# halving from 600 to 300 pixels gives a change of about X 3.78, so the dimension would be about 1.9.
# 
# i.e. 2^1.9 = 3.8.


## Other Fractals to look at for this maybe?
  # GR.imshow(test_mat) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.37-0.2*im)) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.38-0.2*im)) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.39-0.2*im)) # PyPlot uses interpolation = "None"

using DataFrames
using Gadfly
using GLM

using SharedArrays
using Distributed


function scaleAndMeasure(min, max, n)
    # The scale is equivalent to the resolution, the initial resolution could be
    # set as 10, 93, 72 or 1, it's arbitrary

    scale = [Int(ceil(i)) for i in range(min, max, length=n) ]

    # mass  =  [ sum(outline(make_picture(Int(i), Int(i), z -> z^2 + -0.123+0.745*im))) for i in res ]
    
    mass = SharedArray{Float64}(n)
    @distributed for i = 1:n
        j = scale[i]
        mass[i] = sum(outline(make_picture(Int(j), Int(j), z -> z^2 + -0.123+0.745*im)))
    end
    

    data = DataFrame()
    data.scale = scale
    data.mass  = mass
    return data
end

@time data=scaleAndMeasure(100, 500, 9)
data.scale = [log(i) for i in data.scale]
data.mass  = [log(i) for i in data.mass]
data

mod   = lm(@formula(mass ~ scale), data)
p = Gadfly.plot(data, x=:scale, y=:mass, Geom.point)

print("the slope is $(round(coef(mod)[2], sigdigits=4))")
print(mod)
print("\n")
return mod
  
a = SharedArray{Float64}(10)
@distributed for i = 1:10
    a[i] = i
end

# using Gadfly, RDatasets
# import Gadfly
# 
# iris = dataset("datasets", "iris")
# p = Gadfly.plot(iris, x=:SepalLength, y=:SepalWidth, Geom.point);
# img = SVG("iris_plot.svg")
# draw(img, p)


# The trailing `;` supresses output, equivalently:

.