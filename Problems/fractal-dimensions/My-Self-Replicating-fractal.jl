function matJoin(A, B)
    function nrow(X)
        return size(X)[1]
    end
    function ncol(X)
        return size(X)[2]
    end
    emptymat = zeros(Bool, max(size(A)[1], size(B)[1]) ,sum(ncol(A) + ncol(B)) )
    emptymat[1:nrow(A), 1:ncol(A)] = A
    emptymat[1:nrow(B), (ncol(A)+1):ncol(emptymat)] = B
    return emptymat
end

function mywalk(B, n)
    for i in 1:n 
        B = matJoin(B, rotl90(B));
    end
    return B
end
############################################################
#### Render Image ##########################################
#################yellow and purple##########################

using GR
GR.imshow(mywalk([1 1], 5))

############################################################
##### Use Plot for themes ##################################
############################################################

using Plots, clibraries
# Choose a backend, plots let's me choose themes
gr() # set the backend to GR, faster, but, no lines
pyplot() # Set the backend to pyplot
plt = Plots.plot(mywalk([1 1], 6),
                 st=:heatmap, clim=(0,1),
                 color=:coolwarm,
                colorbar_title="", ticks = true, legend = false, yflip = true, fmt = :svg);
# yflip!
Plots.savefig(plt, "./my-self-rep-frac.svg")
;convert ./my-self-rep-frac.svg ./my-self-rep-frac.png
plt

PyPlot.plot(mywalk([1 1], 7), st=:heatmap, clim=(0,1), color=:coolwarm, colorbar_title="");

#------------------------------------------------------------
#-- Dimension -----------------------------------------------
#------------------------------------------------------------
# Each time it iterates the image scales by phi
# and the number of pixels increases by 2
# so log(2)/log(1.618)
# lim(F_n/F_n-1)
# but the overall dimensions of the square increases by a factor of 3
# so 3^D=5 ==> log_3(5) = log(5)/log(3) = D 

mat2 = mywalk(fill(1, 1, 1), 10)
l2   = sum(mat2)
size2 = size(mat2)[1]
mat1 = mywalk(fill(1, 1, 1), 11)
l1   = sum(mat1)
size1 = size(mat1)[1]
log(l2/l1)/log(size2/size1)
log(2)/log(1.618) # what would this dimension be ???

