#The deforestation in the dry tropical forests of Mato Grosso (NT0140) and the correlation with the increase in coverage to an agricultural one in Brazil 🏞️↪️🌾

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

#In the above classification, being interested in the phenomenon of deforestation, I created the two same classes of defor1 in the unsuperClass () function using the nClasses argument: the first for the 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 (near-infrared or NIR band displayed through the red channel R) and the second for agricultural land (other bands displayed through the G and B channels)

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

#To estimate the coverage of dry forests in the state of Mato Grosso and the coverage of agriculture land and how their progress/regression ratio has evolved, I use the freq() function to get the number of pixels that belong to the previous classes selected in the unsuperClass() function at the 101st and 136th code strings: D1c <- unsuperClass (defor1, nClass=2) and D2c <- unsuperClass (defor2, nClass =2) respectively

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

#The total number of pixels in Dc1$map is obtained as the sum of the number of pixels for each previously identified class, which in this code are 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 and 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳:

s1 <- 306374 + 34918

#In R, to visualize information of s1, name of it followed by Enter ↵ as physical command by keyboard:

s1

#The relatively s1 information is contained within the string:

[1] 341292

#The total number of pixels in Dc2$map is obtained as the sum of the number of pixels for each previously identified class, which in this code are 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 and 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳:

s2 <- 178490 + 164236

#In R, to visualize information of s2, name of it followed by Enter ↵ as physical command by keyboard:

s2

#The relatively s2 information is contained within the string:

[1] 342726

#From the number of pixels that belong to the 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 and 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳 classes respectively, how is it possible to have a percentage of the actual coverage in the state of Mato Grosso?

#Initially, the ratio between freq (D1c $ map) and s1 is to be calculated as shown in the string below:

prop1 <-freq(D1c$map)/ s1

#In R, to visualize information of prop1, name of it followed by Enter ↵ as physical command by keyboard:

prop1 

#The relatively prop1 information is contained within the table:

           value     count
[1,] 5.860085e-06 0.8965314  𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 
[2,] 2.930042e-06 0.1034686 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳

#Initially, the ratio between freq (D1c $ map) and s1 is to be calculated as shown in the string below:

prop2 <-freq(D2c$map)/ s2

#In R, to visualize information of prop2, name of it followed by Enter ↵ as physical command by keyboard:

prop2

#The relatively prop2 information is contained within the table:

         value    count
[1,] 2.917783e-06 0.520795  𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵
[2,] 5.835565e-06 0.479205 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳

#The previous series of commands had the purpose of obtaining prop1 and prop2 and verify their values which, with a simple multiplication * 100, will give the user the effective coverage of the 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 and 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳 respectively:

percent_1992 <- c(89.65, 10.34)

percent_2016 <- c(52.07, 47.92)

#The percentage values for the 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 and 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳 classes can be organized with the cover () function as categorical variables in the first column of a dataframe that will be constructed progressively:

cover <- c("Forest", "Agriculture")

#The dataframe, in addition to the column previously created with the name of cover, will consist of two other columns percent_1992 and percent_2016. In these the percentages of 89.83 and 52.18 for the 𝘈𝘮𝘢𝘻𝘰𝘯 𝘍𝘰𝘳𝘦𝘴𝘵 class and 10.16 and 47.81 for the 𝘈𝘨𝘳𝘪𝘤𝘶𝘭𝘵𝘶𝘳𝘦/𝘖𝘵𝘩𝘦𝘳 class will be visible and the final structure of the dataframe

#The function data.frame() creates data frames, tightly coupled collections of variables which share many of the properties of matrices and of lists, used as the fundamental data structure by most of R's modeling software:

losspercentages <- data.frame(cover, percent_1992, percent_2016)

#In R, to visualize the dataframe of losspercentages, name of it followed by Enter ↵ as physical command by keyboard:

losspercentages

#The relatively losspercentages information is contained within the dataframe:

cover percent_1992 percent_2016
1      Forest        89.65        52.07
2 Agriculture        10.34        47.92

#Which is the basic syntax of ggplot() function?

#The basic syntax of ggplot() function is: ggplot(data = specifies the dataframe you want to plot, aes(x= , y= how we are mapping variables from data to visual elements)) + geom_point(specifies what we want to draw)

#The graph that I have selected is a bar graph through the function geom_bar () and ggplot () which function allows me to graphically display the data that I have so far analyzed in the code:

ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")

ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")

#arrangeGrob set up a gtable layout to place multiple grobs on a page. In particular grid.arrange() draw on the current device and is useful to organize ggRGB elements after simply renamed them:

ggD1 <- ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")

ggD2 <- ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")

grid.arrange(ggD1, ggD2, nrow=1)

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

freq(D1c$map)

freq(D2c$map)

s1 <- 306374 + 34918

s1

s2 <- 178490 + 164236

s2

prop1 <-freq(D1c$map)/ s1

prop1 

prop2 <-freq(D2c$map)/ s2

prop2

percent_1992 <- c(89.65, 10.34)

percent_2016 <- c(52.07, 47.92)

cover <- c("Forest", "Agriculture")

losspercentages <- data.frame(cover, percent_1992, percent_2016)

losspercentages

ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")

ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")

ggD1 <- ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")

ggD2 <- ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")

grid.arrange(ggD1, ggD2, nrow=1)


