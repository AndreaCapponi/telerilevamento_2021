install.packages("raster")

install.packages("Rcpp")

library(raster)

setwd("C:/lab/mountsainthelens")

mountsainthelenssubfolderlist <- list.files(pattern="MSH_")

mountsainthelenssubfolderlist

[1] "84_MSH_.jpg" "85_MSH_.jpg" "86_MSH_.jpg" "87_MSH_.jpg" "88_MSH_.jpg"
 [6] "89_MSH_.jpg" "90_MSH_.jpg" "91_MSH_.jpg" "92_MSH_.jpg" "93_MSH_.jpg"
[11] "94_MSH_.jpg" "95_MSH_.jpg" "96_MSH_.jpg" "97_MSH_.jpg" "98_MSH_.jpg"
[16] "99_MSH_.jpg"

mountsainthelensimportedr <- lapply(mountsainthelenssubfolderlist,brick)

mountsainthelensimportedr

[[1]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 84_MSH_.jpg 
names      : X84_MSH_.1, X84_MSH_.2, X84_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[2]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 85_MSH_.jpg 
names      : X85_MSH_.1, X85_MSH_.2, X85_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[3]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 86_MSH_.jpg 
names      : X86_MSH_.1, X86_MSH_.2, X86_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[4]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 87_MSH_.jpg 
names      : X87_MSH_.1, X87_MSH_.2, X87_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[5]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 88_MSH_.jpg 
names      : X88_MSH_.1, X88_MSH_.2, X88_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[6]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 89_MSH_.jpg 
names      : X89_MSH_.1, X89_MSH_.2, X89_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[7]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 90_MSH_.jpg 
names      : X90_MSH_.1, X90_MSH_.2, X90_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[8]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 91_MSH_.jpg 
names      : X91_MSH_.1, X91_MSH_.2, X91_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[9]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 92_MSH_.jpg 
names      : X92_MSH_.1, X92_MSH_.2, X92_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[10]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 93_MSH_.jpg 
names      : X93_MSH_.1, X93_MSH_.2, X93_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[11]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 94_MSH_.jpg 
names      : X94_MSH_.1, X94_MSH_.2, X94_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[12]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 95_MSH_.jpg 
names      : X95_MSH_.1, X95_MSH_.2, X95_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[13]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 96_MSH_.jpg 
names      : X96_MSH_.1, X96_MSH_.2, X96_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[14]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 97_MSH_.jpg 
names      : X97_MSH_.1, X97_MSH_.2, X97_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[15]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 98_MSH_.jpg 
names      : X98_MSH_.1, X98_MSH_.2, X98_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255 


[[16]]
class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 99_MSH_.jpg 
names      : X99_MSH_.1, X99_MSH_.2, X99_MSH_.3 
min values :          0,          0,          0 
max values :        255,        255,        255

TCSMSH <- stack(mountsainthelensimportedr)

plot(TCSMSH)

library(rasterVis)

levelplot(TCSMSH)

blbprcp <- colorRampPalette(c("blue","light blue","pink","red"))(100)

levelplot(TCSMSH, col.regions=blbprcp)

levelplot(TCSMSH,col.regions=blbprcp, names.attr=c("1984","1985", "1986", "1987","1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999"))

levelplot(TCSMSH,col.regions=blbprcp, main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1984","1985", "1986", "1987","1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999"))

levelplot(TCSMSH$84_MSH_)

levelplot(TCSMSH$99_MSH_)




