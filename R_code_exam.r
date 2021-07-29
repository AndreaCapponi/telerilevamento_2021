install.packages("raster")

install.packages("Rcpp")

library(raster)

setwd("C:/lab/mountsainthelens")

mountsainthelenssubfolderlist <- list.files(pattern="MSH")

mountsainthelenssubfolderlist

 [1] "2000_MSH.jpg" "2001_MSH.jpg" "2002_MSH.jpg" "2003_MSH.jpg" "2004_MSH.jpg"
 [6] "2005_MSH.jpg" "2006_MSH.jpg" "2007_MSH.jpg" "2008_MSH.jpg" "2009_MSH.jpg"
[11] "2010_MSH.jpg" "2011_MSH.jpg" "2013_MSH.jpg" "2014_MSH.jpg" "2015_MSH.jpg"
[16] "2016_MSH.jpg" "79_MSH.jpg"   "80_MSH.jpg"   "81_MSH.jpg"   "82_MSH.jpg"  
[21] "83_MSH.jpg"   "84_MSH.jpg"   "85_MSH.jpg"   "86_MSH.jpg"   "87_MSH.jpg"  
[26] "88_MSH.jpg"   "89_MSH.jpg"   "90_MSH.jpg"   "91_MSH.jpg"   "92_MSH.jpg"  
[31] "93_MSH.jpg"   "94_MSH.jpg"   "95_MSH.jpg"   "96_MSH.jpg"   "97_MSH.jpg"  
[36] "98_MSH.jpg"   "99_MSH.jpg"  

mountsainthelensimportedr <- lapply(mountsainthelenssubfolderlist,raster)

mountsainthelensimportedr

[[1]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2000_MSH.jpg 
names      : X2000_MSH 
values     : 0, 255  (min, max)


[[2]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2001_MSH.jpg 
names      : X2001_MSH 
values     : 0, 255  (min, max)


[[3]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2002_MSH.jpg 
names      : X2002_MSH 
values     : 0, 255  (min, max)


[[4]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2003_MSH.jpg 
names      : X2003_MSH 
values     : 0, 255  (min, max)


[[5]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2004_MSH.jpg 
names      : X2004_MSH 
values     : 0, 255  (min, max)


[[6]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2005_MSH.jpg 
names      : X2005_MSH 
values     : 0, 255  (min, max)


[[7]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2006_MSH.jpg 
names      : X2006_MSH 
values     : 0, 255  (min, max)


[[8]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2007_MSH.jpg 
names      : X2007_MSH 
values     : 0, 255  (min, max)


[[9]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2008_MSH.jpg 
names      : X2008_MSH 
values     : 0, 255  (min, max)


[[10]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2009_MSH.jpg 
names      : X2009_MSH 
values     : 0, 255  (min, max)


[[11]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2010_MSH.jpg 
names      : X2010_MSH 
values     : 0, 255  (min, max)


[[12]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2011_MSH.jpg 
names      : X2011_MSH 
values     : 0, 255  (min, max)


[[13]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 4166, 4108, 17113928  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 4108, 0, 4166  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2013_MSH.jpg 
names      : X2013_MSH 
values     : 0, 255  (min, max)


[[14]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 4096, 4096, 16777216  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 4096, 0, 4096  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2014_MSH.jpg 
names      : X2014_MSH 
values     : 0, 255  (min, max)


[[15]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 4096, 4096, 16777216  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 4096, 0, 4096  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2015_MSH.jpg 
names      : X2015_MSH 
values     : 0, 255  (min, max)


[[16]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 4096, 4096, 16777216  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 4096, 0, 4096  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 2016_MSH.jpg 
names      : X2016_MSH 
values     : 0, 255  (min, max)


[[17]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 1300, 1300, 1690000  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 1300, 0, 1300  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 79_MSH.jpg 
names      : X79_MSH 
values     : 0, 255  (min, max)


[[18]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 1300, 1300, 1690000  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 1300, 0, 1300  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 80_MSH.jpg 
names      : X80_MSH 
values     : 0, 255  (min, max)


[[19]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 1300, 1300, 1690000  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 1300, 0, 1300  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 81_MSH.jpg 
names      : X81_MSH 
values     : 0, 255  (min, max)


[[20]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 1300, 1300, 1690000  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 1300, 0, 1300  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 82_MSH.jpg 
names      : X82_MSH 
values     : 0, 255  (min, max)


[[21]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 1300, 1300, 1690000  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 1300, 0, 1300  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 83_MSH.jpg 
names      : X83_MSH 
values     : 0, 255  (min, max)


[[22]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 84_MSH.jpg 
names      : X84_MSH 
values     : 0, 255  (min, max)


[[23]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 85_MSH.jpg 
names      : X85_MSH 
values     : 0, 255  (min, max)


[[24]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 86_MSH.jpg 
names      : X86_MSH 
values     : 0, 255  (min, max)


[[25]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 87_MSH.jpg 
names      : X87_MSH 
values     : 0, 255  (min, max)


[[26]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 88_MSH.jpg 
names      : X88_MSH 
values     : 0, 255  (min, max)


[[27]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 89_MSH.jpg 
names      : X89_MSH 
values     : 0, 255  (min, max)


[[28]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 90_MSH.jpg 
names      : X90_MSH 
values     : 0, 255  (min, max)


[[29]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 91_MSH.jpg 
names      : X91_MSH 
values     : 0, 255  (min, max)


[[30]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 92_MSH.jpg 
names      : X92_MSH 
values     : 0, 255  (min, max)


[[31]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 93_MSH.jpg 
names      : X93_MSH 
values     : 0, 255  (min, max)


[[32]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 94_MSH.jpg 
names      : X94_MSH 
values     : 0, 255  (min, max)


[[33]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 95_MSH.jpg 
names      : X95_MSH 
values     : 0, 255  (min, max)


[[34]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 96_MSH.jpg 
names      : X96_MSH 
values     : 0, 255  (min, max)


[[35]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 97_MSH.jpg 
names      : X97_MSH 
values     : 0, 255  (min, max)


[[36]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 98_MSH.jpg 
names      : X98_MSH 
values     : 0, 255  (min, max)


[[37]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : 99_MSH.jpg 
names      : X99_MSH 
values     : 0, 255  (min, max)

TCSMSH <- stack(mountsainthelensimportedr)

Error in compareRaster(x) : different extent

thirteenmountsainthelens <- raster("2013_MSH.jpg")

firstextent <- extent(0,4096,0,4096)

firstextentthirteenmountsainthelens <- alignExtent(e, thirteenmountsainthelens)

firstextent

class      : Extent 
xmin       : 0 
xmax       : 4096 
ymin       : 0 
ymax       : 4096 

extent(thirteenmountsainthelens)

class      : Extent 
xmin       : 0 
xmax       : 4108 
ymin       : 0 
ymax       : 4166 

firstextentthirteenmountsainthelens

fourteenmountsainthelens <- raster("2014_MSH.jpg")

secondextent <- extent(0,2054,0,2083)

secondextentfourteenmountsainthelens <- alignExtent(secondextent, fourteenmountsainthelens)

secondextentfourteenmountsainthelens

fifteenmountsainthelens <- raster("2015_MSH.jpg")

secondextent <- extent(0,2054,0,2083)

secondextentfifteenmountsainthelens <- alignExtent(secondextent, fifteenmountsainthelens)

secondextentfifteenmountsainthelens

sixteenmountsainthelens <- raster("2016_MSH.jpg")

secondextent <- extent(0,2054,0,2083)

secondextentsixteenmountsainthelens <- alignExtent(secondextent, sixteenmountsainthelens)

secondextentthirteenmountsainthelens <- alignExtent(secondextent, thirteenmountsainthelens)

secondextentthirteenmountsainthelens

seventyninemountsainthelens <- raster("79_MSH.jpg")

secondextentseventyninemountsainthelens <- alignExtent(secondextent, seventyninemountsainthelens)

secondextentseventyninemountsainthelens

eightynmountsainthelens <- raster("80_MSH.jpg")

secondextenteightynmountsainthelens <- alignExtent(secondextent, eightynmountsainthelens)

secondextenteightynmountsainthelens 

eightyonemountsainthelens <- raster("81_MSH.jpg")

secondextenteightyonemountsainthelens <- alignExtent(secondextent, eightyonemountsainthelens)

secondextenteightyonemountsainthelens

eightytwomountsainthelens <- raster("82_MSH.jpg")

secondextenteightytwomountsainthelens <- alignExtent(secondextent, eightytwomountsainthelens)

secondextenteightytwomountsainthelens

eightythreemountsainthelens <- raster("83_MSH.jpg")

secondextenteightythreemountsainthelens <- alignExtent(secondextent, eightythreemountsainthelens)

secondextenteightythreemountsainthelens

mountsainthelensnewsextentlist <- list(secondextentthirteenmountsainthelens, secondextentfourteenmountsainthelens, secondextentfifteenmountsainthelens, secondextentsixteenmountsainthelens, secondextentseventyninemountsainthelens, secondextenteightynmountsainthelens, secondextenteightyonemountsainthelens, secondextenteightytwomountsainthelens, secondextenteightythreemountsainthelens)

mountsainthelensnewextentlist

mountsainthelensbasicextentlist <- list.files(pattern="MSH_")

mountsainthelensbasicextentlist

c(secondextentthirteenmountsainthelens, secondextentfourteenmountsainthelens, secondextentfifteenmountsainthelens, secondextentsixteenmountsainthelens, secondextentseventyninemountsainthelens, secondextenteightynmountsainthelens, secondextenteightyonemountsainthelens, secondextenteightytwomountsainthelens, secondextenteightythreemountsainthelens,mountsainthelensbasicextentlist)

plot(TCSMSH)
