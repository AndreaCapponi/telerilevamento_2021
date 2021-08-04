#

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is raster through which is possible reading, writing, manipulating, analyzing and modeling of spatial data. The package implements basic and high-level functions for raster data and for vector data operations such as intersections:

install.packages("raster")

#The second package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#The third package to install is ggplot2, which isaA system for declaratively creating graphics, based on "The Grammar of Graphics". The user provides the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details:

install.packages(ggplot2)

#The fourth package to install is gridExtra, which provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables: 

install.packages(gridExtra)

#library() is a function which load and attach add-on packages, in this case the previous raster, RStoolbox, ggplot2 and gridExtra packages:

library(raster)

library(RStoolbox)

library(ggplot2)

library(gridExtra)
p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")
#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

#I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

p224r63 <- brick("p224r63_2011_masked.grd")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#ggRGB() is a function that calculates RGB color composite RasterLayers for plotting with ggplot2. Optional values for clipping and and stretching can be used to enhance the imagery

#The graphical visualization of p224r63_2011 in true colors, being LANDSAT equipped with true colour, thermal and multispectral sensors in a complex acquisition system, will be obtained from the visible spectrum to which I associate B1_sre:blue, B2_sre:green, B3_sre:red spectral bands of the initial object

ggRGB(p224r63,3,2,1, stretch="lin")

#This graphical visualization in true colors is therefore in RGB and independent from user's selection of a palette of colors through colorRampPalette function because the three levels of interest selected by the user herself/himself from B1_sre to B7_sre are combined such that they represent exclusively the red, green and blue channel in true colour sensors of LANDSAT satellite

#The graphical visualization of p224r63_2011 in false color, not being the human eye thermal and multispectral sensors in a biological complex acquisition system, will be obtained by substituting B1_sre:blue spectral band with B4_sre:near-infrared, B5_sre:mid-infrared, B6_sre:far-infrared or B7_sre:other mid-infrared spectral bands on a case by case basis in remote sensing analysis

ggRGB(p224r63,4,3,2, stretch="lin")

#This is the graphical visualization of p224r63_2011 in false color for vegetational coverage of the Amazon rainforest through the red channel

#arrangeGrob set up a gtable layout to place multiple grobs on a page. In particular grid.arrange() draw on the current device and is useful to organize ggRGB elements after after giving them a name:

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")

p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2)

#Sequence of informatic commands for R_code_ggplot2.r

install.packages("raster")

install.packages("RStoolbox")

install.packages(ggplot2)

install.packages(gridExtra)

library(raster)

library(RStoolbox)

library(ggplot2)

library(gridExtra)

setwd("C:/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")

ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")

p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2)


