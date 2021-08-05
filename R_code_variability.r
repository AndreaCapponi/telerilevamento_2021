#How to calculate the variability within a satellite image? 🕵🏿‍♂️🗺️

#The third package to install is ggplot2, which is a system for declaratively creating graphics, based on "The Grammar of Graphics". The user provides the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details:

install.packages("ggplot2")

#The fourth package to install is gridExtra, which provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables: 

install.packages("gridExtra")

#The fifth package to install is viridis, a whole of color maps designed to improve graph readability for readers with common forms of color blindness and/or color vision deficiency. The color maps are also perceptually-uniform, both in regular form and also when converted to black-and-white for printing. This package also contains 'ggplot2' bindings for discrete and continuous color and fill scales

install.packages("viridis")

#library() is a function which load and attach add-on packages, in this case the previous raster, RStoolbox, ggplot2, gridExtra and viridis packages:

library(raster)

library(RStoolbox)

library(ggplot2)

library(gridExtra)

library(viridis)

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

#I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

sentinel <- brick("sentinel.png")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#ggRGB() is a function that calculates RGB color composite RasterLayers for plotting with ggplot2. Optional values for clipping and and stretching can be used to enhance the imagery:

plotRGB(sentinel)

#The syntax of the plotRGB() function is different from the standard because the sequence of sentinel bands associated with the R, G and B channels is the one I requested and it is not necessary to specify the arguments

#plotRGB(sentinel) and plotRGB(sentinel, r=1, g=2, b=3, strecht="Lin") will lead the user to the same result!

#How to calculate variance within a satellite image?

#The variance is a numerical measure of how the data values is dispersed around the mean

#The calculation of the variance in a satellite image is to be carried out exclusively on one of its bands selected by the user through the moving window method

#The moving window method depends on the value of the standard deviation (σ) calculated on the values of a grid whose size is 3 x 3 pixels

#The final value is associated with the pixel that represents the exact center of the moving window

#The new map obtained externally has non-values while internally the values for the standard deviations to which to attribute different "colors"

#How to merge the three bands of the sentinel satellite image into one so that I can apply the moving window method?

#Name identification for the four sentinel bands is possible from the 𝘯𝘢𝘮𝘦𝘴 category in the information summary clicking Enter ↵ as physical command by keyboard:

sentinel

#The relatively sentinel information is contained within the table:

class      : RasterBrick 
dimensions : 794, 798, 633612, 4  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 798, 0, 794  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : sentinel.png 
names      : sentinel.1, sentinel.2, sentinel.3, sentinel.4 
min values :          0,          0,          0,          0 
max values :        255,        255,        255,        255

#The satellite bands of interest in sentinel to me are sentinel$sentinel.1 (NIR) and sentinel$sentinel.2 (RED) to which for convenience I gave them a name to facilitate the calculation of NDVI in the following code string:

nir <- sentinel$sentinel.1

red <- sentinel$sentinel.2

#I calculate the NDVI vegetation index as R_code_vegetation_indices.r according to the NDVI formula (NIR-RED) / (NIR + RED):

ndvi <- (nir-red) / (nir+red)

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral bands:

plot(ndvi)

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

vcp <- colorRampPalette(c('black','white','red','magenta','green'))(100) 

#plot(ndvi) must be reformulated by incorporating new palette of colors vcp: plot(ndvi,col=vcp) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(ndvi,col=vcp)

#The functions described so far enable the user to calculate the variability of the sentinel satellite image with the moving window method computationally expressed by the focal () function:

#focal() is a function that calculates focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function:

#The variance has been defined as a numerical measure of how the data values is dispersed around the mean. If instead I considered it as dispersed around the standard deviation (σ)?

ndvisd3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

#Attention: The moving window has a square shape in order to avoid the anisotropy, which would compromise the calculation of values for the cartesian axes X and Y by giving an incorrect interpretation by the user!

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral bands:

plot(ndvisd3)

#I exploit a function (colorRampPalette) to create an other palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

#plot(ndvisd3) must be reformulated by incorporating new palette of colors sdcp: plot(ndvisd3, col=sdcp) will display graphically reflectance's values in a blue, green, pink, magenta, orange, brown, red and yellow colour scale:

plot(ndvisd3, col=sdcp)

#The variance has been defined as a numerical measure of how the data values is dispersed around the mean. If instead I considered it according to this definition what would be the difference or what would be the differences in comparison to the standard deviation (σ)?

ndvimean3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral bands:

plot(ndvimean3)

#I exploit a function (colorRampPalette) to create an other palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

mncp <- colorRampPalette(c('cyan','green','pink','violet','orange','brown','red','golden'))(100) 

#plot(ndvimean3) must be reformulated by incorporating new palette of colors mncp: plot(ndvimean3, col=mncp) will display graphically reflectance's values in a cyan, green, pink, violet, orange, brown, red and golden colour scale:

plot(ndvimean3, col=mncp)

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:
     
par(mfrow=c(1,2))

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

mncp <- colorRampPalette(c('cyan','green','pink','violet','orange','brown','red','golden'))(100) 

plot(ndvisd3, col=sdcp)

plot(ndvimean3, col=mncp)

#After applying the moving window method to the sentinel satellite image, why not change the window size according to the need I might have in statistical analysis?

#Attention! The number of pixels must be an odd number to have in each analysis a single central pixel in the moving window through which to calculate the standard deviation (σ)

#focal() is a function that calculates focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function:

ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral bands:

plot(ndvisd5)

#I exploit a function (colorRampPalette) to create an other palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

#plot(ndvisd5) must be reformulated by incorporating new palette of colors sdcp: plot(ndvisd5, col=sdcp) will display graphically reflectance's values in a blue, green, pink, magenta, orange, brown, red and yellow colour scale:

plot(ndvisd5, col=sdcp)

#focal() is a function that calculates focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function:

ndvimsd7 <- focal(ndvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral bands:

plot(ndvisd7)

#I exploit a function (colorRampPalette) to create an other palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

#plotplot(ndvisd7) must be reformulated by incorporating new palette of colors sdcp: plot(ndvisd7, col=clsd) will display graphically reflectance's values in a blue, green, pink, magenta, orange, brown, red and yellow colour scale:

plot(ndvisd7, col=clsd)

#It is also possible to exploit a multivariate analysis by considering exclusively the PC1 component on which to scroll the moving window, obtaining a map for the variability according to the values of the standard deviation (σ)

#I can conduct the principal component analysis or PCA on the sentinel RasterBrick, exploiting the rasterPCA() function which calculates R-mode PCA for RasterBricks or RasterStacks and returns a RasterBrick with multiple layers of PCA scores:

sentinelpca <- rasterPCA(sentinel)

#In R, to visualize information of resampledp224r63_2011rpca, name of it followed by Enter ↵ as physical command by keyboard:

sentinelpca

#The relatively sentinelpca information is contained within the $map:

$call
rasterPCA(img = sentinel)

$model
Call:
princomp(cor = spca, covmat = covMat[[1]])

Standard deviations:
  Comp.1   Comp.2   Comp.3   Comp.4 
77.33628 53.51455  5.76560  0.00000 

 4  variables and  633612 observations.

$map
class      : RasterBrick 
dimensions : 794, 798, 633612, 4  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 798, 0, 794  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      :       PC1,       PC2,       PC3,       PC4 
min values : -227.1124, -106.4863,  -74.6048,    0.0000 
max values : 133.48720, 155.87991,  51.56744,   0.00000 


attr(,"class")
[1] "rasterPCA" "RStoolbox"

#$call, $model and $map refer to respectively: the function selected by the user and applied to the image on which the statistical analysis is conducted, the result (s) of the previous statistical analysis and a general information framework for the initial image as an R object

#summary() is a generic function used to produce result summaries of the results of various model fitting functions

#$ is a basic extraction operator which extract, from the initial plot() of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest"

summary(sentinelpca$model)

#The combination of the summary () function and the basic $ extraction operator allows me to view only the information contained in $model. The importance of the components is analyzed through the standard deviation, the variance proportion and the cumulative proportion:

Importance of components:
                           Comp.1     Comp.2      Comp.3 Comp.4
Standard deviation     77.3362848 53.5145531 5.765599616      0
Proportion of Variance  0.6736804  0.3225753 0.003744348      0
Cumulative Proportion   0.6736804  0.9962557 1.000000000      1

#The variance in percent for the PC1 blue band represents that of the variance in sentinelpca being around 67,38%!

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral PCA bands:

plot(sentinelpca$map)

#To conduct the multivariate analysis according to the moving window method exclusively considering the PC1 component in sentinelpca$map, I have to give it a name of my choice:

PC1 <-sentinelpca$map$PC1

#Before proposing an iterative cycle of functions for the purpose illustrated in the 245th code string, it is essential in R to rename objects by abbreviation so that they are more manageable than entire strings of code!

#focal() is a function that calculates focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function:

PC1sd5 <- focal(PC1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

#I exploit a function (colorRampPalette) to create an other palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

#plot(PC1sd5) must be reformulated by incorporating new palette of colors sdcp: plot(PC1sd5, col=sdcp) will display graphically reflectance's values in a blue, green, pink, magenta, orange, brown, red and yellow colour scale:

plot(PC1sd5, col=sdcp)

#focal() is a function that calculates focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function:

PC1sd13 <- focal(PC1, w=matrix(1/169, nrow=13, ncol=13), fun=sd)

#I exploit a function (colorRampPalette) to create an other palette of colors each one of them is indexed, numbered pixel as virtual box matches numbered color as bit depth:

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

#plot(PC1sd13) must be reformulated by incorporating new palette of colors sdcp: plot(PC1sd13, col=sdcp) will display graphically reflectance's values in a blue, green, pink, magenta, orange, brown, red and yellow colour scale:

plot(PC1sd13, col=sdcp)

#plot (PC1sd13, col = sdcp) allows you to view a strong geo-morphological variability attributable to the geomorphological alteration of the soil surface due to the presence of cracks, crevasses, etc...

#The vegetation, on the other hand, appears to have low bio-ecosystemic variability as it is a set of grasslands; 

#The variability, calculated in sentinel through the moving window method with centering on the standard deviation, is at its maximum value in the transition between bare soil and prairie!

#source causes R to accept its input from the named file or URL or connection or expressions directly. Input is read and parsed from that file until the end of the file is reached, then the parsed expressions are evaluated sequentially in the chosen environmen

source("source_test_lezione.r")

#source causes R to accept its input from the named file or URL or connection or expressions directly. Input is read and parsed from that file until the end of the file is reached, then the parsed expressions are evaluated sequentially in the chosen environmen

source("source_ggplot.r")

#To visualize the data of the multivariate analysis so far conducted on an R object (my choice between PC1sd5 and PC1sd13), the user can build the ggplot () function starting from the latter which represents the work area with Cartesian references and completely empty

ggplot() + geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))

#The addition of statistical and aesthetic elements in ggplot2 occurs in blocks: in the syntax of the function after ggplot () follows their sum to be understood as an operation (+)

#In the ggplot () function, the geometry that is selected by the user depending on the graph he wants to display is fundamental. Being a satellite image in pixels, the reference function is geom_raster ()

#The title in the ggplot () function syntax must be added as an additional block in the form ggtitle ("title of the statistical graph")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("Standard deviation of PC1 by viridis colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="magma")+ggtitle("Standard deviation of PC1 by magma colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="inferno")+ggtitle("Standard deviation of PC1 by inferno colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="turbo")+ggtitle("Standard deviation of PC1 by turbo colour scale")

#viridis package contains 'ggplot2' bindings for discrete and continuous color and fill scales represented by the scale_fill_viridis () argument below:

ggplot() + geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+ scale_fill_viridis()

#I have three maps available depending on the scale_fill_viridis () block for PC1sd5 (viridis, magma and turbo), I associate names to them to create a multigraphic display through the grid.arrange () function:

p1 <- ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("Standard deviation of PC1 by viridis colour scale")

p2 <- ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="magma")+ggtitle("Standard deviation of PC1 by magma colour scale")

p3 <- ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="turbo")+ggtitle("Standard deviation of PC1 by turbo colour scale")

#arrangeGrob set up a gtable layout to place multiple grobs on a page. In particular grid.arrange() draw on the current device and is useful to organize ggRGB elements after simply renamed them:

grid.arrange(p1, p2, p3, nrow=1)

#Sequence of informatic commands for R_code_variability.r

install.packages("raster")

install.packages("RStoolbox")

library(raster)

library(RStoolbox)

setwd("C:/lab/")

sentinel <- brick("sentinel.png")

plotRGB(sentinel)

sentinel

nir <- sentinel$sentinel.1

red <- sentinel$sentinel.2

ndvi <- (nir-red) / (nir+red)

plot(ndvi)

vcp <- colorRampPalette(c('black','white','red','magenta','green'))(100) 

plot(ndvi,col=vcp)

ndvisd3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(ndvisd3)

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd3, col=sdcp)

ndvimean3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(ndvimean3)

mncp <- colorRampPalette(c('cyan','green','pink','violet','orange','brown','red','golden'))(100) 

plot(ndvimean3, col=mncp)

par(mfrow=c(1,2))

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

mncp <- colorRampPalette(c('cyan','green','pink','violet','orange','brown','red','golden'))(100) 

plot(ndvisd3, col=sdcp)

plot(ndvimean3, col=mncp)

ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

plot(ndvisd5)

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd5, col=sdcp)

ndvimsd7 <- focal(ndvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)

plot(ndvisd7)

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd7, col=clsd)

sentinelpca <- rasterPCA(sentinel)

sentinelpca

summary(sentinelpca$model)

plot(sentinelpca$map)

PC1 <-sentinelpca$map$PC1

PC1sd5 <- focal(PC1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(PC1sd5, col=sdcp)

PC1sd13 <- focal(PC1, w=matrix(1/169, nrow=13, ncol=13), fun=sd)

sdcp <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(PC1sd13, col=sdcp)

source("source_test_lezione.r")

source("source_ggplot.r")

ggplot() + geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()
ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("Standard deviation of PC1 by viridis colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="magma")+ggtitle("Standard deviation of PC1 by magma colour scale")
ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="inferno")+ggtitle("Standard deviation of PC1 by inferno colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="turbo")+ggtitle("Standard deviation of PC1 by turbo colour scale")

p1 <- ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("Standard deviation of PC1 by viridis colour scale")

p2 <- ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="magma")+ggtitle("Standard deviation of PC1 by magma colour scale")

p3 <- ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="turbo")+ggtitle("Standard deviation of PC1 by turbo colour scale")

grid.arrange(p1, p2, p3, nrow=1)

