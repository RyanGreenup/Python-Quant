

@time include("./Julia-Set-Dimensions-functions.jl")
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