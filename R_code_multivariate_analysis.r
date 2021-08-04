#Al di sotto di questo commento studiare e organizzare la lezione del 23/04/2021

#Al di sotto di questo commento studiare e organizzare la lezione del 28/04/2021

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

##I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

p224r63_2011 <- brick("p224r63_2011_masked.grd")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#In R, to visualize information of p224r63_2011, name of it followed by Enter ↵ as physical command by keyboard:

p224r63_2011

#The relatively p224r63_2011 information is contained within the table:

class      : RasterBrick 
dimensions : 1499, 2967, 4447533, 7  (nrow, ncol, ncell, nlayers)
resolution : 30, 30  (x, y)
extent     : 579765, 668775, -522705, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
source     : p224r63_2011_masked.grd 
names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
min values : 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.196277e-02, 4.116526e-03, 2.951000e+02, 0.000000e+00 
max values :    0.1249041,    0.2563655,    0.2591587,    0.5592193,    0.4894984,  305.2000000,    0.3692634 

#pairs() is a function through which a matrix of scatterplots is produced to visualize correlation of small data sets:

pairs(p224r63_2011)

#Principal component analysis or PCA is in multivariate statistics a simplification of the source data which in R consists, from a set of correlated numerical variables, in creating a smaller set of “artificial” orthogonal variables

#What solution to adopt if the time required for the PCA to resample the pixels in the newly created bands is higher than expected? (The time required for the PCA depends strictly on the high number of pixels contained in the 7 bands of p224r63_2011: 4447533 * 7 = 31132731!)

#The solution is to be found in the function aggregate(), which splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form:

resampledp224r63_2011 <- aggregate(p224r63_2011, fact=10)

#In the syntaxis of the aggregate() function, in addition to the name of the R object (RasterLayer, RasterBrick, etc ...), the FUN and fact arguments are to be considered: if with the FUN argument the summary statistics can be applied to all data subsets, with the sampling factor it is possible to increase the size of the pixels and, as a final result, decrease the resolution of the satellite image

#In R, to visualize information of p224r63_2011, name of it followed by Enter ↵ as physical command by keyboard:

resampledp224r63_2011

#The relatively resampledp224r63_2011 information is contained within the table:

class      : RasterBrick 
dimensions : 150, 297, 44550, 7  (nrow, ncol, ncell, nlayers)
resolution : 300, 300  (x, y)
extent     : 579765, 668865, -522735, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
source     : r_tmp_2021-08-04_083025_19152_54179.grd 
names      :       B1_sre,       B2_sre,       B3_sre,       B4_sre,       B5_sre,        B6_bt,       B7_sre 
min values :   0.00670000,   0.01580000,   0.01356544,   0.01648527,   0.01500000, 295.54400513,   0.00270000 
max values :   0.04936299,   0.08943339,   0.10513023,   0.43805822,   0.31297142, 303.57499786,   0.18649654 

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:

par(mfrow=c(2,1))

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")

plotRGB(resampledp224r63_2011, r=4, g=3, b=2, stretch="lin")

#In this code, the purpose of the previous par () function is to graphically display the set of differences between the original image p224r63_2011 and the resampled image resampledp224r63_2011 after the application of the aggregate () function in the 59th string of code

#Finally I can conduct the principal component analysis or PCA on the resampledp224r63_2011r RasterBrick, exploiting the rasterPCA() function which calculates R-mode PCA for RasterBricks or RasterStacks and returns a RasterBrick with multiple layers of PCA scores:

resampledp224r63_2011rpca <- rasterPCA(resampledp224r63_2011)

#In R, to visualize information of resampledp224r63_2011rpca, name of it followed by Enter ↵ as physical command by keyboard:

resampledp224r63_2011rpca

#The relatively resampledp224r63_2011rpca information is contained within the $map:

$call
rasterPCA(img = resampledp224r63_2011)

$model
Call:
princomp(cor = spca, covmat = covMat[[1]])

Standard deviations:
      Comp.1       Comp.2       Comp.3       Comp.4       Comp.5       Comp.6 
1.2050671362 0.0461548802 0.0151509516 0.0045752199 0.0018413569 0.0012333745 
      Comp.7 
0.0007595367 

 7  variables and  44550 observations.

$map
class      : RasterBrick 
dimensions : 150, 297, 44550, 7  (nrow, ncol, ncell, nlayers)
resolution : 300, 300  (x, y)
extent     : 579765, 668865, -522735, -477735  (xmin, xmax, ymin, ymax)
crs        : +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
source     : memory
names      :         PC1,         PC2,         PC3,         PC4,         PC5,         PC6,         PC7 
min values : -1.96808463, -0.30213565, -0.07212306, -0.02976086, -0.02695826, -0.01712903, -0.00744772 
max values : 6.065280099, 0.142898206, 0.114509980, 0.056825410, 0.008628344, 0.010537390, 0.005594290 


attr(,"class")
[1] "rasterPCA" "RStoolbox"

#$call, $model and $map refer to respectively: the function selected by the user and applied to the image on which the statistical analysis is conducted, the result (s) of the previous statistical analysis and a general information framework for the initial image as an R object

#summary() is a generic function used to produce result summaries of the results of various model fitting functions

#$ is a basic extraction operator which extract, from the initial plot() of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of "interest"

summary(resampledp224r63_2011rpca$model)

#The combination of the summary () function and the basic $ extraction operator allows me to view only the information contained in $model. The importance of the components is analyzed through the standard deviation, the variance proportion and the cumulative proportion:

Importance of components:
                          Comp.1      Comp.2       Comp.3       Comp.4
Standard deviation     1.2050671 0.046154880 0.0151509516 4.575220e-03
Proportion of Variance 0.9983595 0.001464535 0.0001578135 1.439091e-05
Cumulative Proportion  0.9983595 0.999824022 0.9999818357 9.999962e-01
                             Comp.5       Comp.6       Comp.7
Standard deviation     1.841357e-03 1.233374e-03 7.595367e-04
Proportion of Variance 2.330990e-06 1.045814e-06 3.966085e-07
Cumulative Proportion  9.999986e-01 9.999996e-01 1.000000e+00

#La varianza in percentuale per la banda del blu PC1 rappresenta quasi totalmente quella della varianza in resampledp224r63_2011rpca essendo al 99,84%!

#Variance in percent is represented by 99.998% of the first three bands PC1, PC2 and PC3

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral PCA bands:

plot(resampledp224r63_2011rpca$map)

#dev.off() function closes the specified plot (by default the current device) to avoid the overlapping of graphical visualizations/graphs obtained in series through this code in R:

dev.off()

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize p224r63_2011 after having been processed through the previous iterative cycle of functions:

plotRGB(resampledp224r63_2011rpca$map, r=1, g=2, b=3, stretch="Lin")

#Sequence of informatic commands for R_code_multivariate_analysis.r

install.packages("raster")

install.packages("RStoolbox")

library(raster)

library(RStoolbox)

p224r63_2011 <- brick("p224r63_2011_masked.grd")

p224r63_2011

pairs(p224r63_2011)

resampledp224r63_2011 <- aggregate(p224r63_2011, fact=10)

resampledp224r63_2011

par(mfrow=c(2,1))

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")

plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

resampledp224r63_2011rpca <- rasterPCA(resampledp224r63_2011)

resampledp224r63_2011rpca

summary(p224r63_2011res_pca$model)

plot(resampledp224r63_2011rpca$map)

dev.off()

plotRGB(resampledp224r63_2011rpca$map, r=1, g=2, b=3, stretch="Lin")
