############################################################
### Julia / MandelBrot Functions ###########################
############################################################

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

############################################################
##### Build a Matrix Image #################################
############################################################

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

############################################################
### Make the Outline ########################################
############################################################
# TODO this should be inside a function

test_mat = make_picture(800,800, z -> z^2 + 0.37-0.2*im)
for row in 2:(size(test_mat)[1]-1)
    for col in 2:(size(test_mat)[2]-1)
        ## Make instand divergence zero
        if abs(test_mat[row, col]) <= 100  # Although 100 is arbitrary, anything less hides the shape
            test_mat[row, col] = 0            # TODO make this a var, convergence_threshold
        end
        ## Make everything else 1
        if abs(test_mat[row, col]) >= 100
            test_mat[row, col] = 1
        end
#        print(test_mat[row,col], ", ")
    end
end
work_mat = copy(test_mat)
for row in 2:(size(test_mat)[1]-1)
    for col in 2:(size(test_mat)[2]-1)
        ## Make the inside 0, we only want the outline
        neighbourhood = test_mat[row-1:row+1,col-1:col+1]
        if sum(neighbourhood) >= 9 # 9 squares
            work_mat[row,col] = 0
        end
    end
end
GR.imshow(work_mat) # PyPlot uses interpolation = "None"
# GR.savefig("/home/ryan/Dropbox/Studies/2020Spring/QuantProject/Current/Python-Quant/Problems/fractal-dimensions/media/outline-Julia-set.png")

## Return the perimeter
sum(test_mat)

# halving from 600 to 300 pixels gives a change of about X 3.78, so the dimension would be about 1.9.
# 
# i.e. 2^1.9 = 3.8.


## Other Fractals to look at for this maybe?
  # GR.imshow(test_mat) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.37-0.2*im)) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.38-0.2*im)) # PyPlot uses interpolation = "None"
  # GR.imshow(make_picture(500, 500, z -> z^2 + 0.39-0.2*im)) # PyPlot uses interpolation = "None"
