#The evolution of vegetation on lahars and debris flows: the case of Mount Saint Helens' eruption in 1980 🌋🌱

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is raster through which is possible reading, writing, manipulating, analyzing and modeling of spatial data. The package implements basic and high-level functions for raster data and for vector data operations such as intersections:

install.packages("raster")

#The second package to install is Rcpp that provides R functions as well as C++ classes which offer a seamless integration of R and C++. Many R data types and objects can be mapped back and forth to C++ equivalents which facilitates both writing of new code as well as easier integration of third-party libraries:

install.packages("Rcpp")

#The third package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#The fourth package to install is rasterVis, a whole of Methods for enhanced visualization and interaction with raster data. It implements visualization methods for quantitative data and categorical data, both for univariate and multivariate rasters. It also provides methods to display spatiotemporal rasters, and vector fields:

install.packages("rasterVis")

#The rasterVis package installation incorporates preexisting lattice and latticeExtra packages: lattice is a powerful and elegant high-level data visualization system inspired by Trellis graphics, with an emphasis on multivariate data while latticeExtra provides several new high-level functions and methods to lattice itself  

#The fifth package to install is RColorBrewer providing color schemes for maps (and other graphics) designed by Cynthia Brewer as described at http://colorbrewer2.org:

install.packages("RColorBrewer")

#The sixth package to install is viridis, a whole of color maps designed to improve graph readability for readers with common forms of color blindness and/or color vision deficiency. The color maps are also perceptually-uniform, both in regular form and also when converted to black-and-white for printing. This package also contains 'ggplot2' bindings for discrete and continuous color and fill scales

install.packages("viridis")

#The seventh package to install is ggplot2, which is a system for declaratively creating graphics, based on "The Grammar of Graphics". The user provides the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details:

install.packages("ggplot2")

#The eighth package to install is gridExtra, which provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables: 

install.packages("gridExtra")

#library () is a function which load and attach add-on packages, in this case the previous packages listed before run R_code_exam_final.r:

library(raster)

library(RStoolbox)

library(rasterVis)

library(RColorBrewer)

library(viridis)

library(ggplot2)

library(gridExtra)

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/mountsainthelens")

#Initially I exploit a function (rlist) through which I create a list of data, files or objects based on the matching of their names with a key regular expression selected by the user:

mountsainthelenssubfolderlist <- list.files(pattern="MSHanalysis_")

#Since the number of my objects is limited, I could have the tif format as a pattern in the rlist function. This user choice is not recommended because the tif format is common and widespread so my choice will be the lst pattern indicating in each raster what represents in particular (land surface temperature)

#In R, to visualize information of mountsainthelenssubfolderlist, name of it followed by Enter ↵ as physical command by keyboard:

mountsainthelenssubfolderlist

#The relatively snowcover2021 information is contained within the table:

[1] "MSHanalysis_87.jpg" "MSHanalysis_90.jpg" "MSHanalysis_93.jpg"
[4] "MSHanalysis_96.jpg"

#After the creation of the list greenlandsubfolderlist consisting of MSHanalysis_87, MSHanalysis_90, MSHanalysis_93 and MSHanalysis_96, how to import it by applying the raster function globally?

#I exploit a function (lapply) which apply a selected function by the user in R over a list

mountsainthelensimportedr <- lapply(mountsainthelenssubfolderlist,raster)

#The display of the information of MSHanalysis_87, MSHanalysis_90, MSHanalysis_93 and MSHanalysis_96 is done simply by pressing ↵ Enter after I have digitized mountsainthelensimportedr where the rasters are listed with numbers between square brackets from [1] to [4]

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

#The last operation will be to merge the raster layer objects MSHanalysis_87, MSHanalysis_90, MSHanalysis_93 and MSHanalysis_96 - contained in the mountsainthelensimportedr list imported into R - into a multi-layer raster object whose name I have chosen will be TCSMSH through a new function called stack:

#I exploit the (stack) function that stack or unstack vectors from a data frame or list generated by the user beforehand

TCSMSH <- stack(mountsainthelensimportedr)

#Without exploiting the plot function singularly on each raster layer object and organizing the same raster layer objects in a prearrenged multiframe through the par function, the iterative cycle of the rlist, lapply and stack functions guarantees to any user the exploitation of plot function directly on the multilevel raster object as the one created in the 139th string of this code!

plot(TCSMSH)

#For a graphical visualization of the variation in the vegetation cover on the volcanic landslide of Mount Saint Helens over time, it is possible to exploit another plot function that for the TCSMSH multi-layer raster object pools a legend for the reflectance values at MSHanalysis_87, MSHanalysis_90, MSHanalysis_93 and MSHanalysis_96?

#I exploit a function (levelplot) to draw level plots and contour plots

levelplot(TCSMSH)

#And if I wanted to apply the levelplot function to the single TCSG layer represented by my choice among the raster layer objects MSHanalysis_87, MSHanalysis_90, MSHanalysis_93 and MSHanalysis_96?

#I exploit a function ($) to extract, from the initial (plot)¹ of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

levelplot(TCSMSH$MSHanalysis_87)

levelplot(TCSMSH$MSHanalysis_90)

levelplot(TCSMSH$MSHanalysis_93)

levelplot(TCSMSH$MSHanalysis_96)

#The graphical display of TCSMSH through levelplot function can be embellished by integrating the syntax of the function with the arguments to specify what is the user's need in the analysis of the vegetation cover on the volcanic landslide of Mount Saint Helens

#In my case I need to apply a new color palette for the correct interpretation of the reflectance values, change the name of the layers / raster objects of the layer and put a title on the graph itself

#The name of the layers / raster objects of the layer can be selected by the user at his discretion with the argument names.attr = c inside the levelplot () function and I select for levelplot (TCSMSH) the years in which they have been acquired satellite images of Mount Saint Helens:

levelplot(TCSMSH, names.attr=c("1987","1990", "1993","1996"))

#The final graphic display obtained through the levelplot () function can be accompanied by a selected title that the user will indicate with the main argument within the same function and for levelplot (TCSMSH) is commendable the expression "Variation of coverage plant on the volcanic landslide of Monte Sant'Elena over time ":

levelplot(TCSMSH, main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1987","1990", "1993","1996"))

#For the correct interpretation of the reflectance values in levelplot (TCSMSH), initially I visualize it with a col.regions argument expressing a grayscale (0: 100/100):

levelplot(TCSMSH, col.regions=gray(0:100/100))

#The name of the layers / raster objects of the layer can be selected by the user at his discretion with the argument names.attr = c inside the levelplot () function and I select for levelplot (TCSMSH) the years in which they have been acquired satellite images of Mount Saint Helens:

levelplot(TCSMSH,col.regions=gray(0:100/100), names.attr=c("1987","1990", "1993","1996"))

#The final graphic display obtained through the levelplot () function can be accompanied by a selected title that the user will indicate with the main argument within the same function and for levelplot (TCSMSH) is commendable the expression "Variation of coverage plant on the volcanic landslide of Monte Sant'Elena over time ":

levelplot(TCSMSH,col.regions=gray(0:100/100), main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1987","1990", "1993","1996"))

# Subsequently, a color palette must be selected - always for the correct interpretation of the reflectance values in levelplot (TCSMSH) - among those contained in the RColorBrewer package and viewable with the simple command of the underlying code string or at the website https: // www.r-graph-gallery.com/38-rcolorbrewers-palettes.html:

display.brewer.all()

#brewer.pal() function makes the color palettes from ColorBrewer available as R palettes after the user has indicated the acronym in inverted commas ("") and the desired number of colors:

MSHYlOrBrcolorspalette <- brewer.pal(9, "YlOrBr")

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

# Subsequently, a color palette must be selected - always for the correct interpretation of the reflectance values in levelplot (TCSMSH) - among those contained in the RColorBrewer package and viewable with the simple command of the underlying code string or at the website https: // www.r-graph-gallery.com/38-rcolorbrewers-palettes.html:

#MSHYlOrBrcolorspalette from ColorBrewer is available as R palette for the power relationships between the brewer.pal () and colorRampPalette () functions:

pal <- colorRampPalette(MSHYlOrBrcolorspalette)

#For the correct interpretation of the reflectance values in levelplot (TCSMSH), finally I visualize it with a col.regions argument expressing a YlOrBr colourscale:

levelplot(TCSMSH,col.regions=pal)

#The name of the layers / raster objects of the layer can be selected by the user at his discretion with the argument names.attr = c inside the levelplot () function and I select for levelplot (TCSMSH) the years in which they have been acquired satellite images of Mount Saint Helens:

levelplot(TCSMSH,col.regions=pal, names.attr=c("1987","1990", "1993","1996"))

#The final graphic display obtained through the levelplot () function can be accompanied by a selected title that the user will indicate with the main argument within the same function and for levelplot (TCSMSH) is commendable the expression "Variation of coverage plant on the volcanic landslide of Monte Sant'Elena over time ":

levelplot(TCSMSH,col.regions=pal, main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1987","1990", "1993","1996"))

#I exploit a function dev.off() to end a graphical display depending on the R's (plot) function and if it is syntactically correct, the user will see this message appears: null device 1

dev.off()

#The study by remote sensing of the vegetation covering on the volcanic landslide of Mount Saint Helens over time after its eruption is based on vegetation indices (VIs)

#What is a vegetation index (VI)?

#A vegetation index (VI) is a measure of vegetation properties calculated by the amount of solar radiation reflected in the optical spectrum

#The spectral signature of healthy vegetation depends on the higher reflectance values of 0,7 to 1,1 µm in the near infrared (NIR) region than in the visible region due to the cellular structure of the leaves - in particular the spongy mesophyll - where almost all of the light is absorbed by photosynthetic pigments. Chlorophyll intensely absorbs energy in the blue and red wavelengths from 0,4 a 0,7 µm, reflecting in the green wavelength instead. Finally, the reflectance in the short wave infrared (SWIR) wavelengths is related to the water content of the vegetation with absorption bands around 1.45, 1.95 and 2.50 µm. Outside of these absorption bands, leaf reflectance generally increases as the water content in the leaf decreases!

#DVI (D͟ifference V͟egetation I͟ndex) is the simplest vegetation index calculated as the difference between the near-infrared and red values: DVI = NIR - R

#Identically to the R_remote_code_sensing_first.r, I still exploit a function to import data from lab folder - external - to R - internal - and this will be brick and not raster because our data does not represent raster layer objects but multi-layer raster objects:

disruptedvegetation <- brick("MSHanalysis_87.jpg")

newlyvegetation <- brick("MSHanalysis_96.jpg")

#Important: MSHanalysis_87.jpg and MSHanalysis_96.jpg are imported in R because they represent the opening and closing satellite images respectively of the multitemporal/time series analysis conducted on Mount Saint Helens

#With the function (par) there is the possibility of combining in this case multiple levels of "interest" belonging to different objects in their series into one graphical visualization of their called multiframe

par(mfrow=c(1,2))

plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin")

plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="his")

#In this code, the purpose of the previous par () function is to graphically display the set of differences between the plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="lin") and plotRGB(disruptedvegetation, r=1, g=2, b=3, stretch="his") depending on the type of stretch

#Type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize disruptedvegetation in true colors

#With the function (par) there is the possibility of combining in this case multiple levels of "interest" belonging to different objects in their series into one graphical visualization of their called multiframe

par(mfrow=c(1,2))

plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")

plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="his")

#In this code, the purpose of the previous par () function is to graphically display the set of differences between the plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="lin")and plotRGB(newlyvegetation, r=1, g=2, b=3, stretch="his") depending on the type of stretch

#Type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize newlyvegetation in true colors

#In addition to the DVI and NDVI vegetational indices there are other spectral indices for which a preview is available through the spectralIndices () function applicable to both disruptedvegetation and newlyvegetation:

disruptedvegetationvi <- spectralIndices(disruptedvegetation, green=3, red=2, nir=1)

#spectralIndices() function calculates all indices in one go in C++, which is more efficient than calculating each index separately. By default all indices which can be calculated given the specified indices will be calculated. If you don't want all indices, use the indices argument to specify exactly which indices are to be calculated!

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize disruptedvegetationvi through all the spectral indices contained in the code table R_code_vegetation_indices.r:

plot(disruptedvegetationvi)

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

#plot(disruptedvegetationvi) is reformulated by incorporating the previous colors palette of colors MSHDVIcolorspalette: plot(disruptedvegetationvi, col=MSHDVIcolorspalette) will display graphically reflectance's values in a darkblue, cyan, forestgreen, chartreuse2, saddlebrown, brown, black colour scale:

plot(disruptedvegetationvi, col=MSHDVIcolorspalette)

#In addition to the DVI and NDVI vegetational indices there are other spectral indices for which a preview is available through the spectralIndices () function applicable to both disruptedvegetation and newlyvegetation:

newlyvegetationvi <- spectralIndices(newlyvegetation, green=3, red=2, nir=1)

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize newlyvegetationvi through all the spectral indices contained in the code table R_code_vegetation_indices.r:

plot(newlyvegetationvi)

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

#plot(newlyvegetationvi) is reformulated by incorporating the previous colors palette of colors MSHDVIcolorspalette: plot(newlyvegetationvi, col=MSHDVIcolorspalette) will display graphically reflectance's values in a darkblue, cyan, forestgreen, chartreuse2, saddlebrown, brown, black colour scale:

plot(newlyvegetationvi, col=MSHDVIcolorspalette)

#The name/s attributed to the spectral band/s is to be found in the summary of its informations under the 𝘯𝘢𝘮𝘦𝘴 category

#How to visualize informations of disruptedvegetation in R? 

#In R, to visualize information of disruptedvegetation, name of it followed by Enter ↵ as physical command by keyboard:

disruptedvegetation

#The relatively disruptedvegetation information is contained within the table:

class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87.1, MSHanalysis_87.2, MSHanalysis_87.3 
min values :                0,                0,                0 
max values :              255,              255,              255

#The satellite bands of interest in disruptedvegetation to me are MSHanalysis_87.1 and MSHanalysis_87.2 as red (R) band B1 and near-infrared (NIR) band B2 respectively

#If the user requires R's function plot(defor1) it will graphically display the reflectance values for the previous spectral bands?

#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my defor1's levels of "interest" are two set of data which will be graphically visualized in their functional whole being as the spectral bands MSHanalysis_87.1 and MSHanalysis_87.2?

#Final syntaxis' function in Windows for red (R) band B1 is: disruptedvegetation$MSHanalysis_87.1

#In R, visualizing informations of defor1$defor1.1, name of it followed by Enter as physical command by keyboard ↵:

disruptedvegetation$MSHanalysis_87.1

#The relatively disruptedvegetation$MSHanalysis_87.1 information is contained within the table:

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87.1 
values     : 0, 255  (min, max)

#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: disruptedvegetation$MSHanalysis_87.2

#In R, visualizing informations of disruptedvegetation$MSHanalysis_87.2, name of it followed by Enter as physical command by keyboard ↵:

disruptedvegetation$MSHanalysis_87.2

#The relatively disruptedvegetation$MSHanalysis_87.2 information is contained within the table:

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_87.jpg 
names      : MSHanalysis_87.2 
values     : 0, 255  (min, max)

#With plot(disruptedvegetation$MSHanalysis_87.1) the user graphically will visualize the spectral band B1_sre:red stand-alone in its reflectance's values which colorscale is ax expected by default in R itself

plot(disruptedvegetation$MSHanalysis_87.1)

#With plot(disruptedvegetation$MSHanalysis_87.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(disruptedvegetation$MSHanalysis_87.2)

#I exploit a function dev.off() to end a graphical display depending on the R's (plot) function and if it is syntactically correct, the user will see this message appears: null device 1

dev.off()

#For each disruptedvegetation pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!

#The calculation of the DVI index is according to the formula a difference between disruptedvegetation$MSHanalysis_87.1 and disruptedvegetation$MSHanalysis_87.2 to represent for each pixel - which constitutes the original image - the reflectance value as the difference between those associated with the NIR and R bands!

disruptedvegetationdvi <- disruptedvegetation$MSHanalysis_87.1 - disruptedvegetation$MSHanalysis_87.2

#How to graphically visualize the state of health for the vegetation on the volcano landslide of Mount Saint Helens from raster multi-layer raster object disruptedvegetation? 

#I exploit a function (plot) to obtain visually the vegetation's state of health

plot(disruptedvegetationdvi)

#In R function plot(disruptedvegetationdvi) lead me to a window with the state of health of the vegetation on the volcano landslide of Mount Saint Helens through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/disruptedvegetation$MSHanalysis_87.1 to B2/disruptedvegetation$MSHanalysis_87.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#with what has been described so far, I create a futher new palette of colors MSHDVIcolorspalette in which first, second, third and last color will be darkblue, cyan, forestgreen, chartreuse2, saddlebrown, brown and black respectively with number's value of depth levels taken to 100!

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

#plot(disruptedvegetationdvi) must be reformulated by incorporating new palette of colors MSHDVIcolorspalette: plot(disruptedvegetationdvi, col=MSHDVIcolorspalette) will display graphically reflectance's values in a darkblue, cyan, forestgreen, chartreuse2, saddlebrown, brown and black colour scale:

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette)

#plot(disruptedvegetationdvi) must be reformulated by incorporating also the main argument to contextualize the graphical visualization with the title of DVI of disrupted vegetation in 1987:

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI of disrupted vegetation in 1987")

#The iterative cycle of functions started in the 305th string of code for the study by remote sensing of the vegetation covering on the volcanic landslide of Mount Saint Helens over time after its eruption based on D͟ifference V͟egetation I͟ndex (DVI) is also to be applied to newlyvegetation:

#The name/s attributed to the spectral band/s is to be found in the summary of its informations under the 𝘯𝘢𝘮𝘦𝘴 category

#How to visualize informations of newlyvegetation in R? 

#In R, to visualize information of newlyvegetation, name of it followed by Enter ↵ as physical command by keyboard:

newlyvegetation

#The relatively newlyvegetation information is contained within the table:

class      : RasterBrick 
dimensions : 2083, 2054, 4278482, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96.1, MSHanalysis_96.2, MSHanalysis_96.3 
min values :                0,                0,                0 
max values :              255,              255,              255 

#The satellite bands of interest in disruptedvegetation to me are MSHanalysis_96.1 and MSHanalysis_96.2 as red (R) band B1 and near-infrared (NIR) band B2 respectively

#If the user requires R's function plot(newlyvegetation) it will graphically display the reflectance values for the previous spectral bands?

#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my defor1's levels of "interest" are two set of data which will be graphically visualized in their functional whole being as the spectral bands MSHanalysis_87.1 and MSHanalysis_87.2?

#Final syntaxis' function in Windows for red (R) band B1 is: newlyvegetation$MSHanalysis_96.1

#In R, visualizing informations of defor1$defor1.1, name of it followed by Enter as physical command by keyboard ↵:

newlyvegetation$MSHanalysis_96.1

#The relatively newlyvegetation$MSHanalysis_96.1 information is contained within the table:

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96.1 
values     : 0, 255  (min, max)

#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: newlyvegetation$MSHanalysis_96.2

#In R, visualizing informations of newlyvegetation$MSHanalysis_96.2, name of it followed by Enter as physical command by keyboard ↵:

newlyvegetation$MSHanalysis_96.2

#The relatively newlyvegetation$MSHanalysis_96.2 information is contained within the table:

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : MSHanalysis_96.jpg 
names      : MSHanalysis_96.2 
values     : 0, 255  (min, max)

#With plot(newlyvegetation$MSHanalysis_96.1) the user graphically will visualize the spectral band B1_sre:red stand-alone in its reflectance's values which colorscale is ax expected by default in R itself

plot(newlyvegetation$MSHanalysis_96.1)

#With plot(newlyvegetation$MSHanalysis_96.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone in its reflectance's values which colorscale is ax expected by default in R itself

plot(newlyvegetation$MSHanalysis_96.2)

#I exploit a function dev.off() to end a graphical display depending on the R's (plot) function and if it is syntactically correct, the user will see this message appears: null device 1

dev.off()

#For each newlyvegetation pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!

#The calculation of the DVI index is according to the formula a difference between newlyvegetation$MSHanalysis_96.1 and newlyvegetation$MSHanalysis_96.2 to represent for each pixel - which constitutes the original image - the reflectance value as the difference between those associated with the NIR and R bands!

newlyvegetationdvi <- newlyvegetation$MSHanalysis_96.1 - newlyvegetation$MSHanalysis_96.2

#How to graphically visualize the state of health for the vegetation on the volcano landslide of Mount Saint Helens from raster multi-layer raster object newlyvegetation? 

#I exploit a function (plot) to obtain visually the vegetation's state of health

plot(newlyvegetationdvi)

#In R function plot(newlyvegetationdvi) lead me to a window with the state of health of the vegetation on the volcano landslide of Mount Saint Helens through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/newlyvegetation$MSHanalysis_96.1 to B2/newlyvegetation$MSHanalysis_96.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#with what has been described so far, I create a futher new palette of colors MSHDVIcolorspalette in which first, second, third and last color will be darkblue, cyan, forestgreen, chartreuse2, saddlebrown, brown and black respectively with number's value of depth levels taken to 100!

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

#plotplot(newlyvegetationdvi) must be reformulated by incorporating new palette of colors MSHDVIcolorspalette: plot(newlyvegetationdvi, col=MSHDVIcolorspalette will display graphically reflectance's values in a darkblue, cyan, forestgreen, chartreuse2, saddlebrown, brown and black colour scale:

#plot(disruptedvegetationdvi) must be reformulated by incorporating also the main argument to contextualize the graphical visualization with the title of DVI of newly vegetation in 1996:

plot(newlyvegetationdvi, col=MSHDVIcolorspalette , main="DVI of newly vegetation in 1996")

#With the function (par) there is the possibility of combining in this case multiple levels of "interest" belonging to different objects in their series into one graphical visualization of their called multiframe

par(mfcol=c(1,2))

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI of disrupted vegetation in 1987")

plot(newlyvegetationdvi, col=MSHDVIcolorspalette, main="DVI of newly vegetation in 1996")

#The plot of disruptedvegetationdvi and newlyvegetationdvi through the par () function shows the evolution in the state of health in the vegetation cover on the volcanic landslide of Mount Saint Helens according to the initial interpretation in this code

#This evolution in the state of health in the vegetation cover on the volcanic landslide of Mount Saint Helens can be graphically displayed in the time difference between disruptedvegetationdvi and newlyvegetationdvi using the plot () function:

multitemporaldvi <- disruptedvegetationdvi - newlyvegetationdvi

#In R, visualizing informations of multitemporaldvi, name of it followed by Enter as physical command by keyboard ↵:

multitemporaldvi

#The relatively multitemporaldvi information is contained within the table:

class      : RasterLayer 
dimensions : 2083, 2054, 4278482  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 2054, 0, 2083  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : memory
names      : layer 
values     : -108, 80  (min, max)

#How to graphically visualize evolution in the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object multitemporaldvi? 

#I exploit a function (plot) to obtain visually the evolution in vegetation's state of health

plot(multitemporaldvi)

#In R function plot (multitemporaldvi) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands


#

plot(multitemporaldvi, col=MSHDVIcolorspalette) 

#

plot(multitemporaldvi, col=MSHDVIcolorspalette, main="DVI of Mount Saint Helens' vegetation from 1987 to 1996")

#NDVI (N͟ormalized D͟ifference V͟egetation I͟ndex) is another vegetation index calculated as the ratio between the difference (-) and the sum (+) of the near-infrared and red values respectively to the numerator and denominators: #Attention: some software works sequentially without performing a calculation according to a mathematical logic. Hint, round, square and curly brackets!

#NDVI values range from -1 to 1

#The application of the formula for the calculation of NDVI in defor1 strictly depends on the values in the bands disruptedvegetation$MSHanalysis_87.1 for the red (RED) and disruptedvegetation$MSHanalysis_87.2 for the near-infrared (NIR):

disruptedvegetationndvi <- (disruptedvegetationdvi) / (disruptedvegetation$MSHanalysis_87.1 + disruptedvegetation$MSHanalysis_87.2)

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

MSHNDVIcolorspalette <- colorRampPalette(c("darkorchid2","whitesmoke","turquoise1","springgreen4","wheat1","gold"))(100) 

#plot(disruptedvegetationndvi) is reformulated by incorporating the previous colors palette of colors MSHNDVIcolorspalette: plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette) will display graphically reflectance's values in a darkorchid2, whitesmoke, turquoise1, springgreen4, wheat1, gold colour scale:

plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette)

#Also the application of the formula for the calculation of NDVI in newlyvegetation strictly depends on the values in the bands newlyvegetation$MSHanalysis_96.1 for the red (RED) and newlyvegetation$MSHanalysis_96.2 for the near-infrared (NIR):

newlyvegetationndvi <- (newlyvegetationdvi) / (newlyvegetation$MSHanalysis_96.1 + newlyvegetation$MSHanalysis_96.2)

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

MSHNDVIanothercolorspalette <- colorRampPalette(c("darkorchid2","steelblue1","royalblue1","turquoise1","springgreen4","whitesmoke","wheat1","gold","indianred3","black"))(100)

#plot(newlyvegetationndvi) is reformulated by incorporating the previous colors palette of colors MSHNDVIcolorspalette: plot(newlyvegetationndvi, col=MSHNDVIcolorspalette) will display graphically reflectance's values in a darkorchid2, steelblue1, royalblue1, turquoise1, springgreen4, whitesmoke, wheat1, gold, indianred3, black colour scale:

plot(newlyvegetationndvi, col=MSHNDVIanothercolorspalette)

#With the function (par) there is the possibility of combining in this case multiple levels of "interest" belonging to different objects in their series into one graphical visualization of their called multiframe:

par(mfcol=c(1,2))

plot(disruptedvegetationndvi, col=MSHNDVIcolorspalette, main="NDVI of disrupted vegetation in 1987")

plot(newlyvegetationndvi, col=MSHNDVIanothercolorspalette, main="NDVI of newly vegetation in 1996")

#The plot of disruptedvegetationndvi and newlyvegetationndvi through the par () function shows the evolution in the state of health in the vegetation cover on the volcanic landslide of Mount Saint Helens according to the initial interpretation in this code

#This evolution in the state of health in the vegetation cover on the volcanic landslide of Mount Saint Helens can be graphically displayed in the time difference between disruptedvegetationndvi and newlyvegetationndvi using the plot () function:

multitemporalndvi <- disruptedvegetationndvi - newlyvegetationndvi

#In R, visualizing informations of multitemporalndvi, name of it followed by Enter as physical command by keyboard ↵:

multitemporalndvi

#The relatively multitemporaldvi information is contained within the table:



#How to graphically visualize evolution in the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object difdvi? 

#I exploit a function (plot) to obtain visually the evolution in vegetation's state of health

#Syntaxis' function for Windows is: plot(difdvi)

#In R function plot (dvi2) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

plot(multitemporalndvi, col=MSHNDVIcolorspalette)

#

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

            PC1         PC2         PC3
Min.    -115.81446 -45.9714775 -29.9552517
1st Qu.  -39.48750  -5.3036152  -3.2929425
Median   -19.44636   0.1312364  -0.2737613
3rd Qu.   18.58441   5.4839840   2.9726181
Max.     290.17538  41.7846222  36.7002831
NA's       0.00000   0.0000000   0.0000000

     
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
     
#Sequence of informatic commands for R_code_exam_final.r 
     
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

TCSMSH <- stack(mountsainthelensimportedr)

plot(TCSMSH)

levelplot(TCSMSH$MSHanalysis_87)

levelplot(TCSMSH$MSHanalysis_90)

levelplot(TCSMSH$MSHanalysis_93)

levelplot(TCSMSH$MSHanalysis_96)

levelplot(TCSMSH)

levelplot(TCSMSH, names.attr=c("1987","1990", "1993","1996"))

levelplot(TCSMSH, main="Variation of the vegetation cover on the volcanic landslide of Mount Saint Helens over time", names.attr=c("1987","1990", "1993","1996"))

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

disruptedvegetation$MSHanalysis_87.1

disruptedvegetation$MSHanalysis_87.2

plot(disruptedvegetation$MSHanalysis_87.1)

plot(disruptedvegetation$MSHanalysis_87.2)

dev.off()

disruptedvegetationdvi <- disruptedvegetation$MSHanalysis_87.1 - disruptedvegetation$MSHanalysis_87.2

plot(disruptedvegetationdvi)

MSHDVIcolorspalette <- colorRampPalette(c("darkblue","cyan", "forestgreen","chartreuse2","saddlebrown", "brown","black"))(100)

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette)

plot(disruptedvegetationdvi, col=MSHDVIcolorspalette, main="DVI of disrupted vegetation in 1987")

newlyvegetation

newlyvegetation$MSHanalysis_96.1

newlyvegetation$MSHanalysis_96.2

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
     
plot(multitemporaldvi)
     
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
     
multitemporalndvi

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

            PC1         PC2         PC3
Min.    -115.81446 -45.9714775 -29.9552517
1st Qu.  -39.48750  -5.3036152  -3.2929425
Median   -19.44636   0.1312364  -0.2737613
3rd Qu.   18.58441   5.4839840   2.9726181
Max.     290.17538  41.7846222  36.7002831
NA's       0.00000   0.0000000   0.0000000

     
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
