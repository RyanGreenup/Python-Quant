@time include("./Julia-Set-Dimensions-functions.jl")
#------------------------------------------------------------
#- Resolution Animation--------------------------------------
#------------------------------------------------------------

using Plots
Plots.pyplot()


function makePlot(mat, backend=pyplot())
    backend
    plt = Plots.plot(mat,
                     st=:heatmap,
                     color=:coolwarm,
                    colorbar_title="", ticks = false, legend = false, yflip = true, fmt = :png)
    return plt
end

function save_images(res)
    name = string("/tmp/gifs/j", lpad(res, 5, "0"), ".png")
#    mat = outline(make_picture(res, res,  z -> z^2 - 1/2 + 0.6*im))
    mat = outline(make_picture(res, res,  z -> z^2 + -0.123+0.745*im))
    plt = makePlot(mat)
    Plots.savefig(name)
end

for i in 1:300
    save_images(i)
end



GR.imshow(outline(make_picture(1000, 1000, z -> z^2 - 1/2 + 0.6*im)))
GR.savefig("/home/ryan/Sync/Studies/2020Spring/QuantProject/Current/Python-Quant/Report/Presentation/media/elegant_julia.png")

