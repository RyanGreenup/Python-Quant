@time include("./Julia-Set-Dimensions-functions.jl")

############################################################
#### Investigate Plot #######################################
############################################################
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






@time data=scaleAndMeasure(500, 1000 , 9)
CSV.write("./Julia-Set-Scaling.csv", data)
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

# import Gadfly
# 
# iris = dataset("datasets", "iris")
# p = Gadfly.plot(iris, x=:SepalLength, y=:SepalWidth, Geom.point);
# img = SVG("iris_plot.svg")
# draw(img, p)


# The trailing `;` supresses output, equivalently:



## Other Fractals to look at for this maybe?
  # GR.imshow(test_mat) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.37-0.2*im)) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.38-0.2*im)) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.39-0.2*im)) # PyPlot uses interpolation = "None"