using FITSIO
f = FITS("./media/AusThreshold.fit", "r")
# Read the data
data = read(f[1])
typeof(data)
float(data[124, 328, 2])
float(sum(data))