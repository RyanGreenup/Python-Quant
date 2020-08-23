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
        z1 = my_func(z1) + z
        count=count+1
    end
        #if z hasn't diverged by the end
    return Int(num)
end

function make_picture(width, height, my_func)
    pic_mat = zeros(width, height)
    for i in 1:size(pic_mat)[1]
        for j in 1:size(pic_mat)[2]
            x = j/width
            y = i/height
            pic_mat[i,j] = mandelbrot(x+y*im, 99, my_func)
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
    plot(trace)
end

using PyPlot
function py_imshow_dp(matrix)
    pic = PyPlot.imshow(matrix, interpolation = "none")
    PyPlot.display_figs()
    return pic
end

# f(z) = z^9
# py_imshow_dp(make_picture(500, 500, f))

# py_imshow_dp(make_picture(500, 500, z -> z^π))

# * Save Picture
#------------------------------------------------------------
my_pic = make_picture(500, 500, z -> z^2)
save_picture("/tmp/a.fits", my_pic)

#* View in VSCode
#------------------------------------------------------------
# py_imshow_dp(make_picture(100, 100, z -> z^2))
# View with Plotly
# plotly_matrix(make_picture(100, 100, z -> z^2))


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