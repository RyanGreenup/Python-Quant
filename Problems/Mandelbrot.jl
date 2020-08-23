# using Plots
# using Makie
# using PyPlot
using Dates

start = Dates.now()

function mandelbrot(z, num)
    count = 1
    # Define z1 as z
    z1 = z
    # Iterate num times
    while count ≤ num
        # check for divergence
        if abs(z1)>2
            return Int(count)
        end
#        print(abs(z1))
        #iterate z
        z1 = z1^2 + z
        count=count+1
    end
        #if z hasn't diverged by the end
    return Int(num)
end
mandelbrot(0.25+0.75im, 99)

width  = 50
height = 50
res = [width, height]

pic_mat = zeros(width, height)
for i in 1:size(pic_mat)[1]
    for j in 1:size(pic_mat)[2]
        x = j/width
        y = i/height
        pic_mat[i,j] = mandelbrot(x+y*im, 99)
    end
end

total = Dates.now() - start


# # Plot and save the Image using 
# using GR
# hm = GR.imshow(pic_mat)
# GR.savefig("/tmp/gr")
# # This doesn't preserve quality...

size(pic_mat)

# Plot the Image using matplotlib (inside vscode)
using PyPlot
pic = PyPlot.imshow(pic_mat,interpolation="none")
# colorbar()
#PyPlot.savefig("/tmp/pyplot.tiff", dpi = 999)
display(gcf())

PyPlot.display_figs()


if false
    using PlotlyJS

    function mandelbrot_plot(matrix)
        trace = heatmap(
            z=matrix
        )
        plot(trace)
    end
    mandelbrot_plot(pic_mat)
end

print("Press any key")
x = readline()
pic_mat

using FITSIO

f = FITS("/tmp/a.fits", "w");
data = reshape(1:100, 5, 20)
data = pic_mat
write(f, pic_mat )  # Write a new image extension with the data


data = Dict("col1"=>[1., 2., 3.], "col2"=>[1, 2, 3]);
write(f, data)  # write a new binary table to a new extension

close(f)