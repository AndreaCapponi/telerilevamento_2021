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

mountsainthelensimportedr <- lapply(mountsainthelenssubfolderlist,raster)

mountsainthelensimportedr

[[1]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 84_MSH_.jpg 
names      : X84_MSH_ 
values     : 0, 255  (min, max)


[[2]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 85_MSH_.jpg 
names      : X85_MSH_ 
values     : 0, 255  (min, max)


[[3]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 86_MSH_.jpg 
names      : X86_MSH_ 
values     : 0, 255  (min, max)


[[4]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 87_MSH_.jpg 
names      : X87_MSH_ 
values     : 0, 255  (min, max)


[[5]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 88_MSH_.jpg 
names      : X88_MSH_ 
values     : 0, 255  (min, max)


[[6]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 89_MSH_.jpg 
names      : X89_MSH_ 
values     : 0, 255  (min, max)


[[7]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 90_MSH_.jpg 
names      : X90_MSH_ 
values     : 0, 255  (min, max)


[[8]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 91_MSH_.jpg 
names      : X91_MSH_ 
values     : 0, 255  (min, max)


[[9]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 92_MSH_.jpg 
names      : X92_MSH_ 
values     : 0, 255  (min, max)


[[10]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 93_MSH_.jpg 
names      : X93_MSH_ 
values     : 0, 255  (min, max)


[[11]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 94_MSH_.jpg 
names      : X94_MSH_ 
values     : 0, 255  (min, max)


[[12]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 95_MSH_.jpg 
names      : X95_MSH_ 
values     : 0, 255  (min, max)


[[13]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 96_MSH_.jpg 
names      : X96_MSH_ 
values     : 0, 255  (min, max)


[[14]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 97_MSH_.jpg 
names      : X97_MSH_ 
values     : 0, 255  (min, max)


[[15]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 98_MSH_.jpg 
names      : X98_MSH_ 
values     : 0, 255  (min, max)


[[16]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 99_MSH_.jpg 
names      : X99_MSH_ 
values     : 0, 255  (min, max)

TCSMSH <- stack(mountsainthelensimportedr)

plot(TCSMSH)














