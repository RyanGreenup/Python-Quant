function juliaSet(z, num, my_func)
    count = 1
    # Define z1 as z
    z1 = z
    # Iterate num times
    while count ≤ num
        # check for divergence
        if abs(z1)>2
            return Int(count)
        end
        #iterate z
        z1 = my_func(z1) # + z
        count=count+1
    end
        #if z hasn't diverged by the end
    return Int(num)
end


function mandelbrot(z, num, my_func)
    count = 1
    # Define z1 as z
    z1 = z
    # Iterate num times
    while count ≤ num
        # check for divergence
        if abs(z1)>2
            return Int(count)
        end
        #iterate z
        z1 = my_func(z1) 
        count=count+1
    end
        #if z hasn't diverged by the end
    return Int(num)
end

function make_picture(width, height, my_func)
    pic_mat = zeros(width, height)
    zoom = 0.3
    for i in 1:size(pic_mat)[1]
        for j in 1:size(pic_mat)[2]
            x = (j-width/2)/(width*zoom)
            y = (i-height/2)/(height*zoom)
            pic_mat[i,j] = juliaSet(x+y*im, 256, my_func)
        end
    end
    return pic_mat
end


using FITSIO
function save_picture(filename, matrix)
    f = FITS(filename, "w");
    # data = reshape(1:100, 5, 20)
    # data = pic_mat
    write(f, matrix)  # Write a new image extension with the data

    data = Dict("col1"=>[1., 2., 3.], "col2"=>[1, 2, 3]);
    write(f, data)  # write a new binary table to a new extension

    close(f)
end

using PlotlyJS
function plotly_matrix(matrix)
    trace = PlotlyJS.heatmap(
        z=matrix
    )
    PlotlyJS.plot(trace)
end

using PyPlot
function py_imshow_dp(matrix)
    pic = PyPlot.imshow(matrix, interpolation = "none")
    PyPlot.display_figs()
    return pic
end

# f(z) = z^9
# py_imshow_dp(make_picture(500, 500, f))

py_imshow_dp(make_picture(500, 500, z -> z^2))

# * Save Picture
#------------------------------------------------------------
# my_pic = make_picture(500, 500, z -> z^2)
# save_picture("/tmp/a.fits", my_pic)

#* View in VSCode
#------------------------------------------------------------
# py_imshow_dp(make_picture(100, 100, z -> z^2))
# View with Plotly

# * View with Plotly
#------------------------------------------------------------
plotly_matrix(make_picture(100, 100, z -> z^2))


# * View External for scripting
#------------------------------------------------------------
# using GR
# GR.imshow(make_picture(500, 500, z -> z^2))
# print("Press any key")
# readline()

# @time make_picture(20000, 20000, z -> z^2)
#
# Scale appears to be linear
#   100^2 is 0.003
#  1000^2 is 0.3
# 10000^2 is 30
# 20000^2 is 180s


# * Simulate various fractals

for j in (1:10)
    for i in (1:8)/(2*π)
        py_imshow_dp(make_picture(100, 100, z -> z^2 + j/10*exp(im*i)))
        sleep(1/6000)
    end
end


# * Try something logarithmic
for i in (1:80)/(2*4*π)
    py_imshow_dp(make_picture(100, 100, z -> (1-z^3/6)/(z-z/z^2)^2  ))
    sleep(1/6000)
end


py_imshow_dp(make_picture(1000, 1000, z -> (1-z^3/6)/(z-z/z^2)^2  ))
py_imshow_dp(make_picture(100, 100, z -> log(z^2 -1) ))


# ** Herman Ring

# * Try something logarithmic
for i in (1:80)/(2*π)
    py_imshow_dp(make_picture(100, 100, z -> ((2^2*(z-i))/(z-sqrt(i)))  ))
    sleep(1/6000)
end

τ = (sqrt(5)-1)/2
py_imshow_dp(make_picture(100, 100, z -> exp(2*pi*im*τ)*z^2*(z-4)/(1-4*z)  ))
py_imshow_dp(make_picture(100, 100, z -> z^z-0.9  ))


GR.imshow(make_picture(400, 400, z -> z^2 - 1/2 + 0.6*im)) # PyPlot uses interpolation = "None"


GR.imshow(mat)

# * Use GR to Save a Bunch of Images
  ## GR is faster than PyPlot

using GR
function save_images(count, res)
    try
        mkdir("/tmp/gifs")
    catch
    end
    j = 1
    for i in (1:count)/(40*2*π)
        j = j + 1
        GR.imshow(make_picture(res, res, z -> z^2 + 0.8*exp(i*im*9/2))) # PyPlot uses interpolation = "None"
        name = string("/tmp/gifs/j", lpad(j, 5, "0"), ".png")
        GR.savefig(name)
    end
end

save_images(1200, 1500) # Number  and Res
# ;convert -delay 40 *.png 0.gif # Requires imagemagick
# ;ffmpeg # (Use ffmpeg, it's more reliable and verbose)

pic = PyPlot.imshow(make_picture(400, 400, z -> z^2), interpolation = "none")


# GR is faster
# PyPlot stays inside VS Code



# * Save as Fits (This is only necessary for a high res (>4k) Export)

function save_images(count, res)
    try
        mkdir("/tmp/gifs")
    catch
    end
    j = 1
    for i in (1:count)/(40*2*π)
        j = j + 1
        name = string("/tmp/gifs/j", lpad(j, 5, "0"), ".fits")
        save_picture(name, make_picture(res, res, z -> z^2 + 0.8*exp(i*im*9/2)))
    end
end

save_images(7, 3000)

#------------------------------------------------------------
#- Resolution Animation--------------------------------------
#------------------------------------------------------------

using Plots
Plots.pyplot()

mat = make_picture(10, 10, z -> z^2 - 1/2 + 0.6*im)

function makePlot(mat, backend=pyplot())
    backend
    plt = Plots.plot(mat,
                     st=:heatmap,
                     color=:coolwarm,
                    colorbar_title="", ticks = false, legend = false, yflip = true, fmt = :png)
    return plt
end
plt = makePlot(mat)