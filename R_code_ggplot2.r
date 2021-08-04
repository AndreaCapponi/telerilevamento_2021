#library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)
setwd("~/lab/")
# Use the brick function to upload a multi-layered raster:
p224r63 <- brick("p224r63_2011_masked.grd")
# ggRGB function
# Calculates RGB color composite raster for plotting with ggplot2.
# Optional values for clipping and and stretching can be used to enhance the imagery.
ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")
# To assign a name to each object:
p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")
#
grid.arrange(p1, p2, nrow = 2) # This needs gridExtra













