#R code complete - Remote sensing
#-----------------------------------------------
#Summary:
#----------------------------------------------
#1. R code remote sensing
#2. R time code series
#3. R code Copernicus
#4. R code knitr
#5. R code multivariate analysis
#6. R code classification
#7. R code ggplot2
#8. R code vegetation indices
#9. R code land cover
#10.R code variability
#----------------------------------------------

#1. R code remote sensing

#Title for R's developing code

#My first R code for remote sensing 💁🏻‍♂️💻

#Which folder must R use in the computer?

#In the computer R must use the folder named simply lab

#I exploit a function (setwd) for the association between R and lab folder

#Syntaxis' function for Windows is: setwd(''C:/lab/'')

#In R function setwd(''C:/lab/'') gives an error: unexpected symbol in (''C:/lab/'')

#The correct and unexpected syntaxis' function is: setwd('C:/lab/')

#After the association between R and lab folder, how I import data from lab folder to R?

#I exploit  a function (brick) to import data from lab folder - external - to R - internal* -

#Syntaxis' function for Windows is: renowned object name <- brick('original object name')

#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)* 

#Loading required packages: sp is successful being classes and methods' database provider for spatial data 

#p224r63_2011_masked.grd is imported in R with brick function according to Windows' syntaxis in which: renowned object name = p224r63_2011 and original object name = p224r63_2011_masked.grd

#Final syntaxis' function in Windows is: p224r63_2011 <- brick('p224r63_2011_masked.grd')

#How to visualize informations of p224r63_2011 in R? 

#In R, visualizing informations of an object, name of it followed by Enter as physical command by keyboard

#Syntaxis' function for Windows is: renowned object name ↵ Enter

#Final syntaxis' function in Windows is: p224r63_2011 ↵ Enter

#Important: any object name includes also informations about the number assigned to a sinusoid on space satellite's path (preceded by p letter) and of any parallel (preceded by letter r) that intersected it in a specific reference system: consequently the name of p224r63 object refers to the sinusoid numbered 224 on LANDSAT's path and to Earth's parallel numbered 63 that intersected the former in WGS84 reference system 

#The reference system further analyzed has been extracted from the informations of a generic object as crs in which the user through R can find in order: projection, zone, datum and units

#crs string in p224r63_2011's informations summary is for example: +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 

#If I want to obtain visually spectral bands in p224r63_2011?

#I exploit  a function (plot) to obtain visually spectral bands¹

#Syntaxis' function for Windows is: plot(object)

#In R function plot(p224r63_2011) lead me to a window with spectral bands explainable graphically through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1_SRE to B7_SRE representing each spectral bands

#I exploit  a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter⁴ and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#If I want the aforementioned new palette of colors - which is given the name of bgwcp - represents a greyscale, first and last color will be black and white (B/W) respectively whereas second, third, etc. colors will be greys of which the number of depth levels vary from 4 to 256

#Final syntaxis' function in Windows is: bgwcp <- colorRampPalette(c('black','grey','white'))(100)

#plot(p224r63_2011) must be reformulated by incorporating new palette of colors bgwcp: plot(p224r63_2011, col=bgwcp) will display graphically reflectance's values for each spectral bands in a greyscale

#with what has been described so far, I create a futher new palette of colors called rmpcp in which first, second and last color will be red, magenta and pink respectively with number's value of depth levels taken to the extreme being 1000!

#Final syntaxis' function in Windows is: rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)

#If in the final syntaxis' function for Windows systems is included a color (first, second, ..., last) freely selected by the user but unobtainable through an additive color model which is RGB (color gamut is created from red, green and blue as primary colors) therefore will be displayed the underlying string ↓

#Error in col2rgb(colors, alpha = alpha) : invalid color name 'fuchsia' rmpcp <- colorRampPalette(c('red','magenta','fuchsia','pink'))(1000) where fuchsia in RGB's color gamut doesn't exist being unobtainable through the addition of primary colors!

#Adapted R's function plot(p224r63_2011, col=rmpcp)³ will display graphically reflectance's values for each spectral bands in a colorscale invented starting from scratch by the user

#If the user requires adapted R's function plot(p224r63_2011, col=rmpcp) will display graphically reflectance's values for one of the previous spectral bands (B1:blue, B2:green, B3:red, B4:near-infrared, B5:mid-infrared, B6:far-infrared or B7:other mid-infrared)? 

#I exploit a function dev.off() to end a graphical display depending on the R's (plot) function and if it is syntactically correct, the user will see this message appears: null device 1

#Error in dev.off() : cannot shut down the device 1 (dispositivo null) message appears exclusively when the user has closed manually graphical display's window clicking on the x at the top right

#I exploit a function ($) to extract, from the initial (plot)¹ of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my p224r63_2011's level of ''interest''² is the set of data which will be graphically visualized in their functional whole being as the spectral band B1:blue?

#In progress syntaxis' function in Windows is: plot(p224r63_2011$B1_sre) 

#With plot(p224r63_2011$B1_sre) the user graphically will visualize the spectral band B1_sre:blue stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

#plot is a R's function which syntaxis is in that case implemented with colorRampPalette³ in order that I can freely opt for the palette of colors to foster a clear interpretation of reflectance's values from the spectral band B1_sre:blue in replacement of previous and useless R's default palette of colors

#Extended syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization, col=name of selected colors' palette)

#Final syntaxis' function in Windows is: plot(p224r63_2011$B1_sre, col=rmpcp), where the palette of colors rmpcp is the one I created in the 33rd string

#For the user $ function's relevance in R is manifest at a higher level with the function (par) through which there is the possibility of combining multiple object's level of ''interest'' into one graphical visualization of their called multiframe

#Syntaxis' function for Windows is:par(multiframe, a graphical visualization of multiple object's level of ''interest'' organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array⁴(number of rows or columns required, number of columns or rows required))

#How would I combine the spectral bands B1_sre:blue and B2_sre:green as my p224r63_2011's level of ''interest'' from LANDSAT in a single graphic solution in an understandable multiframe for which par will be R's function of choice?

#Final syntaxis' function in Windows is: par(mfrow=c(1,2)) which has a functional significance if and only followed by plot(p224r63_2011$B1_sre) and plot(p224r63_2011$B2_sre)

#par(mfrow=c(1,2)) and par(mfcol=c(1,2)) syntactically and funtionally are different because the second - compared to the first one - will combine the spectral bands B1_sre:blue and B2_sre:green as my p224r63_2011's level of ''interest'' from LANDSAT in a single graphic visualization solution organizing them by one column and two rows in the required multiframe

#Which could be the final syntaxis' function in Windows if LANDSAT spectral bands of interest to us or to researchers will be B1_sre:blue, B2_sre:green, B3_sre:red and B4_sre:near-infrared (4/7)?

#Along the lines of what was suggested to visualize in a single graphic solution the first two of them through R's par function in multiframe, the final syntaxis' function in Windows will be: par(mfrow=c(4,1)) followed by plot(p224r63_2011$B1_sre), plot(p224r63_2011$B2_sre), plot(p224r63_2011$B3_sre) and plot(p224r63_2011$B4_sre)

#Being the previously selected spectral bands of LANDSAT in even number, the best graphical visualization of B1_sre:blue, B2_sre:green, B3_sre:red and B4_sre:near-infrared is in a two rows x two columns multiframe square generated in a new window starting from an adapted R's function: par(mfrow=c(2,2)) followed by plot(p224r63_2011$B1_sre), plot(p224r63_2011$B2_sre), plot(p224r63_2011$B3_sre) and plot(p224r63_2011$B4_sre)

#plot(p224r63_2011$B1_sre), plot(p224r63_2011$B2_sre), plot(p224r63_2011$B3_sre) and plot(p224r63_2011$B4_sre) should be reformulated by incorporating new palette of colors for reflectance's values in accordance with regions of the electromagnetic spectrum of each bands from B1_sre to B7_sre detectable by LANDSAT satellites

#The aforementioned new palette of colors for reflectance's values in accordance with regions of the electromagnetic spectrum of each bands from B1_sre to B7_sre detectable by LANDSAT satellites through ColorRampPalette are: dbbcfbcp <- colorRampPalette(c("darkblue","blue","cornflowerblue")) (100), ag3sg2sgcp <- colorRampPalette(c("springgreen3","springgreen2","springgreen1")) (100), r4r3r2cp <- colorRampPalette(c("red4","red3","red2")) (100) and do4or1ocp <- colorRampPalette(c("darkorange4","orangered1","orange")) (100)

#Final syntaxis' function in Windows is: par(mfrow=c(2,2)) dbbcfbcp <- colorRampPalette(c("darkblue","blue","cornflowerblue")) followed by (100) plot(p224r63_2011$B1_sre, col=dbbcfbcp), ag3sg2sgcp <- colorRampPalette(c("springgreen3","springgreen2","springgreen1")) (100) followed by plot(p224r63_2011$B2_sre, col=ag3sg2sgcp), r4r3r2cp <- colorRampPalette(c("red4","red3","red2")) (100) followed by plot(p224r63_2011$B2_sre, col=r4r3r2cp) and do4or1ocp <- colorRampPalette(c("darkorange4","orangered1","orange")) (100) followed by plot(p224r63_2011$B4_sre, col=do4or1ocp)

#The graphical visualization of p224r63_2011 in true colors, being LANDSAT equipped with true colour, thermal and multispectral sensors in a complex acquisition system, will be obtained from the visible spectrum to which I associate B1_sre:blue, B2_sre:green, B3_sre:red spectral bands of the initial object

#This graphical visualization in true colors is therefore in RGB and independent from user's selection of a palette of colors through colorRampPalette function because the three levels of interest selected by the user herself/himself from B1_sre to B7_sre are combined such that they represent exclusively the red⁵, green⁶ and blue⁷ channel in true colour sensors of LANDSAT satellite

#Syntax's function for Windows is: plotRGB(renowned object name, r= number of selected spectral band which will be graphically visualized through red channel, g= number of selected spectral band which will be graphically visualized through green channel, b= number of selected spectral band which will be graphically visualized through blue channel,type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!

#Final syntaxis' function in Windows is: plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')

#The graphical visualization of p224r63_2011 in false color, not being the human eye thermal and multispectral sensors in a biological complex acquisition system, will be obtained by substituting B1_sre:blue spectral band with B4_sre:near-infrared, B5_sre:mid-infrared, B6_sre:far-infrared or B7_sre:other mid-infrared spectral bands on a case by case basis in remote sensing analysis

#For example in the graphical visualization of p224r63_2011 in true colors vegetational coverage of the Amazon rainforest isn't appreciable through this remote sensing analysis because the maximum reflectance's value for leaves is to be found in near-infrared region of the electromagnetic spectrum. The graphical visualization of p224r63_2011 in false color based on B4:near-infrared spectral band allows the user to appreciate through this new and adapted remote sensing analysis the vegetational coverage of the Amazon rainforest

#Final syntaxis' function in Windows is: plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin') if the graphical visualization of p224r63_2011 in false color for vegetational coverage of the Amazon rainforest is through the red channel⁵

#Final syntaxis' function in Windows is: plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin') if the graphical visualization of p224r63_2011 in false color for vegetational coverage of the Amazon rainforest is through the green channel⁶

#Final syntaxis' function in Windows is: plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin') if the graphical visualization of p224r63_2011 in false color for vegetational coverage of the Amazon rainforest is through the blue channel⁷

#Through par function the user will be able to combine the four doable graphical visualizations of p224r63_2011 in true and false colors for vegetational coverage of the Amazon rainforest in a two rows x two columns multiframe square as described in the 55th string

#Final syntaxis' function in Windows is: par(mfrow=c(2,2)) followed by plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin'), plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin'),plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin') and plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')

#I exploit a function (pdf) to produce PDF graphics

#Syntax's function for Windows is: pdf('name of the future PDF graphic.pdf')

#Final syntaxis' function in Windows is: pdf('RGBAmazonRainforest.pdf'), par(mfrow=c(2,2)) followed by plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin'), plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin'), plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin') and plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin') at the end dev.off() for graphics cleaning

#Another final syntaxis' for plotRGB function in Windows could be: plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist') if the graphical visualization of p224r63_2011 in false color for vegetational coverage of the Amazon rainforest was through the green channel⁶ and the type of stretch for reflectance's values in order that its graphical visualization was optimal in histogram

#How the graphical visualization of p224r63_2011 in false color will be for vegetational coverage of the Amazon rainforest through the green channel⁶ and if the type of stretch for reflectance's values in order that its graphical visualization is optimal in histogram?

#Through par function I will be able to combine the graphical visualization of p224r63_2011 in true colors, in false color through the green channel in a plotRGB where the selected stretch is L̲i̲n̲ear and in false color through the green channel in a plotRGB where on the contrary selected stretch is hi̲s̲t̲ogram organizing them by three rows and one column in a intriguing multiframe

#Final syntaxis' function in Windows is: par(mfrow=c(3,1)) followed by plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin'), plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin') and plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist')

#The final conclusion from an accurate comparison of previous p224r63_2011 graphical and multiframe visualizations of vegetational coverage localized in the Amazon rainforest trough three different plotRGB is that with the last plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist') will be visible also its river basin/catchment basin made up of springs, rivers, lakes and swamps!

#So far it would seem to exist a single example of the LANDSAT space satellite when instead, being a joint space program of NASA and USGS, there have been 8 satellites with this name from the first launch on 6 January 1978 for LANDSAT 1 up to arrive at LANDSAT 8 launched on 11 February 2013. Continuity in collecting data by remote sensing is essential to study the evolution of the environment, resources and the natural and man-made changes that have occurred on the earth's surface!

#In R I can import an image of the vegetation cover for the Amazon forest that is antecedent to that of 2011 (this is possible due to the continuity in LANDSAT joint space program of NASA and USGS just mentioned in the string above ↑) and analyze whether there has been an expansion or reduction of it depending on the anthropic activities in Brazil

#As in the beginning, I exploit setwd function for the association between R and lab folder

#Syntaxis' function for Windows is: setwd('C:/lab/')

#After the association between R and lab folder, how I import data from lab folder to R?

#I exploit a function (brick) to import data from lab folder - external - to R - internal*-

#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)* 

#Loading required packages: sp is successful being classes and methods' database provider for spatial data name of the package the user be in need of

#Important: the installation of a package that the user be in need of through install.packages function must be done only after the launch of R because if necessary it is the library function that loads the package mentioned and previously installed!

#p224r63_1988_masked.grd is imported in R with brick function according to Windows' syntaxis in which: renowned object name = p224r63_1988 and original object name = p224r63_1988_masked.grd

#Syntaxis' function for Windows is: renowned object name <- brick('original object name')

#Final syntaxis' function in Windows is: p224r63_1988 <- brick('p224r63_1988_masked.grd')

#How to visualize informations of p224r63_1988 in R? 

#In R, visualizing informations of an object, name of it followed by Enter as physical command by keyboard 

#Syntaxis' function for Windows is: renowned object name ↵ Enter

#Final syntaxis' function in Windows is: p224r63_1988 ↵ Enter

#I exploit a function (plot) to obtain visually spectral bands¹

#Syntax's function for Windows is: plot(object)

#In R function plot(p224r63_1988) lead me to a window with spectral bands explainable graphically through the concept of reflectance

#Initially a multitemporal differentiation in the vegetation cover of the Amazon rainforest could be appreciable through a false color graphic visualization with the plotRGB function of p224r63_1988 and p224r63_2011 in the red channel of LANDSAT's sensors with a syntax R = B4_sre: near-infrared, G = B3_sre: red and B = B2_sre: green with linear strecht Lin organizing them in a multiframe of two rows and a column with the function par so that there is no overlapping of successive plotRGB for a single image!

#Final syntaxis' function in Windows is: par(mfrow=c(2,1)) followed by plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") and plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

#Subsequently, to analyze the multitemporal differentiation in the vegetation cover of the Amazon forest by remote sensing beyond the annoying background haze, the previous false color graphic visualization with the plotRGB function of p224r63_1988 and p224r63_2011 in the red channel of LANDSAT's sensors could have a syntax R = B4_sre: near-infrared, G = B3_sre: red and B = B2_sre: green but with both linear (Lin) and histogram (his) strecht organizing them in a square multiframe of two rows and two columns with the same function par and being saved as a PDF with the name of AmazonRainforestMultitemporalDifferentiation

#Final syntaxis' function in Windows is: pdf('AmazonRainforestMultitemporalDifferentiation.pdf'), par(mfrow=c(2,2)) followed by plotRGB(p224r63_1988, r=4, g=3, b=2, stretch='Lin'), plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin'), plotRGB(p224r63_1988, r=4, g=3, b=2, stretch='hist') and plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='hist')

#Sequence of informatic commands for R_remote_code_sensing_first.r

install.packages('raster')

library(raster)

setwd('C:/lab/')  

p224r63_2011 <- brick('p224r63_2011_masked.grd')

p224r63_2011

plot(p224r63_2011)

bgwcp <- colorRampPalette(c('black','grey','white'))(100)

plot(p224r63_2011, col=bgwcp)

rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)

plot(p224r63_2011, col=rmpcp)

dev.off()

plot(p224r63_2011$B1_sre)

par(mfrow=c(1,2))

plot(p224r63_2011$B1_sre)

plot(p224r63_2011$B2_sre)

par(mfcol=c(1,2))

plot(p224r63_2011$B1_sre)

plot(p224r63_2011$B2_sre)

par(mfrow=c(4,1))

plot(p224r63_2011$B1_sre)

plot(p224r63_2011$B2_sre)

plot(p224r63_2011$B3_sre)

plot(p224r63_2011$B4_sre)

par(mfrow=c(2,2))

plot(p224r63_2011$B1_sre)

plot(p224r63_2011$B2_sre)

plot(p224r63_2011$B3_sre)

plot(p224r63_2011$B4_sre)

par(mfrow=c(2,2)) 

dbbcfbcp <- colorRampPalette(c("darkblue","blue","cornflowerblue")) (100)

plot(p224r63_2011$B1_sre, col=dbbcfbcp)

ag3sg2sgcp <- colorRampPalette(c("springgreen3","springgreen2","springgreen1")) (100)

plot(p224r63_2011$B2_sre, col=ag3sg2sgcp)

r4r3r2cp <- colorRampPalette(c("red4","red3","red2")) (100)

plot(p224r63_2011$B2_sre, col=r4r3r2cp)

do4or1ocp <- colorRampPalette(c("darkorange4","orangered1","orange")) (100)

plot(p224r63_2011$B4_sre, col=do4or1ocp)

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')

par(mfrow=c(2,2)) 

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')

pdf('RGBAmazonRainforest.pdf')

par(mfrow=c(2,2))

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')

dev.off()

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist')

par(mfrow=c(3,1))

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist')

library(raster)

setwd('C:/lab/') 

p224r63_2011 <- brick('p224r63_2011_masked.grd')

p224r63_2011

plot(p224r63_2011)

p224r63_1988 <- brick('p224r63_1988_masked.grd')

p224r63_1988

plot(p224r63_1988)

par(mfrow=c(2,1)) 

plotRGB(p224r63_1988, r=4, g=3, b=2, stretch='Lin') 

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')

pdf('AmazonRainforestMultitemporalDifferentiation.pdf')

par(mfrow=c(2,2))

plotRGB(p224r63_1988, r=4, g=3, b=2, stretch='Lin')

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')

plotRGB(p224r63_1988, r=4, g=3, b=2, stretch='hist')

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='hist')

#---------------------------------------------------

#2. R time code series

#Which is the title for R's developing code?

#My R code for a time series ⏱️❄️

#Which folder must R use in the computer for this new code?

#In the computer R must use the subfolder named greenland within the "mother" folder simply called lab

#I exploit a function (setwd) for the association between R and greenland subfolder

#Adapted syntaxis' function for Windows is: setwd("C:/name of the folder in which there is a subfolder of interest to the user/name of the subfolder which will be associated with R")

#Final syntaxis' function for Windows is: setwd("C:/lab/greenland")

#After the association between R and greenland subfolder, how I import data from greenland subfolder to R?

#In a different way from the R_remote_code_sensing_first.r, although I still exploit a function to import data from greenland subfolder - external - to R - internal¹ - this will be raster and not brick because our data does not represent a multi-layer raster object³ but raster layer² objects!

#Syntaxis' function for Windows is: renowned object name <- raster("original object name")

#Previous function is based on install.packages("raster"): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)¹ 

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#Loading required packages: sp is successful being classes and methods' database provider for spatial data 

#For the operation of this code, it is recommended by the professor to install also install.packages("RStoolbox") and install.packages("rasterVis") in order to have tools and visualization methods for remote sensing data analysis

#Through install.packages("RStoolbox") the user have a diversied toolbox for remote sensing image processing and analysis as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses

#Upload message successful: trying URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/RStoolbox_0.2.6.zip' Content type 'application/zip' length 2170101 bytes (2.1 MB)downloaded 2.1 MBpackage ‘RStoolbox’ successfully unpacked and MD5 sums checkedThe downloaded binary packages are inC:\Users\PC\AppData\Local\Temp\RtmpEx7d3z\downloaded_packages

#Through install.packages("rasterVis") the user have methods to apply for an enhanced visualization and interaction with raster data. It implements visualization methods for quantitative data and categorical data, both for univariate and multivariate rasters. It also provides methods to display spatiotemporal rasters, and vector fields

#Upload message successful: trying URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/rasterVis_0.50.1.zip'Content type 'application/zip' length 216951 bytes (211 KB)downloaded 211 KBpackage ‘rasterVis’ successfully unpacked and MD5 sums checkedThe downloaded binary packages are inC:\Users\PC\AppData\Local\Temp\RtmpSKE0X0\downloaded_packages

#The rasterVis package installation incorporates preexisting lattice and latticeExtra packages: lattice is a powerful and elegant high-level data visualization system inspired by Trellis graphics, with an emphasis on multivariate data while latticeExtra provides several new high-level functions and methods to lattice itself  

#lst_2000.tif, lst_2005.tif, lst_2010.tif and lst_2015.tif are imported in R with raster function according to Windows' syntaxis in which: renowned object name = lst_2000,lst_2005, lst_2010 and lst_2015 and original object name = lst_2000.tif, lst_2005.tif, lst_2010.tif and lst_2015.tif

#Final syntaxis' function in Windows is: lst_2000 <- raster("lst_2000.tif"),lst_2000 <- raster("lst_2005.tif"), lst_2010 <- raster("lst_2010.tif") and lst_2015 <- raster("lst_2015.tif")

#How to graphically visualize the Earth's surface temperature in Greenland from raster layer objects lst_2000, lst_2005, lst_2010 and lst_2015 (lst, acronym for land surface temperature)?

#I exploit a function (plot) to obtain visually land surface temperature

#Syntaxis' function for Windows is: plot(object)

#In R function plot(lst_2000), plot(lst_2005), plot(lst_2010) and plot(last_2015) lead me to a window with land surface temperature of Greenland explainable graphically through the concept of reflectance

#With the function (par) there is the possibility of combining in this case multiple levels of "interest" belonging to different objects² in their series into one graphical visualization of their called multiframe

#Syntaxis' function for Windows is: par(multiframe, a graphical visualization of multiple levels of "interest" belonging to different objects² in their series organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array(number of rows or columns required, number of columns or rows required))

#Final syntaxis' function in Windows is: par(mfrow=c(2,2)) followed by plot(lst_2000), plot(lst_2010), plot(lst_2010) and plot(lst_2015)

#The plot and par functions applied individually by the user to each raster layer object are a slow and inefficient iterative cycle! 

#What if I import the four rasters lst_2000, lst_2010, lst_2010 and lst_2015 at the same time in R via the raster function by selecting them from a list in the greenland subfolder? Subsequently, by representing each raster² the Earth's surface temperature for Greenland in different years (2000, 2005, 2010 and 2015), I would join the latter as levels of a single object³, the plot of which will clarify graphically the trend of the previous temperature in a time series analysis

#Initially I exploit a function (rlist) through which I create a list of data, files or objects based on the matching of their names with a key regular expression selected by the user

#Syntaxis' function for Windows is: name of the list of objects selected by the user <- list.files(pattern="a key regular expression in each name of previous objects of which the user is creating a list") 

#Since the number of my objects is limited, I could have the tif format as a pattern in the rlist function. This user choice is not recommended because the tif format is common and widespread so my choice will be the lst pattern indicating in each raster what represents in particular (land surface temperature)

#Final syntaxis' function in Windows is: greenlandsubfolderlist <- list.files(pattern="lst")

#After the creation of the list greenlandsubfolderlist consisting of lst_2000, lst_2005, lst_2010 and lst_2015, how to import it by applying the raster function globally?

#I exploit a function (lapply) which apply a selected function by the user in R over a list

#Syntaxis' function for Windows is: name of the list of objects on which is applied the function selected by the user <- lapply(original name of the list of objects on which will be applied the function selected by the user, selected function by the user)

#Final syntaxis' function in Windows is: greenlandimportedr <- lapply(greenlandsubfolderlist,raster)

#The display of the information of lst_2000, lst_2005, lst_2010 and lst_2015 is done simply by pressing ↵ Enter after I have digitized greenlandimportedr where the rasters are listed with numbers between square brackets from [1] to [4]

#The last operation will be to merge the raster layer objects lst_2000, lst_2005, lst_2010 and lst_2015 - contained in the greenlandimportedr list imported into R - into a multi-layer raster object whose name I have chosen will be TCSG through a new function called stack 

#I exploit the (stack) function that stack or unstack vectors from a data frame or list generated by the user beforehand

#Syntaxis' function for Windows is: name of the future multi-layer raster object <- stack(name of the list of objects on which the function selected by the user is applied to import them into R)

#Final syntaxis' function in Windows is: TCSG <- stack(greenlandimportedr)

#Without exploiting the plot function singularly on each raster layer object and organizing the same raster layer objects in a prearrenged multiframe through the par function, the iterative cycle of the rlist, lapply and stack functions guarantees to any user the exploitation of plot function directly on the multilevel raster object as the one created in the 42nd string of this code!

#Final syntaxis' function in Windows is: plot(TCSG)

#The graphical visualization of the increase in the surface temperature of the Earth in Greenland is obtained through a more detailed plot in RGB: I associate the levels of "interest" in TCSG multilayer raster object - which initially were a series of raster layer objects stand alone - to the channels of the red, green and blue for the multispectral sensors the LANDSAT satellite is equipped with

#Syntax's function for Windows is: plotRGB(renowned object name, r= number of selected spectral band which will be graphically visualized through red channel, g= number of selected spectral band which will be graphically visualized through green channel, b= number of selected spectral band which will be graphically visualized through blue channel,type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!

#Final syntaxis' function in Windows is: plotRGB(TCSG, 1, 2, 3, stretch="Lin"), plotRGB(TCSG, 2, 3, 4, stretch="Lin") and plotRGB(TCSG, 4, 3, 2, stretch="Lin") where r, g and b could be implied!

#For a graphical visualization of the melting ice in Greenland depending on the Earth's surface temperature, it is possible to exploit another plot function that for the TCSG multi-layer raster object pools a legend for the reflectance values at lst_2000, lst_2005, lst_2010 and lst_2015?

#I exploit a function (levelplot) to draw level plots and contour plots

#Important: the above function is operative if and only if the user with the library function loads the previously installed rasterVis package

#Syntaxis' function for Windows is: library(add-on package the user wants to load in R)

#Final syntaxis' function in Windows is: library(rsaterVis)

#Instead the syntax for the levelplot function in Windows is: levelplot(name of the multi-layer object selected by the user)

#Final syntaxis' function in Windows is: levelplot(TCSG)

#And if I wanted to apply the levelplot function to the single TCSG layer represented by my choice among the raster layer objects lst_2000, lst_2005, lst_2010 and lst_2015?

#I exploit a function ($) to extract, from the initial (plot)¹ of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my p224r63_2011's level of ''interest''² is the set of data which will be graphically visualized in their functional whole being as the spectral band B1:blue?

#Final syntaxis' function in Windows is: levelplot(TCSG$lst_2000), levelplot(TCSG$lst_2005), levelplot(TCSG$lst_2010) and levelplot(TCSG$lst_2015)

#The graphical display through the levelplot function of the level raster objects lst_2000, lst_2005, lst_2010 and lst_2015 as layers of the TCSG multilevel raster object is more detailed: the temperature trend on the earth's surface is represented by a graph - above and to the right of it - whose values are attributed by row or column as the sum of the values belonging to the nth row or column in relation to the total number of pixels. If the number of pixels is equal to 16, 2 to 16 = 65,536 will be the average values potentially attributable in the form of bits so that it can be understood even for a single pixel if in a predetermined time span there has been an imperceptible variation of that temperature!

#The graphical display of TCSG through levelplot function can be embellished by integrating the syntax of the function with the arguments to specify what is the user's need in the analysis of the temperature in Greenland. In my case I need to apply a new color palette for the correct interpretation of the reflectance values, change the name of the layers / raster objects of the layer and put a title on the graph itself

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#Final syntaxis' function in Windows is: blbprcp <- colorRampPalette(c("blue","light blue","pink","red"))(100)

#Implemented syntaxis' function in Windows is: levelplot(name of the multi-layer object selected by the user, col.regions= name of new palette of colors)

#Final syntaxis' function in Windows is: levelplot(TCSG, col.regions=blbprcp)

#Without exploiting any function, I manually select and insert the name (s) for the layer (s) of the multi layer object - which will be July 2000, July 2005, July 2010 and July 2015 - in the names.attr argument integrating in the preceding syntaxis of the levelplot function

#Implemented syntaxis' function in Windows is: levelplot(name of the multi-layer object selected by the user, col.regions= name of new palette of colors, names.attr=c("user-selected name (s) for the layer (s) of multi-layer object)

#Final syntaxis' function in Windows is: levelplot(TCSG, col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

#Finally I integrate in the syntaxis of the levelplot function the main argument to put a title to the graph that clarifies how the temperature of Earth's surface - reported in the legend for the four raster layer objects as reflectance values - have changed over time

#Implemented syntaxis' function in Windows is: levelplot(name of the multi-layer object selected by the user, col.regions= name of new palette of colors, main=''title of the graphical visualization", names.attr=c("user-selected name (s) for the layer (s) of multi-layer object)

#Final syntaxis' function in Windows is: levelplot(TCSG,col.regions=cl, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

#The graphic visualization of the amount of melted ice depending on the surface temperature of the Earth in Greenland is obtained with the same iterative cycle of list.files, lapply and stack functions but starting from level raster objects obtained from the Nimbus 7 satellite between 1979 and 2007 through its own microwave sensor

#Initially I exploit a function (rlist) through which I create a list of data, files or objects based on the matching of their names with a key regular expression selected by the user

#Syntaxis' function for Windows is: name of the list of objects selected by the user <- list.files(pattern="a key regular expression in each name of previous objects of which the user is creating a list")

#Since the number of my objects is limited, I could have the tif format as a pattern in the rlist function. This user choice is not recommended because the tif format is common and widespread so my choice will be the melt pattern indicating in each raster what represents in particular (amount of melted ice)

#Attention! The zip folder whose name is melt could be integrated into this iterative loop of functions and halt the process for the analysis I'm conducting!

#Final syntaxis' function in Windows is: meltlist <- list.files(pattern="melt")

#After the creation of the list meltlist consisting of 1979annual_melt to 2007annual_melt, how to import it by applying the raster function globally?

#I exploit a function (lapply) which apply a selected function by the user in R over a list

#Syntaxis' function for Windows is: name of the list of objects on which is applied the function selected by the user <- lapply(original name of the list of objects on which will be applied the function selected by the user, selected function by the user)

#Final syntaxis' function in Windows is: melt_import <- lapply(meltlist,raster)

#The last operation will be to merge the raster layer objects from 1979annual_melt to 2007annual_melt - contained in the melt_import list imported into R - into a multi-layer raster object whose name I have chosen will be melt through a new function called stack 

#I exploit the (stack) function that stack or unstack vectors from a data frame or list generated by the user beforehand

#Syntaxis' function for Windows is: name of the future multi-layer raster object <- stack(name of the list of objects on which the function selected by the user is applied to import them into R)

#Final syntaxis' function in Windows is: melt <- stack(melt_import)

#The display of the information of melt is done simply by pressing ↵ Enter

#For a graphical visualization of the melting ice in Greenland depending on the Earth's surface temperature, why not take advantage of the levelplot function that I introduced in this code?

#Syntaxis' function for Windows as in the 53rd string of R_code_time_series.r is: levelplot(name of the multi-layer object selected by the user)

#Final syntaxis' function in Windows is: levelplot(melt)

#The above levelplot function on the multi-layer raster object melt leads to a graphical visualization that is difficult to interpret since it consists of each raster layer objects from 1979annual_melt to 2007annual_melt - contained in the melt_import list imported previously into R -. Despite the values for the x and y axes and the legend for the reflectance values, the user is unable to conclude what could be the amount of melted ice in Greenland in that time window. What solution to adopt?

#The solution to be adopted is to create a new raster layer object that shows in a single graphic solution the amount of melted ice in Greenland on the difference between the initial and final state represented respectively by the 1979annual_melt and 2007annual_melt raster layer objects

#The new raster layer object, to which I will give the name melt_amount, is created by a simple subtraction among the already selected raster layer objects 1979annual_melt and 2007annual_melt representing minuend and subtrahend respectively

#melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

#Attention! The $ function is essential to tell R how the raster layer objects 2007annual_melt and 1979annual_melt belong to melt although were originated in TCSG 

#Not being R's default color palette satisfactory, I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#Final syntaxis' function in Windows is: bwrcp <- colorRampPalette(c("blue","white","red"))(100)

#I exploit a function (plot) to obtain visually the amount of melted ice

#Syntaxis' function for Windows is: plot(melt_amount, col=bwrcp)

#I exploit a function (levelplot) to draw level plots and contour plots

#Instead the syntax for the levelplot function in Windows is: levelplot(name of the multi-layer object selected by the user)

#Final syntaxis' function in Windows is: levelplot(melt_amount, col.regions=bwrcp)

#The graphical visualization of melt_amount with the plot and levelplot functions is easily interpretable for reflectance values obtained from the Nimbus 7 satellite which, through the three colors - white, red and blue - of the palette of colors called bwrcp, show those regions of Greenland where there was a significant loss of ice due to the increase in the Earth's surface temperature between 1979 and 2007

#A special thank to my colleague Daniela Cosma for politely sharing the data of her future thesis for the creation of this code!

#Sequence of informatic commands for R_code_time_series.r:

install.packages("raster")

install.packages("RStoolbox")

install.packages("rasterVis")

install.packages("rgdal")

library(raster)

setwd("C:/lab/greenland/")

lst_2000 <- raster("lst_2000.tif")

plot(lst_2000)

lst_2005 <- raster("lst_2005.tif")

plot(lst_2005)

lst_2010 <- raster("lst_2010.tif")

plot(lst_2010)

lst_2015 <- raster("lst_2015.tif")

plot(lst_2015)

par(mfrow=c(2,2))

plot(lst_2000)

plot(lst_2010)

plot(lst_2010)

plot(lst_2015)

greenlandsubfolderlist <- list.files(pattern="lst")

greenlandsubfolderlist

greenlandimportedr <- lapply(greenlandsubfolderlist,raster)

greenlandimportedr

TCSG <- stack(greenlandimportedr)

plot(TCSG)

plotRGB(TCSG, 1, 2, 3, stretch="Lin")

plotRGB(TCSG, 2, 3, 4, stretch="Lin")

plotRGB(TCSG, 4, 3, 2, stretch="Lin")

library(rasterVis)

levelplot(TCSG)

levelplot(TCSG$lst_2000)

levelplot(TCSG$lst_2005)

levelplot(TCSG$lst_2010)

levelplot(TCSG$lst_2015)

blbprcp <- colorRampPalette(c("blue","light blue","pink","red"))(100)

levelplot(TCSG, col.regions=blbprcp)

levelplot(TCSG,col.regions=blbprcp, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

levelplot(TCSG,col.regions=blbprcp, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

meltlist <- list.files(pattern="melt")

melt_import <- lapply(meltlist,raster)

melt <- stack(melt_import)

levelplot(melt)

dev.off()

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

bwrcp <- colorRampPalette(c("blue","white","red"))(100)

plot(melt_amount, col=bwrcp)

levelplot(melt_amount, col.regions=bwrcp)

#----------------------------------------------

#3. R code Copernicus

#What is Copernicus? 🛰️

#Copernicus is the European Union’s Earth Observation Programme, which monitors our planet and its environment for the ultimate benefit of the citizens of Europe. It delivers data, information and services based on satellite Earth Observation data and insitu (non-space) data. The Programmeis funded, coordinated and managedby the European Commission in cooperation with partners such as ESA and EUMETSAT

#What is the official Copernicus website?

#The official Copernicus website is https://www.copernicus.eu/en

#How to register a personal account on this website?

#To register a personal account on the previous website anyone have to click the 𝗥𝗘𝗚𝗜𝗦𝗧𝗘𝗥 button and enter the following informations in the dedicated sections: 𝘜𝘴𝘦𝘳𝘯𝘢𝘮𝘦*, 𝘗𝘢𝘴𝘴𝘸𝘰𝘳𝘥*, 𝘊𝘰𝘯𝘧𝘪𝘳𝘮 𝘱𝘢𝘴𝘴𝘸𝘰𝘳𝘥*, 𝘍𝘪𝘳𝘴𝘵 𝘯𝘢𝘮𝘦*, 𝘓𝘢𝘴𝘵 𝘯𝘢𝘮𝘦*, 𝘌-𝘮𝘢𝘪𝘭 𝘢𝘥𝘥𝘳𝘦𝘴𝘴*, 𝘊𝘰𝘮𝘱𝘢𝘯𝘺*, 𝘋𝘰𝘮𝘢𝘪𝘯 𝘰𝘧 𝘢𝘤𝘵𝘪𝘷𝘪𝘵𝘺*, 𝘛𝘺𝘱𝘦 𝘰𝘧 𝘰𝘳𝘨𝘢𝘯𝘪𝘻𝘢𝘵𝘪𝘰𝘯* and 𝘊𝘰𝘶𝘯𝘵𝘳𝘺*

#After completing the 𝘎𝘦𝘯𝘦𝘳𝘢𝘭 𝘪𝘯𝘧𝘰𝘳𝘮𝘢𝘵𝘪𝘰𝘯 section, the future user will prove that he/she is not a robot throught reCAPTCHA system in the 𝘝𝘢𝘭𝘪𝘥𝘢𝘵𝘪𝘰𝘯 𝘤𝘰𝘥𝘦 section below: clicking on the box a green check (G✓) should appear! 

#To conclude the 𝘙𝘦𝘨𝘪𝘴𝘵𝘳𝘢𝘵𝘪𝘰𝘯 𝘧𝘰𝘳𝘮, in the 𝘛𝘦𝘳𝘮𝘴 𝘰𝘧 𝘶𝘴𝘦 section in the end terms of use and privacy policy must be accepted by ticking with the left mouse button another box but this time with a blue check (B✓)     

#Clicking the 𝗥𝗘𝗚𝗜𝗦𝗧𝗘𝗥 button should appear the following message: By registering in this website you are deemed to have accepted the T&C for Sentinel data use

#After this message appears, the user will receive an account activation link in the mailbox indicated in the appropriate section with the information previously entered

#Attention: the activation of an account in the Copernicus programme is a prerequisite for downloading satellite images on it

#How to download a satellite image from the official website of the Copernicus program?

#The satellite image that the user would like to download is to be identified within the thematic sections contained in the main page: 𝘝𝘦𝘨𝘦𝘵𝘢𝘵𝘪𝘰𝘯 𝘴𝘵𝘢𝘵𝘦, 𝘌𝘯𝘦𝘳𝘨𝘺 𝘣𝘶𝘥𝘨𝘦𝘵, 𝘞𝘢𝘵𝘦𝘳 𝘊𝘺𝘤𝘭𝘦 and 𝘊𝘳𝘺𝘰𝘴𝘱𝘩𝘦𝘳𝘦

#Each thematic section is made up of collections which, in order, are:

#𝘝𝘦𝘨𝘦𝘵𝘢𝘵𝘪𝘰𝘯 𝘴𝘵𝘢𝘵𝘦 -> VEGETATION PROPERTIES VEGETATION INDICATORS DRY MATTER PRODUCTIVITY, FIRE DISTURBANCE SOIL WATER INDEX and SURFACE SOIL MOISTURE

#𝘌𝘯𝘦𝘳𝘨𝘺 𝘣𝘶𝘥𝘨𝘦𝘵 -> ROOT - TOP OF CANOPY REFLECTANCE, ALBEDO and LAND SURFACE TEMPERATURE

#𝘞𝘢𝘵𝘦𝘳 𝘊𝘺𝘤𝘭𝘦 -> LAKE SURFACE WATER TEMPERATURE, LAKE WATER QUALITY,WATER BODIES and WATER LEVEL

#𝘊𝘳𝘺𝘰𝘴𝘱𝘩𝘦𝘳𝘦 -> CRYOSPHERE

#It is possible to have a preview of the collection in which I am interested by clicking on the Collections subsection;

#The 𝓲 at the top right instead is a link to the European Union's Earth Observation Program website where the collection I selected from the main page is in-depth

#By clicking on the collection from which to obtain the satellite image, a map of the globe will appear on the screen with a toolbar on the right to extrapolate the image of my interest

#The reference section is Catalog research with three subsections to facilitate the search for the user: Help, Collection and Basic

#In the Help subsection there is the following warning: The "Catalog search" tab allows you to define search criteria and start a search within the catalog

#In the Collection subsection there is the set of downloadable products in the reference collection

#While in the Basic subsection the user has the possibility to choose the time period in which to carry out a hypothetical future analysis: Start date and End Date. However, with the Slot I can be in a position to investigate a range from year to year useful for multitemporal analyzes

#The ROI instead is a tool that allows you to enter the coordinates of the area of my interest or through which I get them after selecting the previous area as Draw region of interest

#Search in progress wait

#To download the satellite image of my interest - visible in preview by clicking with the left button on the thumbnail or even quicklook for a correspondence with the global map made available by Copernicus - the blue download arrow is responsible for uploading it to the indicated folder during his rescue

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is raster through which is possible reading, writing, manipulating, analyzing and modeling of spatial data. The package implements basic and high-level functions for raster data and for vector data operations such as intersections:

install.packages("raster")

#The second package to install is ncfd4, which provides a high-level R interface to data files written using Unidata's netCDF library (version 4 or earlier), which are binary data files that are portable across platforms and include metadata information in addition to the data sets. Using this package, netCDF files (either version 4 or ``classic'' version 3) can be opened and data sets read in easily:

install.packages("ncfd4")

#library() is a function which load and attach add-on packages, in this case the previous raster and ncfd4 packages:

library(raster)

library(ncfd4)

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

#In a different way from the R_remote_code_sensing_first.r, although I still exploit a function to import data from greenland subfolder - external - to R - internal¹ - this will be raster and not brick because our data does not represent a multi-layer raster object but raster layer objects!

snowcover2021* <- raster("c_gls_SCE500_202104010000_CEURO_MODIS_V1.0.1.nc")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#In R, to visualize information of snowcover2021, name of it followed by Enter ↵ as physical command by keyboard:

snowcover2021

#The relatively snowcover2021 information is contained within the table:

class      : RasterLayer 
dimensions : 7400, 12200, 90280000  (nrow, ncol, ncell)
resolution : 0.005, 0.005  (x, y)
extent     : -11, 50, 35, 72  (xmin, xmax, ymin, ymax)
crs        : +proj=longlat +datum=WGS84 +no_defs 
source     : c_gls_SCE500_202104010000_CEURO_MODIS_V1.0.1.nc 
names      : Snow.Cover.Extent 
z-value    : 2021-04-01 
zvar       : sce500 

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize spectral bands:

plot(snowcover2021)

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

sc21gbwcp <- colorRampPalette(c('green','brown','white'))(1000)

#(plot(snowcover2021) must be reformulated by incorporating new palette of colors sc21gbwcp: plot(snowcover2021, col=sc21gbwcp) will display graphically reflectance's values in a green, brown and black colour scale:

plot(snowcover2021, col=sc21gbwcp)

#Why does the background in the plot change (snowcover2021, col = sc21gbwcp) is green as if there is no snow cover?

#The N̲ot A̲ssigned values (NA) in the background of the plot (snowcover2021, col = sc21gbwcp) are to be reclassified because there is no association with the values in reality!

#reclassify() is a function which reclassify values of a Raster* object. The function (re)classifies groups of values to other values. For example, all values between 1 and 10 become 1, and all values between 11 and 15 become 2:

snowcover2021reclassified <- raster::reclassify(snowcover2021, cbind(252,255, NA), right=TRUE)

#plot is a common function for plotting of R object and in this case I exploit the previous to visualize snowcover2021reclassified without a colored green background because of the reclassification in NA values:

plot(snowcover2021reclassified)

#Using the aggregate () function it is possible to reduce the resolution in snowcover2021reclassified by resampling instead of preserving it as shown in 5. R code multivariate analysis?

#The function aggregate() splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form:

sc21ra <- aggregate(snowcover2021reclassified, fact=100) 

#plot(plot(sc21ra) must be reformulated by incorporating new palette of colors sc21gbwcp: plot(sc21ra, col=sc21gbwcp) will display graphically reflectance's values in a green, brown and black colour scale:

plot(sc21ra, col=sc21gbwcp)

#The plot () function shows the difference in resolution between snowcover2021reclassified and sc21ra: scr21ra resolution < snowcover2021reclassified resolution. The resampling of its pixels in an image depending on the attributed reflectance values ​​could compromise its readability and / or interpretation!

#Sequence of informatic commands for R_code_Copernicus.r:

install.packages("raster")

install.packages("ncdf4")

library(raster)

library(ncdf4)

snowcover2021 <- raster("c_gls_SCE500_202104010000_CEURO_MODIS_V1.0.1.nc")

snowcover2021

plot(snowcover2021)

sc21gbwcp <- colorRampPalette(c('green','brown','white'))(1000)

plot(snowcover2021, col=sc21gbwcp)

snowcover2021reclassified <- raster::reclassify(snowcover2021, cbind(252,255, NA), right=TRUE)

plot(snowcover2021reclassified)

sc21ra <- aggregate(snowcover2021reclassified, fact=100) 

#----------------------------------------------

#4. R code knitr

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#The second package to install is knitr, a general-purpose tool for dynamic report generation in R using Literate Programming techniques:

install.packages('knitr', dependencies = TRUE)

#library() is a function which load and attach add-on packages, in this case the previous RStoolbox and knitr packages:

library(RStoolbox)

library(knitr)

#I might as well consider require() function, giving a warning message and returning a logical value as FALSE if the requested package is not found and TRUE if the package is loaded. The library() function instead by default returns an error if the requested package does not exist!

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

# stitch() is a convenience function that creates automatically a small-scale report based on a R script and a template:

stitch("R_code_Greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

#The future script will be R_code_Greenland.r.txt and the default template is an Rnw file (LaTeX); stitch_rhtml() and stitch_rmd() are wrappers on top of stitch() using the R HTML and R Markdown templates respectively!

#knitr is conceptually internal to R but in creating a report it is based on an external code (inverted commas " "). After importing it into R, this function saves the complete code as a text document inside the folder - indicated instead with the previous setwd () function - with a title corresponding to the name of the selected repository (R_code_Greenland)

#Sequence of informatic commands for R_code_knitr.r

install.packages("RStoolbox")

install.packages('knitr', dependencies = TRUE)

library(RStoolbox)

library(knitr)

setwd("C:/lab/")

stitch("R_code_Greenland.r.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))


#-----------------------------------------------------------------------

#5. R code multivariate analysis

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

#The variance in percent for the PC1 blue band almost totally represents that of the variance in resampledp224r63_2011rpca being 99.84%!

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

#-----------------------------------------------------------------------

#6. R code classification

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

#The relatively SO information is contained within the table:

class      : RasterBrick 
dimensions : 1157, 1920, 2221440, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 1920, 0, 1157  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg 
names      : Solar_Orbiter_s_first_views_of_the_Sun_pillars.1, Solar_Orbiter_s_first_views_of_the_Sun_pillars.2, Solar_Orbiter_s_first_views_of_the_Sun_pillars.3 
min values :                                                0,                                                0,                                                0 
max values :                                              255,                                              255,                                              255 

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

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth:

suncl <- colorRampPalette(c('yellow','black','red'))(100)

#plot(sunc$map) must be reformulated by incorporating new palette of colors suncl: plot(sunc$map,col=suncl) will display graphically reflectance's values in a yellow, black and red colour scale:

plot(sunc$map,col=suncl)

#Classification of the satellite image dolansprings_oli_2013088_canyon_lrg.jpg captured by the Landsat satellite of the Nasa Earth Observatory 🏜️

#I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

GC <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#dolansprings_oli_2013088_canyon_lrg.jpg is an image captured by the Landsat satellite and downloaded from the NASA Earth Observatory website https://landsat.visibleearth.nasa.gov/view.php?id=80948

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize GC in the colors of the visible spectrum:

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

SO

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

#-----------------------------------------------------------------------

#7. R code ggplot2

#Creating elegant data visualisations using the "Grammar of Graphics": the case of ggplot2 📈

#install.packages() is a function which download and install packages from CRAN-like repositories or from local files

#The first package to install is raster through which is possible reading, writing, manipulating, analyzing and modeling of spatial data. The package implements basic and high-level functions for raster data and for vector data operations such as intersections:

install.packages("raster")

#The second package to install is RStoolbox, a toolbox for remote sensing image processing and analysis such as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses:

install.packages("RStoolbox")

#The third package to install is ggplot2, which is a system for declaratively creating graphics, based on "The Grammar of Graphics". The user provides the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details:

install.packages(ggplot2)

#The fourth package to install is gridExtra, which provides a number of user-level functions to work with "grid" graphics, notably to arrange multiple grid-based plots on a page, and draw tables: 

install.packages(gridExtra)

#library() is a function which load and attach add-on packages, in this case the previous raster, RStoolbox, ggplot2 and gridExtra packages:

library(raster)

library(RStoolbox)

library(ggplot2)

library(gridExtra)

#In my computer R must use the folder named simply lab and I exploit a function (setwd) for the association between R and lab folder:

setwd("C:/lab/")

#I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

p224r63 <- brick("p224r63_2011_masked.grd")

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#ggRGB() is a function that calculates RGB color composite RasterLayers for plotting with ggplot2. Optional values for clipping and and stretching can be used to enhance the imagery

#The graphical visualization of p224r63 in true colors, being LANDSAT equipped with true colour, thermal and multispectral sensors in a complex acquisition system, will be obtained from the visible spectrum to which I associate B1_sre:blue, B2_sre:green, B3_sre:red spectral bands of the initial object

ggRGB(p224r63,3,2,1, stretch="lin")

#This graphical visualization in true colors is therefore in RGB and independent from user's selection of a palette of colors through colorRampPalette function because the three levels of interest selected by the user herself/himself from B1_sre to B7_sre are combined such that they represent exclusively the red, green and blue channel in true colour sensors of LANDSAT satellite

#The graphical visualization of p224r63 in false color, not being the human eye thermal and multispectral sensors in a biological complex acquisition system, will be obtained by substituting B1_sre:blue spectral band with B4_sre:near-infrared, B5_sre:mid-infrared, B6_sre:far-infrared or B7_sre:other mid-infrared spectral bands on a case by case basis in remote sensing analysis

ggRGB(p224r63,4,3,2, stretch="lin")

#This is the graphical visualization of p224r63_2011 in false color for vegetational coverage of the Amazon rainforest through the red channel

#The components r, g and b in defining the syntax of the plotRGB () or ggRGB () function can be omitted and replaced by the numbers that identify the bands (B1_sre: blue spectral band with B4_sre: near-infrared, B5_sre: mid-infrared, B6_sre: far-infrared or B7_sre: other mid-infrared spectral bands if the satellite is always Landsat) to be displayed through those channels as a single satellite image!

#arrangeGrob set up a gtable layout to place multiple grobs on a page. In particular grid.arrange() draw on the current device and is useful to organize ggRGB elements after simply renamed them:

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

#-----------------------------------------------------------------------

#8. R code vegetation indices

#Which is the title for R's developing code?

#My R code for vegetation indices 🌲

#Which folder must R use in the computer?

#In the computer R must use the folder named simply lab

#I exploit a function (setwd) for the association between R and lab folder

#Adapted syntaxis' function for Windows is: setwd("C:/name of the folder in which there is a subfolder of interest to the user/name of the subfolder which will be associated with R")

#Final syntaxis' function for Windows is: setwd("C:/lab/greenland")

#After the association between R and lab folder, how I import data from lab folder to R?

#Identically to the R_remote_code_sensing_first.r, I still exploit a function to import data from lab folder - external - to R - internal¹ - and this will be brick and not raster because our data does not represent raster layer objects but multi-layer raster objects²³!

#Syntaxis' function for Windows is: renowned object name <- brick("original object name")

#Previous function is based on install.packages("raster"): I indicate to R trough require function to upload them as require(raster) where syntaxis doesn't need inverted commas (“ ”)¹ 

#What is the difference between the library function and the require function in loading a user-requested packages into R?

#The library function, if the requested package does not exist, by default returns an error message: there is no package called (name of the package requested by the user to load in R) while the require function is designed to be used inside functions as it gives a warning message and returns a logical value say, FALSE if the requested package is not found and TRUE if the package is loaded

#Loading required packages: sp is successful being classes and methods' database provider for spatial data 

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#defor1.jpg¹ and defor2.jpg² are imported in R with brick function according to Windows' syntaxis in which: renowned object name = defor1, defor2 and original object name = defor1.jpg, defor2.jpg

#Final syntaxis' function in Windows is: defor1 <- brick("defor1.jpg") and defor2 <- brick("defor2.jpg")           

#The graphical visualization of both defor1 and defor2 in false colors, being Terra (EOS AM-1) equipped with true colour, thermal and multispectral sensors in a complex acquisition system, will be obtained from the visible spectrum to which I associate B1_sre:NIR, B2_sre:red, B3_sre:grenn spectral bands of the initial object

#This graphical visualization in true colors is therefore in RGB and independent from user's selection of a palette of colors through colorRampPalette function because the three levels of interest selected by the user herself/himself from B1_sre to B3_sre are combined such that they represent exclusively the red⁵, green⁶ and blue⁷ channel in true colour sensors of LANDSAT satellite         

#Syntax's function for Windows is: plotRGB(renowned object name, r= number of selected spectral band which will be graphically visualized through red channel, g= number of selected spectral band which will be graphically visualized through green channel, b= number of selected spectral band which will be graphically visualized through blue channel,type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!         

#With the function (par) through there is the possibility of combining multiple object's level of ''interest'' into one graphical visualization of their called multiframe

#Syntaxis' function for Windows is:par(multiframe, a graphical visualization of multiple object's level of ''interest'' organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array⁴(number of rows or columns required, number of columns or rows required))

#Final syntaxis' function in Windows is: par(mfrow=c(2,1)) which has a functional significance if and only followed by plotRGB(defor1, r=1, g=2, b=3, stretch="lin") and plotRGB(defor2, r=1, g=2, b=3, stretch="lin")    

#The study by remote sensing of deforestation in the dry tropical forests of Mato Grosso (NT0140) is based on vegetation indices (VIs)

#What is a vegetation index (VI)?

#A vegetation index (VI) is a measure of vegetation properties calculated by the amount of solar radiation reflected in the optical spectrum

#The spectral signature of healthy vegetation depends on the higher reflectance values of 0,7 to 1,1 µm in the near infrared (NIR) region than in the visible region due to the cellular structure of the leaves - in particular the spongy mesophyll - where almost all of the light is absorbed by photosynthetic pigments. Chlorophyll intensely absorbs energy in the blue and red wavelengths from 0,4 a 0,7 µm, reflecting in the green wavelength instead. Finally, the reflectance in the short wave infrared (SWIR) wavelengths is related to the water content of the vegetation with absorption bands around 1.45, 1.95 and 2.50 µm. Outside of these absorption bands, leaf reflectance generally increases as the water content in the leaf decreases!

#DVI (D͟ifference V͟egetation I͟ndex) is the simplest vegetation index calculated as the difference between the near-infrared and red values: DVI = NIR - R

#The ASTER sensor of the Terra satellite (EOS AM-1) has 14 channels for wavelength values in the visible, NIR, SWIR and LWIR. Through the bands B1, B2, B3N and B3B belonging to the visible and NIR spectrum - because their wavelengths are between 0.520 µm and 0.860 µm - it is possible to obtain the reflectance values necessary for the calculation of the DVI index in dry tropical forests del Mato Grosso (NT0140)

#How to progress to the name with the previous bands B1, B2, B3N and B3B are identified within the object of interest defor1?

#The name/s attributed to the spectral band/s is to be found in the summary of its informations under the 𝘯𝘢𝘮𝘦𝘴 category

#How to visualize informations of defor1 in R? 

#In R, visualizing informations of an object, name of it followed by Enter as physical command by keyboard

#Syntaxis' function for Windows is: object name ↵ Enter

#Final syntaxis' function in Windows is: defor1 ↵ Enter

#The relatively defor1 information is contained within the table:

   class      : RasterBrick 
dimensions : 478, 714, 341292, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor1.jpg
names      : defor1.1, defor1.2, defor1.3 
min values :        0,        0,        0 
max values :      255,      255,      255 

#The satellite bands of interest in defor1 to me are defor1.1 and defor1.2 as red (R) band B1 and near-infrared (NIR) band B2 respectively

#If the user requires R's function plot(defor1) it will graphically display the reflectance values for the previous spectral bands?

#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my defor1's levels of "interest"² are two set of data which will be graphically visualized in their functional whole being as the spectral bands defor1.1² and defor1.2²?

#Final syntaxis' function in Windows for red (R) band B1 is: defor1$defor1.1

#In R, visualizing informations of defor1$defor1.1, name of it followed by Enter as physical command by keyboard ↵:

defor1$defor1.1

#The relatively defor1$defor1.1 information is contained within the table:

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 478, 714, 341292  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor1.jpg 
names      : defor1.1 
values     : 0, 255  (min, max)

#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: defor1$defor1.2

#In R, visualizing informations of defor1$defor1.2, name of it followed by Enter as physical command by keyboard ↵:

defor1$defor1.2

#The relatively defor1$defor1.2 information is contained within the table:

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 478, 714, 341292  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor1.jpg 
names      : defor1.2 
values     : 0, 255  (min, max)

#With plot(defor1$defor1.1) the user graphically will visualize the spectral band B1_sre:red stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor1$defor1.1)

#With plot(defor1$defor1.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor1$defor1.2)

#For each defor1 pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!

#The calculation of the DVI index is according to the formula a difference between defor1 $ defor1.1 and defor1 $ 1.2 to represent for each pixel - which constitutes the original image defor1 - the reflectance value as the difference between those associated with the NIR and R bands!

dvi1 <- defor1 $ defor1.1 - defor1 $ defor1.2

#How to graphically visualize the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object defor1? 

#I exploit a function (plot) to obtain visually the vegetation's state of health

#Syntaxis' function for Windows is: plot(object)

#In R function plot (dvi1) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor1.1 to B2/defor1.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#with what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

#plot(dvi1) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(dvi1, col = dbyrb)

#plot(dvi1) must be reformulated by incorporating also the main argument to contextualize the graphical visualization with the title of DVI at time 1:

plot(dvi1, col = dbyrb, main = "DVI at time 1")

#The plot of dvi1 shows the state of health of the vegetation of the dry forests of Mato Grosso through reflectance values measured by the ASTER sensor of the Earth satellite (EOS AM-1) where the more the green is intense, the more the trees of the aforementioned forest are in physiologically and ecologically optimal conditions

#The iterative cycle of functions, which has the purpose of graphically displaying the state of health of the vegetation of the dry forests of Mato Grosso through reflectance values measured by the ASTER sensor of the Earth satellite, is to be run in R also for defor2!

#How to progress to the name with the previous bands B1, B2, B3N and B3B are identified within the object of interest defor2?

#The name/s attributed to the spectral band/s is to be found in the summary of its informations under the 𝘯𝘢𝘮𝘦𝘴 category

#How to visualize informations of defor2 in R? 

#In R, visualizing informations of an object, name of it followed by Enter as physical command by keyboard

#Syntaxis' function for Windows is: object name ↵ Enter

#Final syntaxis' function in Windows is: defor2 ↵ Enter

#The relatively defor1 information is contained within the table:

class      : RasterBrick 
dimensions : 478, 717, 342726, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor2.jpg 
names      : defor2.1, defor2.2, defor2.3 
min values :        0,        0,        0 
max values :      255,      255,      255

#The satellite bands of interest in defor1 to me are defor2.1 and defor2.2 as red (R) band B1 and near-infrared (NIR) band B2 respectively

#If the user requires R's function plot(defor1) it will graphically display the reflectance values for the previous spectral bands?

#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my defor1's levels of "interest"² are two set of data which will be graphically visualized in their functional whole being as the spectral bands defor1.1² and defor1.2²?

#Final syntaxis' function in Windows for red (R) band B1 is: defor2$defor2.1

#In R, visualizing informations of defor1$defor1.1, name of it followed by Enter as physical command by keyboard ↵:

defor2$defor2.1

#The relatively defor2$defor2.1 information is contained within the table:

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 478, 717, 342726  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor2.jpg 
names      : defor2.1 
values     : 0, 255  (min, max)

#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: defor2$defor2.2

#In R, visualizing informations of defor2$defor2.2, name of it followed by Enter as physical command by keyboard ↵:

defor2$defor2.2

#The relatively defor1$defor1.2 information is contained within the table:

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 478, 717, 342726  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor2.jpg 
names      : defor2.2 
values     : 0, 255  (min, max)

#With plot(defor1$defor1.1) the user graphically will visualize the spectral band B1_sre:red stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor2$defor2.1)

#With plot(defor1$defor1.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor2$defor2.2)

#For each defor1 pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!

#The calculation of the DVI index is according to the formula a difference between defor2$defor2.1 and defor2$2.2 to represent for each pixel - which constitutes the original image defor1 - the reflectance value as the difference between those associated with the NIR and R bands!

dvi2 <- defor2$defor2.1 - defor2$defor2.2

#How to graphically visualize the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object defor1? 

#I exploit a function (plot) to obtain visually the vegetation's state of health

#Syntaxis' function for Windows is: plot(object)

#In R function plot (dvi2) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#with what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

#plot(dvi2) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(dvi2, col = dbyrb)

#plot(dvi2) must be reformulated by incorporating also the main argument to contextualize the graphical visualization with the title of DVI at time 2:

plot(dvi2, col = dbyrb, main = "DVI at time 1")

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:

par(mfcol=c(1,2)) o par(mfrow=c(2,1))

plot(dvi1, col=dbyrb, main="DVI at time 1")

plot(dvi2, col=dbyrb, main="DVI at time 2")

#The plot of dvi1 and dvi2 through the par () function shows the evolution in the state of health of the vegetation of the dry forests of Mato Grosso according to the interpretation given to the 173rd code string

#This evolution in the state of health of the vegetation of the dry forests of Mato Grosso can be graphically displayed in the time difference between dvi1 and dv12 using the plot () function:

difdvi <- dvi1 - dvi2

#How to graphically visualize evolution in the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object difdvi? 

#I exploit a function (plot) to obtain visually the evolution in vegetation's state of health

#Syntaxis' function for Windows is: plot(difdvi)

#In R function plot (dvi2) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#With what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

bwrcp <- colorRampPalette(c('blue','white','red'))(100) 

#plot(dvi2) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(difdvi, col=bwrcp)

#NDVI (N͟ormalized D͟ifference V͟egetation I͟ndex) is another vegetation index calculated as the ratio between the difference (-) and the sum (+) of the near-infrared and red values respectively to the numerator and denominators: #Attention: some software works sequentially without performing a calculation according to a mathematical logic. Hint, round, square and curly brackets!

#NDVI values range from -1 to 1

#The application of the formula for the calculation of NDVI in defor1 strictly depends on the values in the bands defor1$defor1.1 for the near-infrared (NIR) and defor1$1.2 for the red (RED):

ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)

#The above formula can be simplified by having described in the 141st string of code the difference between the values of defor1 $ defor1.1 and defor1 $ defor1.2 as dvi1 index:

ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)

#Attention: some software works sequentially without performing a calculation according to a mathematical logic. Hint, round, square and curly brackets!

#plot(ndvi1) must be reformulated by incorporating the previous colors palette of colors dbyrb: plot(ndvi1, col=dbyrb) will display graphically reflectance's values in a darkblue, yellow, red and black colour scale:

plot(ndvi1, col=dbyrb)

#Also the application of the formula for the calculation of NDVI in defor2 strictly depends on the values in the bands defor1$defor1.1 for the near-infrared (NIR) and defor1$1.2 for the red (RED):

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)

#The above formula can be simplified according to the 259thcode string as index dvi2 <- defor2 $ defor2.1 - defor2 $ defor2.2:

ndvi2 <- dvi2 / (defor2$defor2.1 + defor2$defor2.2)

#plot(ndvi2) must be reformulated by incorporating the previous colors palette of colors dbyrb: plot(ndvi1, col=dbyrb) will display graphically reflectance's values in a darkblue, yellow, red and black colour scale:

plot(ndvi2, col=cl)

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:

par(mfcol=c(1,2))

plot(ndvi1, col=cl, main="NDVI at time 1")

plot(ndvi2, col=cl, main="NDVI at time 2 ")

#In addition to the DVI and NDVI vegetational indices there are other spectral indices for which a preview is available through the spectralIndices () function applicable to both defor1 and defor2:

vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)

vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)

#spectralIndices() function calculates all indices in one go in C++, which is more efficient than calculating each index separately. By default all indices which can be calculated given the specified indices will be calculated. If you don't want all indices, use the indices argument to specify exactly which indices are to be calculated!

#The following table is for reference for the user should he choose the analysis to be conducted on a satellite image having the names of the main indices, a brief description, the creator and the year of publication, the required bands and the formula to be to apply:

𝙄𝙣𝙙𝙚𝙭 	              𝘿𝙚𝙨𝙘𝙧𝙞𝙥𝙩𝙞𝙤𝙣                	               𝙎𝙤𝙪𝙧𝙘𝙚	               𝘽𝙖𝙣𝙙𝙨	                                  𝙁𝙤𝙧𝙢𝙪𝙡𝙖

CLG	       Green-band Chlorophyll Index	                     Gitelson2003	          redEdge3, green	                  \(redEdge3/green - 1\)
CLRE	       Red-edge-band Chlorophyll Index	                  Gitelson2003	          redEdge3, redEdge1	               \(redEdge3/redEdge1 - 1\)
CTVI	       Corrected Transformed Vegetation Index	         Perry1984	             red, nir	                        \((NDVI + 0.5)/sqrt(abs(NDVI + 0.5))\)
DVI	       Difference Vegetation Index	                     Richardson1977	          red, nir	                        \(s * nir - red\)
EVI	       Enhanced Vegetation Index	                        Huete1999	             red, nir, blue	                  \(G * ((nir - red)/(nir + C1 * red - C2 * blue + L_evi))\)
EVI2	       Two-band Enhanced Vegetation Index	               Jiang 2008	             red, nir	                        \(G * (nir - red)/(nir + 2.4 * red + 1)\)
GEMI	       Global Environmental Monitoring Index	            Pinty1992	             red, nir	                        \((((nir^2 - red^2) * 2 + (nir * 1.5) + (red * 0.5))/(nir + red + 0.5)) * (1 - ((((nir^2 - red^2) * 2 + (nir * 1.5) + (red * 0.5))/(nir + red + 0.5)) * 0.25)) - ((red - 0.125)/(1 - red))\)
GNDVI	       Green Normalised Difference Vegetation Index	   Gitelson1998	          green, nir	                        \((nir - green)/(nir + green)\)
MCARI	       Modified Chlorophyll Absorption Ratio Index	      Daughtery2000	          green, red, redEdge1	            \(((redEdge1 - red) - (redEdge1 - green)) * (redEdge1/red)\)
MNDWI	       Modified Normalised Difference Water Index	      Xu2006	                green, swir2	                     \((green - swir2)/(green + swir2)\)
MSAVI	       Modified Soil Adjusted Vegetation Index	         Qi1994	                red, nir	                        \(nir + 0.5 - (0.5 * sqrt((2 * nir + 1)^2 - 8 * (nir - (2 * red))))\)
MSAVI2       Modified Soil Adjusted Vegetation Index 2	      Qi1994	                red, nir	                        \((2 * (nir + 1) - sqrt((2 * nir + 1)^2 - 8 * (nir - red)))/2\)
MTCIMERIS    Terrestrial Chlorophyll Index	                  DashAndCurran2004	       red, redEdge1, redEdge2	         \((redEdge2 - redEdge1)/(redEdge1 - red)\)
NBRI	       Normalised Burn Ratio Index	                     Garcia1991	             nir, swir3	                        \((nir - swir3)/(nir + swir3)\)
NDREI1	    Normalised Difference Red Edge Index 1	         GitelsonAndMerzlyak1994  redEdge2, redEdge1	               \((redEdge2 - redEdge1)/(redEdge2 + redEdge1)\)
NDREI2	    Normalised Difference Red Edge Index 2	         Barnes2000	             redEdge3, redEdge1	               \((redEdge3 - redEdge1)/(redEdge3 + redEdge1)\)
NDVI	       Normalised Difference Vegetation Index	         Rouse1974	             red, nir	                        \((nir - red)/(nir + red)\)
NDVIC	       Corrected Normalised Difference Vegetation Index	Nemani1993	             red, nir, swir2	                  \((nir - red)/(nir + red) * (1 - ((swir2 - swir2ccc)/(swir2coc - swir2ccc)))\)
NDWI	       Normalised Difference Water Index	               McFeeters1996	          green, nir	                        \((green - nir)/(green + nir)\)
NDWI2	       Normalised Difference Water Index	               Gao1996	                nir, swir2	                        \((nir - swir2)/(nir + swir2)\)
NRVI	       Normalised Ratio Vegetation Index	               Baret1991	             red, nir	                        \((red/nir - 1)/(red/nir + 1)\)
REIP	       Red Edge Inflection Point	                        GuyotAndBarnet1988	    red, redEdge1, redEdge2, redEdge3	\(0.705 + 0.35 * ((red + redEdge3)/(2 - redEdge1))/(redEdge2 - redEdge1)\)
RVI	       Ratio Vegetation Index		                                                 red, nir	                        \(red/nir\)
SATVI	       Soil Adjusted Total Vegetation Index	             Marsett2006	          red, swir2, swir3	               \((swir2 - red)/(swir2 + red + L) * (1 + L) - (swir3/2)\)
SAVI	       Soil Adjusted Vegetation Index	                   Huete1988	             red, nir	                        \((nir - red) * (1 + L)/(nir + red + L)\)
SLAVI	       Specific Leaf Area Vegetation Index	             Lymburger2000	          red, nir, swir2	                  \(nir/(red + swir2)\)
SR	          Simple Ratio Vegetation Index	                   Birth1968	             red, nir	                        \(nir/red\)
TTVI	       Thiam's Transformed Vegetation Index	             Thiam1997	             red, nir	                        \(sqrt(abs((nir - red)/(nir + red) + 0.5))\)
TVI	       Transformed Vegetation Index	                      Deering1975	          red, nir	                        \(sqrt((nir - red)/(nir + red) + 0.5)\)
#plot(vi1) e plot(vi2) are reformulated by incorporating the previous colors palette of colors dbyrb: plot(ndvi1, col=dbyrb) will display graphically reflectance's values in a darkblue, yellow, red and black colour scale:

plot(vi1, col=cl)

plot(vi2, col=cl)

#The evolution in the state of health of the vegetation of the dry forests of Mato Grosso can be graphically displayed in the time difference between ndvi1 and ndvi2 using the plot () function:

difndvi <- dvi1 - dvi2

#How to graphically visualize evolution in the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object difndvi? 

#I exploit a function (plot) to obtain visually the evolution in vegetation's state of health

#Syntaxis' function for Windows is: plot(difndvi)

#In R function plot plot(difndvi) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#With what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

bwrcp <- colorRampPalette(c('blue','white','red'))(100) 

#plot(dvi2) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(ndifdvi, col=bwrcp)

# The last vegetation index that I consider besides those applied to the dry forests of Mato Grosso in Brazil is for the vigor of the vegetation cover on a global scale (worldwide NDVI)

#copNDVIfunction() creates a RasterLayer (EPSG: 4326) of the global average NDVI value per pixel for the 21st of June over the period 1999-2017 with an overview of 5 KM

# Being a worldwide NDVI, the lack of a satellite image such as defor1 / defor2 is not limiting for the user. The plot () function must be applied directly to copNDVI:

plot (copNDVI)

#In plot (copNDVI), in addition to vegetation cover, I can distinguish the main oceans, seas and other hydrographic basins. Since this analysis is on the vegetational vigor on a global scale, how is it possible not to visualize the water?

#The values that identify water (253, 254 and 255) in copNDVI are to be transformed into N̲ot A̲ssigned values' through the cbind argument of the reclassify () function:

copNDVI <- reclassify (copNDVI, cbind (253: 255, NA))

#With the previous code string, in the plot (copNDVI) and in the future levelplot (copNDVI) the color of the catchment areas will be transparent so as not to impact on the analysis I am carrying out in R_code_vegetation_indices

#I exploit a function (levelplot) to draw level plots and contour plots

levelplot (copNDVI)

#Important: the above function is operative if and only if the user with the library function loads the previously installed rasterVis package

#Through levelplot (copNDVI) it is possible to observe the "breath" of the Earth from 1997 to 2020. The highest values in the graph are observable in correspondence of the forests-lungs such as the Amazon!

#Sequence of informatic commands for R_code_vegetation_indices.r

install.packages("raster")

install.packages("RStoolbox")

install.packages("rasterVis")

install.packages("rasterdiv")

library(raster) / require(raster)

library(RStoolbox)

library(rasterVis)

library(rasterdiv)

setwd("C:/lab/")

defor1 <- brick("defor1.jpg")

defor2 <- brick("defor2.jpg")

par(mfrow=c(2,1))

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

defor1

defor1$defor1.1

defor1$defor1.2

plot(defor1$defor1.1)

plot(defor1$defor1.2)

dvi1 <- defor1$defor1.1 - defor1$defor1.2

plot(dvi1)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi1, col= dbyrb)

plot(dvi1, col= dbyrb, main="DVI at time 1")

defor2

defor2$defor2.1

defor2$defor2.2

plot(defor2$defor2.1)

plot(defor2$defor2.2)

dvi2 <- defor2$defor2.1 - defor2$defor2.2

plot(dvi2)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi2, col=dbyrb, main="DVI at time 2")

par(mfcol=c(1,2)) / par(mfrow=c(2,1))

plot(dvi1, col=dbyrb, main="DVI at time 1")

plot(dvi2, col=dbyrb, main="DVI at time 2")

difdvi <- dvi1 - dvi2

dev.off()

bwrcp <- colorRampPalette(c('blue','white','red'))(100) 

plot(difdvi, col=bwrcp)

ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)

plot(ndvi1, col=dbyrb)

ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)

ndvi2 <- dvi2 / (defor2$defor2.1 + defor2$defor2.2)

plot(ndvi2, col=dbyrb)

par(mfcol=c(1,2))

plot(ndvi1, col=dbyrb, main="NDVI at time 1")

plot(ndvi2, col=dbyrb, main="NDVI at time 2 ")

library(RStoolbox)

vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)

plot(vi1, col=dbyrb)

vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)

plot(vi2, col=dbyrb)

difndvi <- ndvi1 - ndvi2

plot(difndvi, col=dbyrb)

plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

levelplot(copNDVI)

#-----------------------------------------------------------------------

#9. R code land cover

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

#-----------------------------------------------------------------------

#10.R code variability

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

#P̲rincipal C̲omponents A̲nalysis (PCA) is a technique applied to multispectral and hyperspectral remotely sensed data
                                
#PCA transforms an original correlated dataset into a substantially smaller set of uncorrelated variables that represents most of the information present in the original dataset
                                
#Instead of throwing away the redundant data, PCA condenses the information in intercorrelated variables into a few variables, called principal components
                                
#The first P̲rincipal C̲component (PC) accounts for maximum proportion of variance from the original dataset
                                
#All subsequent orthogonal components account for the maximum proportion of the remaining variance
                                
#Usually, PC 1, PC 2, and PC 3 account for the vast majority of the variance found within the dataset  
                                
#If, for example, components 1, 2, and 3 account for the majority of the variance found within the dataset, it can be possible to set the original bands aside, and the remainder of the image enhancement or classification process can be performed using just these three PC images 
                                
#Additionally, researchers can utilize PCs along with original bands to produce the desired combination for analysis

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

#---------------------------------------------------------------------------------------------------------------------------------------------------------------
# END FILE
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
