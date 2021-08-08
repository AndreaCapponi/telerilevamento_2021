install.packages("raster")

install.packages("Rcpp")

library(raster)

setwd("C:/lab/mountsainthelens")

seventyninemountsainthelens <- raster("79_MSH.jpg")

eightymountsainthelens <- raster("80_MSH.jpg")

par(mfrow=c(1,2))

plot(seventyninemountsainthelens)

plot(eightymountsainthelens)

seventyninemountsainthelens <- brick("79_MSH.jpg")

eightymountsainthelens <- brick("80_MSH.jpg")

par(mfrow=c(3,3))

plot(seventyninemountsainthelens)

plot(eightymountsainthelens)

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

#Se io considero le immagini satellittari dal 1984 al 1999, è possibile effettuare il plot:

plot(TCSMSH)

install.packages("rasterVis")

library(rasterVis)

levelplot(TCSMSH)

# ↓ Questo è in dubbio perché quale significato ha dipendentemente dalle bande che costituiscono le immagini satellitari? 

vegetation_amount <- TCSMSH$X99_MSH_ - TCSMSH$X84_MSH_ 

plot(vegetation_amount)

levelplot(vegetation_amount)

disruptedvegetation <- brick("80_MSH.jpg")

newlyvegetation <- brick("2015_MSH.jpg")

par(mfrow=c(2,1))

plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

disruptedvegetation

disruptedvegetation$X80_MSH.1

disruptedvegetation$X80_MSH.2

plot(disruptedvegetation$X80_MSH.1)

plot(disruptedvegetation$X80_MSH.2)

firstdvi <- disruptedvegetation$X80_MSH.1 - disruptedvegetation$X80_MSH.2

plot(firstdvi)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(firstdvi, col=cl)

plot(firstdvi, col=cl, main="DVI in 1980")

newlyvegetation

newlyvegetation$X2015_MSH.1

newlyvegetation$X2015_MSH.2

plot(newlyvegetation$X2015_MSH.1)

plot(newlyvegetation$X2015_MSH.2)

seconddvi <- newlyvegetation$X2015_MSH.1 - newlyvegetation$X2015_MSH.2

plot(seconddvi)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(seconddvi, col=cl, main="DVI in 2016")

par(mfcol=c(1,2)) / par(mfrow=c(2,1))

plot(firstdvi, col=cl, main="DVI in 1980")

plot(seconddvi, col=cl, main="DVI in 2016")

difdvi <- firstdvi - seconddvi


#Per i grafici in italiano:

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
	
	mountsainthelensimportedr <- lapply(mountsainthelenssubfolderlist,raster)
	
	mountsainthelensimportedr
	
	TCSMSH <- stack(mountsainthelensimportedr)
	
first <- brick("MSHanalysis_87.jpg")

second <- brick("MSHanalysis_90.jpg")

third <- brick("MSHanalysis_93.jpg")

fourth <- brick("MSHanalysis_96.jpg")

par(mfrow=c(2,2))

plotRGB(first)

plotRGB(second)

plotRGB(third)

plotRGB(fourth)
	     
	levelplot(TCSMSH)     
	
	levelplot(TCSMSH$MSHanalysis_87)
	
	levelplot(TCSMSH$MSHanalysis_90)
	
	levelplot(TCSMSH$MSHanalysis_93)
	
	levelplot(TCSMSH$MSHanalysis_96)
	
	levelplot(TCSMSH, names.attr=c("1987","1990", "1993","1996"))
	
	levelplot(TCSMSH, main=" Variazione della copertura vegetale sulla frana vulcanica del Monte Saint Helens nel tempo", names.attr=c("1987","1990", "1993","1996"))
	
	levelplot(TCSMSH, col.regions=gray(0:100/100))
	
	levelplot(TCSMSH,col.regions=gray(0:100/100), names.attr=c("1987","1990", "1993","1996"))
	
	levelplot(TCSMSH,col.regions=gray(0:100/100), main=" Variazione della copertura vegetale sulla frana vulcanica del Monte Saint Helens nel tempo", names.attr=c("1987","1990", "1993","1996"))
	
	display.brewer.all()
	
	MSHYlOrBrcolorspalette <- brewer.pal(9, "YlOrBr")
	
	pal <- colorRampPalette(MSHYlOrBrcolorspalette)
	
	levelplot(TCSMSH,col.regions=pal)
	
	levelplot(TCSMSH,col.regions=pal, names.attr=c("1987","1990", "1993","1996"))
	
	levelplot(TCSMSH,col.regions=pal, main=" Variazione della copertura vegetale sulla frana vulcanica del Monte Saint Helens nel tempo", names.attr=c("1987","1990", "1993","1996"))
	
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
	
	MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)
	
	plot(disruptedvegetationvi, col=MSHDVIcolorspalette)
	
	newlyvegetationvi <- spectralIndices(newlyvegetation, green=3, red=2, nir=1)
	
	plot(newlyvegetationvi)
	
	MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100) 
	
	plot(newlyvegetationvi, col=MSHDVIcolorspalette)
	
	disruptedvegetation
	
	disruptedvegetation$MSHanalysis_87.1
	
	disruptedvegetation$MSHanalysis_87.2
	
	plot(disruptedvegetation$MSHanalysis_87.1)
	
	plot(disruptedvegetation$MSHanalysis_87.2)
	
	dev.off()
	
	disruptedvegetationdvi <- disruptedvegetation$MSHanalysis_87.1 - disruptedvegetation$MSHanalysis_87.2
	
	plot(disruptedvegetationdvi)
	
	MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)
	
	plot(disruptedvegetationdvi, col=MSHDVIcolorspalette)
	
	plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI della vegetazione disturbata nel 1987")
	
	newlyvegetation
	
	newlyvegetation$MSHanalysis_96.1
	
	newlyvegetation$MSHanalysis_96.2
	
	plot(newlyvegetation$MSHanalysis_96.1)
	
	plot(newlyvegetation$MSHanalysis_96.2)
	
	newlyvegetationdvi <- newlyvegetation$MSHanalysis_96.1 - newlyvegetation$MSHanalysis_96.2
	
	plot(newlyvegetationdvi)
	
	MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)
	
	plot(newlyvegetationdvi, col=MSHDVIcolorspalette , main="DVI della nuova vegetazione nel 1996")
	
	par(mfcol=c(1,2))
	
	plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI della vegetazione disturbata nel 1987")
	
	plot(newlyvegetationdvi, col=MSHDVIcolorspalette, main="DVI della nuova vegetazione nel 1996")
	
	multitemporaldvi <- disruptedvegetationdvi - newlyvegetationdvi
	
	multitemporaldvi
	     
	plot(multitemporaldvi)
	     
	plot(multitemporaldvi, col=MSHDVIcolorspalette) 
	
	plot(multitemporaldvi, col=MSHDVIcolorspalette, main="DVI della vegetazione sul Monte Saint Helens dal 1987 to 1996")
	
	disruptedvegetationndvi <- (disruptedvegetationdvi) / (disruptedvegetation$MSHanalysis_87.1 + disruptedvegetation$MSHanalysis_87.2)
	
	MSHNDVIcolorspalette <- colorRampPalette(c("darkorchid2","whitesmoke","turquoise1","springgreen4","wheat1","gold"))(100) 
	
	plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette)
	
	newlyvegetationndvi <- (newlyvegetationdvi) / (newlyvegetation$MSHanalysis_96.1 + newlyvegetation$MSHanalysis_96.2)
	
	MSHNDVIanothercolorspalette <- colorRampPalette(c("darkorchid2","steelblue1","royalblue1","turquoise1","springgreen4","whitesmoke","wheat1","gold","indianred3","black"))(100)  
	
	plot(newlyvegetationndvi, col=MSHNDVIanothercolorspalette)
	
	par(mfcol=c(1,2))
	
	plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette, main="NDVI della vegetazione disturbata nel 1987")
	
	plot(newlyvegetationndvi, col=MSHNDVIanothercolorspalette, main="NDVI della nuova vegetazione nel 1996")
	
	multitemporalndvi <- disruptedvegetationndvi - newlyvegetationndvi
	     
	multitemporalndvi
	
	plot(multitemporalndvi, col=MSHNDVIcolorspalette)
	
	plot(multitemporalndvi, col=MSHNDVIcolorspalette, main="NDVI della vegetazione sul Monte Saint Helens dal 1987 to 1996")
	    
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
	
	plot(DVc$map)
	
	set.seed(1)
	
	rnorm(1)
	
	NVc <- unsuperClass(newlyvegetation, nClass=3)
	
	NVc
	     
	plot(NVc$map)
	
	par(mfrow=c(1,2))
	
	plot(DVc$map)
	
	plot(NVc$map)
	
	freq(DVc$map)
	
	freq(NVc$map)
	
	sDV <- 510198 + 1030579 + 2737705
	
	sDV
	
	sNV <- 395390 + 872402 + 3010690
	
	sNV
	
	pDV <- freq(DVc$map)/sDV
	
	pDV
	
	pNV <-freq(NVc$map)/sNV
	
	pNV
	
	MSHcopertura <- c("Foresta", "Agricoltura/Vegetazione diradata", "Suolo nudo")
	
	coperturapercentualenel1987 <- c(63.98776, 24.08749, 11.92474)
	
	coperturapercentualenel1996 <- c(70.368182, 20.390456, 9.241362)
	
	aumentopercentuale <- data.frame(MSHcopertura, coperturapercentualenel1987, coperturapercentualenel1996)
	
	aumentopercentuale
	
	idealgraphicsuccession <- c("Suolo nudo", "Agricoltura/Vegetazione diradata", "Foresta")
	
	ggplot(aumentopercentuale, aes(x= MSHcopertura, y= coperturapercentualenel1987, fill=MSHcopertura)) + ggtitle("Percentuale di copertura sulle pendici vulcaniche del Monte Saint Helens nel 1987") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "darkolivegreen4", "burlywood3"))                    
	                     
	ggplot(aumentopercentuale, aes(x=MSHcopertura, y= coperturapercentualenel1996, fill=MSHcopertura)) + ggtitle("Percentuale di copertura sulle pendici vulcaniche del Monte Saint Helens nel 1996") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "darkolivegreen4", "burlywood3"))                  
	                     
	pDV <- ggplot(aumentopercentuale, aes(x= MSHcopertura, y= coperturapercentualenel1987, fill=MSHcopertura)) + ggtitle("Percentuale di copertura sulle pendici vulcaniche del Monte Saint Helens nel 1987") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "darkolivegreen4", "burlywood3"))                    
	
	pNV <- ggplot(aumentopercentuale, aes(x=MSHcopertura, y= coperturapercentualenel1996, fill=MSHcopertura)) + ggtitle("Percentuale di copertura sulle pendici vulcaniche del Monte Saint Helens nel 1996") + theme(plot.title=element_text(face="bold")) + scale_x_discrete(limits = idealgraphicsuccession) + scale_y_continuous(limits = c(min(0),max(71))) + geom_bar(stat="identity") + theme(legend.position="bottom") + scale_fill_manual(values=c("gold", "darkolivegreen4", "burlywood3"))                  
	
	grid.arrange(pDV, pNV, nrow=1)                    
	     
	disruptedvegetationdvimean <- focal(disruptedvegetationdvi,w=matrix(1/49, nrow=7, ncol=7), fun=mean)
	
	plot(disruptedvegetationdvimean)
	
	MSHMEANcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
	
	plot(disruptedvegetationdvimean, col=MSHMEANcolorspalette)
	
	newlyvegetationdvimean <- focal(newlyvegetationdvi, w=matrix(1/49, nrow=7, ncol=7), fun=mean)
	
	plot(newlyvegetationdvimean)
	
	MSHMEANcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
	
	plot(newlyvegetationdvimean, col=MSHMEANcolorspalette)
	
	par(mfcol=c(1,2))
	
	plot(disruptedvegetationdvimean, col=MSHMEANcolorspalette, main="Variabilità μ-dipendente per DVI della vegetazione disturbata nel 1987")
	
	plot(newlyvegetationdvimean, col=MSHMEANcolorspalette, main="Variabilità μ-dipendente per DVI della nuova vegetazione nel 1996")
	                                
	disruptedvegetationdvistandarddeviation <- focal(disruptedvegetationdvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)
	
	plot(disruptedvegetationdvistandarddeviation)
	
	MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
	
	plot(disruptedvegetationdvistandarddeviation, col=MSHSDcolorspalette)
	
	newlyvegetationdvistandarddeviation <- focal(newlyvegetationdvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)
	
	plot(newlyvegetationdvistandarddeviation)
	
	MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
	
	plot(newlyvegetationdvistandarddeviation, col=MSHSDcolorspalette)
	
	par(mfcol=c(1,2))
	
	plot(disruptedvegetationdvistandarddeviation, col=MSHMEANcolorspalette, main="Variabilità σ-dipendente per DVI della vegetazione disturbata nel 1987")
	
	plot(newlyvegetationdvistandarddeviation, col=MSHMEANcolorspalette, main=" Variabilità σ-dipendente per DVI della nuova vegetazione nel 1996")
	                                
	disruptedvegetationndvimean <- focal(disruptedvegetationndvi,w=matrix(1/169, nrow=13, ncol=13), fun=mean)
	
	plot(disruptedvegetationndvimean)
	
	MSHMEANcolorspalette <- colorRampPalette(c("blue","green","pink","magenta","orange","white","red","yellow"))(100)
	
	plot(disruptedvegetationndvimean, col=MSHMEANcolorspalette)
	
	newlyvegetationndvimean <- focal(newlyvegetationndvi, w=matrix(1/169, nrow=13, ncol=13), fun=mean)
	
	plot(newlyvegetationndvimean)
	
	MSHMEANcolorspalette <- colorRampPalette(c("blue","green","pink","magenta","orange","white","red","yellow"))(100)
	
	plot(newlyvegetationndvimean, col=MSHMEANcolorspalette)
	
	par(mfcol=c(1,2))
	
	plot(disruptedvegetationndvimean, col=MSHMEANcolorspalette, main="Variabilità μ-dipendente per NDVI della vegetazione disturbata nel 1987")
	
	plot(newlyvegetationndvimean, col=MSHMEANcolorspalette, main="Variabilità μ-dipendente per NDVI della nuova vegetazione nel 1996")
	
	disruptedvegetationndvistandarddeviation <- focal(disruptedvegetationndvi,w=matrix(1/169, nrow=13, ncol=13), fun=sd)
	
	plot(disruptedvegetationndvistandarddeviation)
	
	MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
	
	plot(disruptedvegetationndvistandarddeviation, col=MSHSDcolorspalette)
	
	newlyvegetationndvistandarddeviation <- focal(newlyvegetationndvi,w=matrix(1/169, nrow=13, ncol=13), fun=sd)
	
	plot(newlyvegetationndvistandarddeviation)
	
	MSHSDcolorspalette <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
	
	plot((newlyvegetationndvistandarddeviation, col=MSHSDcolorspalette)
	
	par(mfcol=c(1,2))
	
	plot(disruptedvegetationndvistandarddeviation, col=MSHMEANcolorspalette, main=" Variabilità σ-dipendente per NDVI della vegetazione disturbata nel 1987")
	
	plot(newlyvegetationndvistandarddeviation, col=MSHMEANcolorspalette, main=" Variabilità σ-dipendente per NDVI della nuova vegetazione nel 1996")

pdf(file=onlyforgraphics)






