install.packages("raster")

install.packages("Rcpp")

install.packages("RStoolbox")

install.packages("rasterVis")

install.packages("RColorBrewer")

library(raster)

library(RStoolbox)

library(rasterVis)

library(RColorBrewer)

setwd("C:/lab/mountsainthelens")

mountsainthelenssubfolderlist <- list.files(pattern="MSHanalysis_")

mountsainthelenssubfolderlist

[1] "MSHanalysis_87.jpg" "MSHanalysis_90.jpg" "MSHanalysis_93.jpg"
[4] "MSHanalysis_96.jpg"

mountsainthelensimportedr <- lapply(mountsainthelenssubfolderlist,raster)

mountsainthelensimportedr

[[1]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87 
values     : 0, 255  (min, max)


[[2]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_90.jpg 
names      : MSHanalysis_90 
values     : 0, 255  (min, max)


[[3]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_93.jpg 
names      : MSHanalysis_93 
values     : 0, 255  (min, max)


[[4]]
class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96 
values     : 0, 255  (min, max)

TCSMSH <- stack(mountsainthelensimportedr)

plot(TCSMSH)

levelplot(TCSMSH)

levelplot(TCSMSH$MSHanalysis_87)

levelplot(TCSMSH$MSHanalysis_90)

levelplot(TCSMSH$MSHanalysis_93)

levelplot(TCSMSH$MSHanalysis_96)

levelplot(TCSMSH, col.regions=gray(0:100/100))

display.brewer.all()

MSHcolorspalette <- brewer.pal(9, "YlOrBr")

pal <- colorRampPalette(MSHcolorspalette)

levelplot(TCSMSH,col.regions=pal)

levelplot(TCSMSH,col.regions=pal, names.attr=c("1987","1990", "1993","1996"))

levelplot(TCSMSH,col.regions=pal, main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1987","1990", "1993","1996"))

dev.off()

disruptedvegetation <- brick("MSHanalysis_87.jpg")

newlyvegetation <- brick("MSHanalysis_96.jpg")

par(mfrow=c(1,2))

plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="his")

par(mfrow=c(1,2))

plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="his")

disruptedvegetationvi <- spectralIndices(disruptedvegetation, green=3, red=2, nir=1)

plot(disruptedvegetationvi, col=MSHcp)

newlyvegetationvi <- spectralIndices(newlyvegetation, green=3, red=2, nir=1)

plot(newlyvegetationvi, col=MSHcp)

disruptedvegetation

class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87.1, MSHanalysis_87.2, MSHanalysis_87.3 
min values :                0,                0,                0 
max values :              255,              255,              255

disruptedvegetation$MSHanalysis_87.1

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87.1 
values     : 0, 255  (min, max)

disruptedvegetation$MSHanalysis_87.2

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87.2 
values     : 0, 255  (min, max)

plot(disruptedvegetation$MSHanalysis_87.1)

plot(disruptedvegetation$MSHanalysis_87.2)

disruptedvegetationdvi <- disruptedvegetation$MSHanalysis_87.1 - disruptedvegetation$MSHanalysis_87.2

plot(disruptedvegetationdvi)

MSHcp <- colorRampPalette(c('white','green','brown','black'))(100)

plot(disruptedvegetationdvi, col=MSHcp)

plot(disruptedvegetationdvi, col=MSHcp, main="DVI of disrupted vegetation in 1987")

newlyvegetation

class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96.1, MSHanalysis_96.2, MSHanalysis_96.3 
min values :                0,                0,                0 
max values :              255,              255,              255 


newlyvegetation$MSHanalysis_96.1

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96.1 
values     : 0, 255  (min, max)

newlyvegetation$MSHanalysis_96.2

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96.2 
values     : 0, 255  (min, max)

plot(newlyvegetation$MSHanalysis_96.1)

plot(newlyvegetation$MSHanalysis_96.2)

newlyvegetationdvi <- newlyvegetation$MSHanalysis_96.1 - newlyvegetation$MSHanalysis_96.2

plot(newlyvegetationdvi)

MSHcp <- colorRampPalette(c('white','green','brown','black'))(100)

plot(newlyvegetationdvi, col=cl, main="DVI of newly vegetation in 1996")

par(mfcol=c(1,2))

plot(disruptedvegetationdvi, col=MSHcp, main="DVI of disrupted vegetation in 1987")

plot(newlyvegetationdvi, col=cl, main="DVI of newly vegetation in 1996")

multitemporaldvi <- disruptedvegetationdvi - newlyvegetationdvi

class      : RasterLayer 
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      : layer 
values     : -108, 80  (min, max)

MSHcp <- colorRampPalette(c('white','green','brown','black'))(100)

plot(multitemporaldvi, col=MSHcp)

disruptedvegetationndvi <- (disruptedvegetationdvi) / (disruptedvegetation$MSHanalysis_87.1 + disruptedvegetation$MSHanalysis_87.2)

plot(disruptedvegetationndvi, col=MSHcp)

newlyvegetationndvi <- (newlyvegetationdvi) / (newlyvegetation$MSHanalysis_96.1 + newlyvegetation$MSHanalysis_96.2)

plot(newlyvegetationndvi, col=MSHcp)

par(mfcol=c(1,2))

plot(disruptedvegetationndvi, col=MSHcp, main="NDVI of disrupted vegetation in 1987")

plot(newlyvegetationndvi, col=MSHcp, main="NDVI of newly vegetation in 1996")

multitemporalndvi <- disruptedvegetationndvi - newlyvegetationndvi

plot(multitemporalndvi, col=MSHcp)





