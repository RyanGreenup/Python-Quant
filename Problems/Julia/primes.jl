    using Plots
    n=100; xr= 10*rand(n); yr= 10*rand(n); zr= Float64[ sin(xr[i])+cos(yr[i]) for i=1:n];
    surface( xr, yr, zr, size=[800,480] )
    savefig( "surfaceiplot.png" )

