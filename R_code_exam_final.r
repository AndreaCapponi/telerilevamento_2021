install.packages("raster")

install.packages("Rcpp")

install.packages("RStoolbox")

install.packages("rasterVis")

install.packages("RColorBrewer")

install.packages("viridis")

install.packages("ggplot2")

install.packages("gridExtra")

library(raster)

library(RStoolbox)

library(rasterVis)

library(RColorBrewer)

library(viridis)

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

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100) <--- Quale per gli indici VI?

plot(disruptedvegetationvi, col=MSHDVIcolorspalette)

newlyvegetationvi <- spectralIndices(newlyvegetation, green=3, red=2, nir=1)

plot(newlyvegetationvi)

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100) <--- Quale per gli indici VI?

plot(newlyvegetationvi, col=MSHDVIcolorspalette)

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

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette)

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI of disrupted vegetation in 1987")

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

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

plot(newlyvegetationdvi, col=MSHDVIcolorspalette , main="DVI of newly vegetation in 1996")

par(mfcol=c(1,2))

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI of disrupted vegetation in 1987")

plot(newlyvegetationdvi, col=MSHDVIcolorspalette, main="DVI of newly vegetation in 1996")

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

plot(multitemporaldvi, col=MSHDVIcolorspalette) 

plot(multitemporaldvi, col=MSHDVIcolorspalette, main="DVI of Mount Saint Helens' vegetation from 1987 to 1996")

disruptedvegetationndvi <- (disruptedvegetationdvi) / (disruptedvegetation$MSHanalysis_87.1 + disruptedvegetation$MSHanalysis_87.2)

MSHNDVIcolorspalette <- colorRampPalette(c("darkorchid2","whitesmoke","turquoise1","springgreen4","wheat1","gold"))(100) 

plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette)

newlyvegetationndvi <- (newlyvegetationdvi) / (newlyvegetation$MSHanalysis_96.1 + newlyvegetation$MSHanalysis_96.2)

MSHNDVIanothercolorspalette <- colorRampPalette(c("darkorchid2","steelblue1","royalblue1","turquoise1","springgreen4","whitesmoke","wheat1","gold","indianred3","black"))(100)  

plot(newlyvegetationndvi, col=MSHNDVIanothercolorspalette)

par(mfcol=c(1,2))

plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette, main="NDVI of disrupted vegetation in 1987")

plot(newlyvegetationndvi, col=MSHNDVIanothercolorspalette, main="NDVI of newly vegetation in 1996")

multitemporalndvi <- disruptedvegetationndvi - newlyvegetationndvi

plot(multitemporalndvi, col=MSHNDVIcolorspalette)

plot(multitemporalndvi, col=MSHNDVIcolorspalette, main="NDVI of Mount Saint Helens' vegetation from 1987 to 1996")

ggRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

ggRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

DVe <- ggRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

NVe <- ggRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

grid.arrange(DVe, NVe, nrow=2)

dev.off()

set.seed(1)

rnorm(1)

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

set.seed(1)

rnorm(1)

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
[1,]     1  510198
[2,]     2 1030579
[3,]     3 2737705

freq(NVc$map)

     value   count
[1,]     1  395390
[2,]     2  872402
[3,]     3 3010690

sDV <- 510198 + 1030579 + 2737705

sDV
[1] 4278482

sNV <- 395390 + 872402 + 3010690

sNV
[1] 4278482

pDV <- freq(DVc$map)/sDV

pDV

       value     count
[1,] 2.337278e-07 0.1192474
[2,] 4.674555e-07 0.2408749
[3,] 7.011833e-07 0.6398776

pNV <-freq(NVc$map)/sNV

pNV

            value      count
[1,] 2.337278e-07 0.09241362
[2,] 4.674555e-07 0.20390456
[3,] 7.011833e-07 0.70368182

MSHcover <- c("Forest", "Agricolture/Thinning vegetation", "Bare soil")

coverpercentagein1987 <- c(63.98776, 24.08749, 11.92474)

coverpercentagein1996 <- c(70.368182, 20.390456, 9.241362)

increasedpercentages <- data.frame(MSHcover, coverpercentagein1987, coverpercentagein1996)

increasedpercentages

 MSHcover coverpercentagein1987 coverpercentagein1996
1                          Forest              63.98776             70.368182
2 Agricolture/Thinning vegetation              24.08749             20.390456
3                       Bare soil              11.92474              9.241362

idealgraphicsuccession <- c("Bare soil", "Agricolture/Thinning vegetation", "Forest")

ggplot(increasedpercentages, aes(x=MSHcover, y=coverpercentagein1987, fill=MSHcover)) + ggtitle("Cover percentage on the volcanic slopes of Mount Saint Helens in 1987") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "burlywood3", "darkolivegreen4"))                    
                     
ggplot(increasedpercentages, aes(x=MSHcover, y=coverpercentagein1996, fill=MSHcover)) + ggtitle("Cover percentage on the volcanic slopes of Mount Saint Helens in 1996") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "burlywood3", "darkolivegreen4"))                  
                     
pDV <- ggplot(increasedpercentages, aes(x=MSHcover, y=coverpercentagein1987, fill=MSHcover)) + ggtitle("Cover percentage on the volcanic slopes of Mount Saint Helens in 1987") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "burlywood3", "darkolivegreen4"))

pNV <- ggplot(increasedpercentages, aes(x=MSHcover, y=coverpercentagein1996, fill=MSHcover)) + ggtitle("Cover percentage on the volcanic slopes of Mount Saint Helens in 1996") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "burlywood3", "darkolivegreen4"))

grid.arrange(pDV, pNV, nrow=1)

disruptedvegetationdvimean <- focal(disruptedvegetationdvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(disruptedvegetationdvimean)

MSHMEANcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(disruptedvegetationdvimean, col=MSHMEANcolorspalette)

newlyvegetationdvimean <- focal(newlyvegetationdvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(newlyvegetationdvimean)

MSHMEANcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(newlyvegetationdvimean, col=MSHMEANcolorspalette)

par(mfcol=c(1,2))

plot(disruptedvegetationdvimean, col=MSHMEANcolorspalette, main="Mean-dependent variability for DVI of disrupted vegetation in 1987")

plot(newlyvegetationdvimean, col=MSHMEANcolorspalette, main="Mean-dependent variability for DVI of newly vegetation in 1996")

disruptedvegetationdvistandarddeviation <- focal(disruptedvegetationdvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(disruptedvegetationdvistandarddeviation)

MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(disruptedvegetationdvistandarddeviation, col=MSHSDcolorspalette)

newlyvegetationdvistandarddeviation <- focal(newlyvegetationdvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(newlyvegetationdvistandarddeviation)

MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(newlyvegetationdvistandarddeviation, col=MSHSDcolorspalette)

par(mfcol=c(1,2))

plot(disruptedvegetationdvistandarddeviation, col=MSHMEANcolorspalette, main="σ-dependent variability for DVI of disrupted vegetation in 1987")

plot(newlyvegetationdvistandarddeviation, col=MSHMEANcolorspalette, main="σ-dependent variability for DVI of newly vegetation in 1996")

disruptedvegetationndvimean <- focal(disruptedvegetationndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(disruptedvegetationndvimean)

MSHMEANcolorspalette <- colorRampPalette(c("blue","green","pink","magenta","orange","white","red","yellow"))(100)

plot(disruptedvegetationndvimean, col=MSHMEANcolorspalette)

newlyvegetationndvimean <- focal(newlyvegetationndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(newlyvegetationndvimean)

MSHMEANcolorspalette <- colorRampPalette(c("blue","green","pink","magenta","orange","brown","red","yellow"))(100)

plot(newlyvegetationndvimean, col=MSHMEANcolorspalette)

par(mfcol=c(1,2))

plot(disruptedvegetationndvimean, col=MSHMEANcolorspalette, main="Mean-dependent variability for NDVI of disrupted vegetation in 1987")

plot(newlyvegetationndvimean, col=MSHMEANcolorspalette, main="Mean-dependent variability for NDVI of newly vegetation in 1996")

disruptedvegetationndvistandarddeviation <- focal(disruptedvegetationndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(disruptedvegetationndvistandarddeviation)

MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(disruptedvegetationndvistandarddeviation, col=MSHSDcolorspalette)

newlyvegetationndvistandarddeviation <- focal(newlyvegetationndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(newlyvegetationndvistandarddeviation)

MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot((newlyvegetationndvistandarddeviation, col=MSHSDcolorspalette)

par(mfcol=c(1,2))

plot(disruptedvegetationndvimean, col=MSHMEANcolorspalette, main="σ-dependent variability for NDVI of disrupted vegetation in 1987")

plot(newlyvegetationndvimean, col=MSHMEANcolorspalette, main="σ-dependent variability for NDVI of newly vegetation in 1996")

disruptedvegetationpca <- rasterPCA(disruptedvegetation)

plot(disruptedvegetationpca$map)

summary(disruptedvegetationpca$map)
              
             PC1         PC2          PC3
Min.    -131.81642 -44.7241898 -22.28081322
1st Qu.  -51.34004  -4.7453718  -2.87545085
Median   -27.23346  -0.2292121   0.03662925
3rd Qu.   37.23258   5.2761769   2.79791188
Max.     275.80930  39.9837418  23.16283417
NA's       0.00000   0.0000000   0.00000000
     
PC1 <- disruptedvegetationpca$map$PC1
     
disruptedvegetationPC1 <- focal(PC1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
     
MSHMEANcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
     
plot(disruptedvegetationPC1, col=MSHMEANcolorspalette) 

PC1DV1e <- ggplot() +
geom_raster(disruptedvegetationPC1, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("σ of PC1 by viridis colour scale")
     
PC1DV2e <- ggplot() +
geom_raster(disruptedvegetationPC1, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="inferno")+ggtitle("σ of PC1 by magma colour scale")
     
PC1DV3e <- ggplot() +
geom_raster(disruptedvegetationPC1, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="plasma")+ggtitle("σ of PC1 by turbo colour scale")

grid.arrange(PC1DV1e, PC1DV2e, PC1DV3e, nrow=1)

newlyvegetationpca <- rasterPCA(newlyvegetation)

plot(newlyvegetationpca$map)

summary(newlyvegetationpca$map)
     
              [,1]        [,2]       [,3]
Min.    -130.46102 -56.6665605 -37.573796
1st Qu.  -39.47683  -5.2922778  -3.294960
Median   -19.46805   0.1555407  -0.274434
3rd Qu.   18.55625   5.4918368   2.960569
Max.     291.87846  72.5329310  69.524313
NA's       0.00000   0.0000000   0.000000
     
PC1 <- newlyvegetationpca$map$PC1
     
newlyvegetationPC1 <- focal(PC1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
     
MSHMEANcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
     
plot(newlyvegetationPC1, col=MSHMEANcolorspalette) 

PC1NV1e <- ggplot() +
geom_raster(disruptedvegetationPC1, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("σ of PC1 by viridis colour scale")
     
PC1NV2e <- ggplot() +
geom_raster(disruptedvegetationPC1, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="inferno")+ggtitle("σ of PC1 by magma colour scale")
     
PC1NV3e <- ggplot() +
geom_raster(disruptedvegetationPC1, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="plasma")+ggtitle("σ of PC1 by turbo colour scale")

grid.arrange(PC1NV1e, PC1NV2e, PC1NV3e, nrow=1)
