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
