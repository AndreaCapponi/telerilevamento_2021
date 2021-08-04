#R code complete - Telerilevamento Geo-Ecologico
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

#1. Remote Sensing - first code

#Title for R's developing code
#My first R code for remote sensing
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
##Error in col2rgb(colors, alpha = alpha) : invalid color name 'fuchsia' rmpcp <- colorRampPalette(c('red','magenta','fuchsia','pink'))(1000) where fuchsia in RGB's color gamut doesn't exist being unobtainable through the addition of primary colors!
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
#My R code for a time series
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
##Initial syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization)
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
##The last operation will be to merge the raster layer objects from 1979annual_melt to 2007annual_melt - contained in the melt_import list imported into R - into a multi-layer raster object whose name I have chosen will be melt through a new function called stack 
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

#-----------------------------------------------------------------------

#7. R code ggplot2





























