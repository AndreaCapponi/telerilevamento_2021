install.packages("raster")

install.packages("Rcpp")

install.packages("RStoolbox")

install.packages("rasterVis")

install.packages("RColorBrewer")

install.packages("ggplot2")

install.packages("gridExtra")

library(raster)

library(RStoolbox)

library(rasterVis)

library(RColorBrewer)

library(ggplot2)

library(gridExtra)

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

levelplot(TCSMSH,col.regions=gray(0:100/100), names.attr=c("1987","1990", "1993","1996"))

levelplot(TCSMSH,col.regions=gray(0:100/100), main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1987","1990", "1993","1996"))

display.brewer.all()

MSHYlOrBrcolorspalette <- brewer.pal(9, "YlOrBr")

pal <- colorRampPalette(MSHYlOrBrcolorspalette)

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

plot(disruptedvegetationvi)

plot(disruptedvegetationvi, col=MSHcp)

newlyvegetationvi <- spectralIndices(newlyvegetation, green=3, red=2, nir=1)

plot(newlyvegetationvi)

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

dev.off()

disruptedvegetationdvi <- disruptedvegetation$MSHanalysis_87.1 - disruptedvegetation$MSHanalysis_87.2

plot(disruptedvegetationdvi)

MSHdcfcsbbcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

plot(disruptedvegetationdvi, col=MSHdcfcsbbcolorspalette)

plot(disruptedvegetationdvi, col=MSHdcfcsbbcolorspalette, main="DVI of disrupted vegetation in 1987")

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

MSHdcfcsbbcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

plot(newlyvegetationdvi, col=MSHdcfcsbbcolorspalette , main="DVI of newly vegetation in 1996")

par(mfcol=c(1,2))

plot(disruptedvegetationdvi, col=MSHdcfcsbbcolorspalette, main="DVI of disrupted vegetation in 1987")

plot(newlyvegetationdvi, col=MSHdcfcsbbcolorspalette, main="DVI of newly vegetation in 1996")

multitemporaldvi <- disruptedvegetationdvi - newlyvegetationdvi

multitemporaldvi

class      : RasterLayer 
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      : layer 
values     : -108, 80  (min, max)

plot(multitemporaldvi, col=MSHdcfcsbbcolorspalette)

disruptedvegetationndvi <- (disruptedvegetationdvi) / (disruptedvegetation$MSHanalysis_87.1 + disruptedvegetation$MSHanalysis_87.2)

MSH?colorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

plot(disruptedvegetationndvi, col=MSHdcfcsbbcolorspalette)

newlyvegetationndvi <- (newlyvegetationdvi) / (newlyvegetation$MSHanalysis_96.1 + newlyvegetation$MSHanalysis_96.2)

plot(newlyvegetationndvi, col=MSHdcfcsbbcolorspalette)

par(mfcol=c(1,2))

plot(disruptedvegetationndvi, col=MSHdcfcsbbcolorspalette, main="NDVI of disrupted vegetation in 1987")

plot(newlyvegetationndvi, col=MSHdcfcsbbcolorspalette, main="NDVI of newly vegetation in 1996")

multitemporalndvi <- disruptedvegetationndvi - newlyvegetationndvi

plot(multitemporalndvi, col=MSHdcfcsbbcolorspalette)

ggRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

ggRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

DVe <- ggRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

NVe <- ggRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

grid.arrange(DVe, NVe, nrow=2)

dev.off()

DVc <- unsuperClass(disruptedvegetation, nClass=3)

DVc

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : r_tmp_2021-07-31_171720_15220_28543.grd 
names      : layer 
values     : 1, 3  (min, max)

plot(DVc$map)

NVc <- unsuperClass(newlyvegetation, nClass=3)

NVc

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : r_tmp_2021-07-31_171833_15220_95861.grd 
names      : layer 
values     : 1, 3  (min, max)

plot(NVc$map)

par(mfrow=c(1,2))

plot(DVc$map)

plot(NVc$map)

freq(DVc$map)

value   count
[1,]     1 2749366
[2,]     2 1039672
[3,]     3  489444

freq(NVc$map)

value   count
[1,]     1  373380
[2,]     2 3052520
[3,]     3  852582

sDV <- 2749366 + 1039672 + 489444

sDV
[1] 4278482

sNV <- 373380 + 3052520 + 852582

sNV
[1] 4278482

pDV <- freq(DVc$map)/sDV

pDV

value     count
[1,] 2.337278e-07 0.6426031
[2,] 4.674555e-07 0.2430002
[3,] 7.011833e-07 0.1143966

pNV <-freq(NVc$map)/sNV

pNV

value      count
[1,] 2.337278e-07 0.08726927
[2,] 4.674555e-07 0.71345865
[3,] 7.011833e-07 0.19927208

MSHcover <- c("Forest", "Agricolture/Thinning vegetation", "Bare soil")

coverpercentagein1987 <- c(64.26031, 24.30002, 11.43966)

coverpercentagein1996 <- c(71.345865, 19.927208, 8.726927)

increasedpercentages <- data.frame(cover, coverpercentagein1987, coverpercentagein1996)

increasedpercentages

 cover coverpercentagein1987 coverpercentagein1996
1                          Forest              64.26031             71.345865
2 Agricolture/Thinning vegetation              24.30002             19.927208
3                       Bare soil              11.43966              8.726927

ggplot(increasedpercentages, aes(x=MSHcover, y=coverpercentagein1987, color=MSHcover)) + geom_bar(stat="identity", fill="pink")

Error in ggplot(increasedpercentages, aes(x = MSHcover, y = coverpercentagein1987,  : 
  non trovo la funzione "ggplot"                                       

ggplot(increasedpercentages, aes(x=MSHcover, y=coverpercentagein1996, color=MSHcover)) + geom_bar(stat="identity", fill="pink")

pDV <- ggplot(losspercentages, aes(x=MSHcover, y=coverpercentagein1987, color=MSHcover)) + geom_bar(stat="identity", fill="pink")

pNV <- ggplot(losspercentages, aes(x=MSHcover, y=coverpercentagein1996, color=MSHcover)) + geom_bar(stat="identity", fill="pink")

grid.arrange(pDV, pNV, nrow=1)

















