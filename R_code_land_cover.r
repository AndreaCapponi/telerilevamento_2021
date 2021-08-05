#deforestation in the dry tropical forests of Mato Grosso (NT0140)

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is raster through which is possible reading, writing, manipulating, analyzing and modeling of spatial data. The package implements basic and high-level functions for raster data and for vector data operations such as intersections:

install.packages("raster")

#The second package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#The third package to install is ggplot2, which is a system for declaratively creating graphics, based on "The Grammar of Graphics". The user provides the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details:

install.packages("ggplot2")

#The fourth package to install is gridExtra, which provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables: 

install.packages("gridExtra")

#library() is a function which load and attach add-on packages, in this case the previous raster, RStoolbox, ggplot2 and gridExtra packages:

library(raster)

library(RStoolbox)

library(ggplot2)

library(gridExtra)

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

#Identically to the R_remote_code_sensing_first.r, I still exploit a function to import data from lab folder - external - to R - internal¹ - and this will be brick and not raster because our data does not represent raster layer objects but multi-layer raster objects!

defor1 <- brick("defor1.jpg")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#defor1.jpg is an image of the deforestation in the dry tropical forests of Mato Grosso (NT0140) captured by NASA's Terra satellite and downloaded from the website https://www.jpl.nasa.gov/images/mato-grosso-brazil

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize defor1 in the colors of the visible spectrum:

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

#ggRGB() is a function that calculates RGB color composite RasterLayers for plotting with ggplot2. Optional values for clipping and and stretching can be used to enhance the imagery 

ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

#The same iterative cycle of brick (), plotRGB () and ggRGB () functions must be applied to the defor2.jpg image so that an initial comparison can be made in the state of deforestation in the dry tropical forests of Mato Grosso (NT0140)

#Identically to the R_remote_code_sensing_first.r, I still exploit a function to import data from lab folder - external - to R - internal¹ - and this will be brick and not raster because our data does not represent raster layer objects but multi-layer raster objects!

defor2 <- brick("defor2.jpg")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#defor2.jpg is an image of the deforestation in the dry tropical forests of Mato Grosso (NT0140) captured by NASA's Terra satellite and downloaded from the website https://www.jpl.nasa.gov/images/mato-grosso-brazil

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize defor1 in the colors of the visible spectrum:

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#ggRGB() is a function that calculates RGB color composite RasterLayers for plotting with ggplot2. Optional values for clipping and and stretching can be used to enhance the imagery 

ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

#The same iterative cycle of brick (), plotRGB () and ggRGB () functions must be applied to the defor2.jpg image so that an initial comparison can be made in the state of deforestation in the dry tropical forests of Mato Grosso (NT0140) through the function par()

#The initial comparison between defor1 and defor2 for the deforestation in the dry tropical forests of Mato Grosso (NT0140) can be graphically visualized through the plotRGB() function and in particular by organizing the previous ones in a multiframe which r̲o̲w̲s or c̲o̲l̲umns are at the user's discretion

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:

par(mfrow=c(1,2))

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#The initial comparison in the deforestation in the dry tropical forests of Mato Grosso (NT0140) between defor1 and defor2 can also be graphically displayed through the ggRGB() function; unlike the previous function, images can be organized in a multiframe through the function grid.arrange () not before giving them a name!

D1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

D2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

#arrangeGrob set up a gtable layout to place multiple grobs on a page. In particular grid.arrange() draw on the current device and is useful to organize ggRGB elements after simply renamed them:

grid.arrange(D1, D2, nrow=2)

#The classification of a satellite image depends on the reflectance values attributed to each pixel

#The values for reflectance vary in the red, green and blue (RGB) bands and two or more pixels will be "merged" to form a class if and only if they have a superimposable value

#These pixels will be placed in a multispectral region as a point cloud which, together with others in a three-dimensional reference system, define the spectrum through which the satellite image is displayed

#The above classification can be effectuated with a training set consisting of: 1) a reference satellite image and 2) the model with which there should be a classification of the pixels depending on their reflectance values or with the unsuperClass () function, where the classification of pixels depending on their reflectance values, on the other hand, occurs randomly!

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument:

D1c <- unsuperClass(defor1, nClass=2)

#In the above classification, being interested in the phenomenon of deforestation, I created two classes using the nClasses argument: the first for the Amazon forest (near-infrared or NIR band displayed through the red R channel) and the second for agricultural land ( other bands displayed through the G and B channels)

#In R, to visualize information of D1c, name of it followed by Enter ↵ as physical command by keyboard:

D1c

#The relatively D1c information is contained within the table:

unsuperClass results

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 478, 714, 341292  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      : layer 
values     : 1, 2  (min, max)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 107th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(D1c$map)

#The sequence of the set.seed () and r.norm () functions is functional to set the seed of R's random number generator. The seed will always be the chosen one to reproduce the same classification (nClasses and / or nSamples) in a series of plot () for satellite images to which R_code_classification.r is being applied:

set.seed(1)

r.norm(1)

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument:

D2c <- unsuperClass(defor2, nClass=2)

#In the above classification, being interested in the phenomenon of deforestation, I created the two same classes of defor1 in the unsuperClass () function using the nClasses argument: the first for the Amazon forest (near-infrared or NIR band displayed through the red channel R) and the second for agricultural land (other bands displayed through the G and B channels)

#In R, to visualize information of D2c, name of it followed by Enter ↵ as physical command by keyboard:

D2c

#The relatively D1c information is contained within the table:

unsuperClass results

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 478, 717, 342726  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      : layer 
values     : 1, 2  (min, max)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 136th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(D2c$map)

#plot(D2c$map) is indicative of the sensitivity in the unsuperClass() function for Dc2, being insufficient in discriminating agricultural land from other areas or watersheds through a number of nClasses=2 having similar reflectance values!

#I repropose again for D2c the classification to the 136th string of code by increasing the number of classes from 2 to 3 in the nClasses argument of the unsuperClass() function

#The unsupervised Classification() function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument:

D2c3 <- unsuperClass(defor2, nClass=3)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 107th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(D2c3$map)

#

#freq() is a function that generates and formats frequency tables from a variable or a table, with percentages and formatting options:

freq(D1c$map)

#The relatively freq(D1c$map) information is contained within the table:

#     value  count
[1,]     1 306374
[2,]     2  34918

#freq() is a function that generates and formats frequency tables from a variable or a table, with percentages and formatting options:

freq(D2c$map)

#The relatively D2c$map information is contained within the table:

#     value  count
[1,]     1 178490
[2,]     2 164236


#Qual è la proporzione per avere la percentuale?
#La somma dei pixels è s1 <-306610 + 34682, poi s1 o dc1 con informazione sul numero totale dei pixels [1] 341292
#prop1 <-freq(d1c$map)/ s1
#prop1 
#            value     count
[1,] 2.930042e-06 0.8983803 Foresta Amazzonica
[2,] 5.860085e-06 0.1016197 Suolo ad uso agricolo
#s2 <- 163860 + 178866 = [1] 342726
#prop2 <-freq(d2c$map)/ s2
#prop2
#            value     count
[1,] 2.917783e-06 0.4781079 Suolo ad uso agricolo
[2,] 5.835565e-06 0.5218921 Foresta Amazzonica
#Per la percentuale, semplice moltiplicazione * 100 da numeri ottenuti per le prop1 prop2
#Generazione di un dataframe a partire dai dati ottenuti!
#Fattori delle variabili categoriche: prima colonna con Forest and Agriculture sotto il nome Cover
#La struttura consiste in colonne per percentuale iniziale di pixel con 99 e percentuale finale di pixel 2006
#cover <- c("Forest", "Agriculture")
#percent_1992 <- c(89.83, 10.16)
#percent_2016 <- c(52.18, 47.81)
#losspercentages <- data.frame(cover, percent_1992, percent_2016)
#losspercentages
#   cover percent_1992 percent_2016
1      Forest        89.83        52.18
2 Agriculture        10.16        47.81
#Come plottare questi dati?
#ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")
#ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")
#p1 <- ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")
#p2 <- ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")
#grid.arrange(p1, p2, nrow=1)
#

#Sequence of informatic commands for R_code_knitr.r

install.packages("raster")

install.packages("RStoolbox")

install.packages("ggplot2")

install.packages("gridExtra")

library(raster)

library(RStoolbox)

library(ggplot2)

library(gridExtra)

setwd("C:/lab/")

defor1 <- brick("defor1.jpg")

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

D1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

D2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

grid.arrange(D1, D2, nrow=2)

D1c <- unsuperClass(defor1, nClass=2)

D1c

set.seed(1)

r.norm(1)

D2c <- unsuperClass(defor2, nClass=2)

D2c

plot(D2c$map)

D2c3 <- unsuperClass(defor2, nClass=3)

plot(D2c3$map)













