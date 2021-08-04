#Classification of Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg and Solar_Orbiter_s_high-resolution_view_of_the_Sun.png satellite images captured by the Solar Orbiter satellite of ESA ☀️ 

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is raster through which is possible reading, writing, manipulating, analyzing and modeling of spatial data. The package implements basic and high-level functions for raster data and for vector data operations such as intersections:

install.packages("raster")

#The second package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#library() is a function which load and attach add-on packages, in this case the previous raster and RStoolbox packages:

library(raster)

library(RStoolbox)

#I might as well consider require() function, giving a warning message and returning a logical value as FALSE if the requested package is not found and TRUE if the package is loaded. The library() function instead by default returns an error if the requested package does not exist!

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

#I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

SO <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#In R, to visualize information of SO, name of it followed by Enter ↵ as physical command by keyboard:

SO

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize SO in the colors of the visible spectrum before its download from the ESA website https://www.esa.int/ESA_Multimedia/Sets/Solar_Orbiter_first_images/(result_type)/images:

plotRGB(SO, 1,2,3, stretch="lin")

#The classification of a satellite image depends on the reflectance values attributed to each pixel

#The values for reflectance vary in the red, green and blue (RGB) bands and two or more pixels will be "merged" to form a class if and only if they have a superimposable value

#These pixels will be placed in a multispectral region as a point cloud which, together with others in a three-dimensional reference system, define the spectrum through which the satellite image is displayed

#The above classification can be effectuated with a training set consisting of: 1) a reference satellite image and 2) the model with which there should be a classification of the pixels depending on their reflectance values or with the unsuperClass () function, where the classification of pixels depending on their reflectance values, on the other hand, occurs randomly!

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument:

SOc <- unsuperClass(SO, nClasses=3)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 47th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(SOc$map)

#The sequence of the set.seed () and r.norm () functions is functional to set the seed of R's random number generator. The seed will always be the chosen one to reproduce the same classification (nClasses and / or nSamples) in a series of plot () for satellite images to which R_code_classification.r is being applied:

set.seed(42)

r.norm(42)

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument

#What if the number of classes in the nClasses argument increased from 3 to 20? (from SOc <- unsuperClass (SO, nClasses = 3) in the 47th string to newSOc <- unsuperClass (SO, nClasses = 20) in the 63rd string)

newSOc <- unsuperClass(SO, nClasses=20)

#In R, to visualize information of newSOc, name of it followed by Enter ↵ as physical command by keyboard:

newSOc

unsuperClass results

*************** Map ******************
$map
class      : RasterLayer 
dimensions : 1157, 1920, 2221440  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 1920, 0, 1157  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      : layer 
values     : 1, 20  (min, max)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 47th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(newSOc$map)

#plot(SOc$map) and plot(newSOc$map) show a difference in resolution in regions of the solar corona characterized by different temperatures (from 5777 K to 10⁶ K). The greater the number of classes, the greater the number of regions in which it is possible to identify characteristic phenomena such as campfires with excellent resolution through the Solar Orbiter satellite!

#I exploit a function (raster) to import data from lab folder - external - to R - internal* -:

sun <- raster("Solar_Orbiter_s_high-resolution_view_of_the_Sun.png")

#Solar_Orbiter_s_high-resolution_view_of_the_Sun.png is an image captured by ESA's Solar Orbiter satellite and downloaded from the website https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_high-resolution_view_of_the_Sun3. Contrary to the previous satellite image, sun shows the solar chromosphere in the ultraviolet wavelength for the electromagnetic spectrum

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument

sunc <- unsuperClass(sun, nClasses=3)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 47th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(sunc$map)

#I exploit  a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

suncl <- colorRampPalette(c('yellow','black','red'))(100)

#plot(sunc$map) must be reformulated by incorporating new palette of colors suncl: plot(sunc$map,col=suncl) will display graphically reflectance's values in a yellow, black and red colour scale:

plot(sunc$map,col=suncl)

#Classification of the satellite image dolansprings_oli_2013088_canyon_lrg.jpg captured by the Landsat satellite of the Nasa Earth Observatory 🏜️

#I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

GC <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#dolansprings_oli_2013088_canyon_lrg.jpg is an image captured by the Landsat satellite and downloaded from the NASA Earth Observatory website https://landsat.visibleearth.nasa.gov/view.php?id=80948

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize SO in the colors of the visible spectrum before its download from the ESA website https://www.esa.int/ESA_Multimedia/Sets/Solar_Orbiter_first_images/(result_type)/images:

plotRGB(GC, r=1, g=2, b=3, stretch="lin") 

plotRGB(GC, r=1, g=2, b=3, stretch="hist") 

#The type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument

GC1c <- unsuperClass(gc, nClasses=2)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 47th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(GC1c$map)

#What if the number of classes in the nClasses argument increased from 2 to 4? (GC1c <- unsuperClass(gc, nClasses=2) in the 128th string to GC2c <- unsuperClass(gc, nClasses=4) in the 138th string)

#The unsupervised Classification () function randomly classifies the sampled pixels (whose number can be indicated in the nSamples argument) depending on their reflectance values, according to the number of classes selected by the user via the nClasses argument

GC2c <- unsuperClass(gc, nClasses=4)

#plot is a common function for plotting of R object and in this case is based on the basic extraction operator $: from the initial plot () of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest" which is for the user the classification of the satellite image in the 47th code string. This is viewable through the map () function that transform its input by applying a function to each element and returning a vector the same length as the input:

plot(GC2c$map)

#Sequence of informatic commands for R_code_classification.r

install.packages("raster")

install.packages("RStoolbox")

library(raster)

library(RStoolbox)

setwd("C:/lab/")

SO <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(SO, 1,2,3, stretch="lin")

SOc <- unsuperClass(SO, nClasses=3)

plot(SOc$map)

set.seed(42)

newSOc <- unsuperClass(SO, nClasses=20)

newSOc

plot(newSOc$map)

sun <- raster("Solar_Orbiter_s_high-resolution_view_of_the_Sun.png")

sunc <- unsuperClass(sun, nClasses=3)

plot(sunc$map)

suncl <- colorRampPalette(c('yellow','black','red'))(100)

plot(sunc$map,col=suncl)

GC <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

plotRGB(GC, r=1, g=2, b=3, stretch="lin") 

plotRGB(GC, r=1, g=2, b=3, stretch="hist") 

GC1c <- unsuperClass(GC, nClasses=2)

plot(GC1c$map)

GC2c <- unsuperClass(gc, nClasses=4)

plot(GC2c$map)

