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
#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need ' '* 
#Loading required packages: sp is successful
#p224r63_2011_masked.grd is imported in R with brick function according to Windows' syntaxis in which: renowned object name = p224r63_2011 and original object name = p224r63_2011_masked.grd
#Final syntaxis' function in Windows is: p224r63_2011 <- brick('p224r63_2011_masked.grd')
#How to visualize informations of p224r63_2011 in R? 
#In R, visualizing informations of an object, name of it followed by enter as physical command by keyboard
#If I want to obtain visually frequence bands in p224r63_2011?
#I exploit  a function (plot) to obtain visually spectral bands
#Syntaxis' function for Windows is: plot(object)
#In R function plot(p224r63_2011) lead me to a schedule with spectral bands explained graphically through the concept of reflectance
#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1_SRE to B7_SRE representing each spectral bands
#I exploit  a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth
##Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)
#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user
#If I want the aforementioned new palette of colors - which is given the name of bgwcp - represents a greyscale, first and last color will be black and white (B/W) respectively whereas second, third, etc. colors will be greys of which the number of depth levels vary from 4 to 256
#Final syntaxis' function in Windows is: bgwcp <- colorRampPalette(c('black','grey','white'))(100)
#The previous R's function plot(p224r63_2011) must be reformulated by incorporating new palette of colors bgwcp: plot(p224r63_2011, col=bgwcp) will display graphically reflectance's values for each spectral bands in a greyscale
#with what has been described so far, I create a futher new palette of colors called rmpcp in which first, second and last color will be red, magenta and pink respectively with number's value of depth levels taken to the extreme being 1000!
#Final syntaxis' function in Windows is: rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)
#Adapted R's function plot(p224r63_2011, col=rmpcp) will display graphically reflectance's values for each spectral bands in a colorscale invented starting from scratch by the user
#Al di sotto di questo commetto tradurre e organizzare la lezione del 19/03/2021
#codice errore colore non in RGB, precedente all'hashtag del commento Error in col2rgb(colors, alpha = alpha) : invalid color name 'fuchsia' rmpcp <- colorRampPalette(c('red','magenta','fuchsia','pink'))(1000)
#p224r63? path 224, sinusoide landsat righe ro, come paralleli quindi r 63 csr sistema di riferimento coordinate punti punto centrale immagine landsat stessa immagine nel tempo per monitoraggio area
#crs: zone=fuso coordinates x min x max y min ymax datum wgs 84 proiezione utm unità di misura su carta in metri da gradi coordinate dell'immagine raster brick + uniti tra di loro 4447533 pixels per banda risoluzione 30x30 metri bande specifiche banda1 blu banda 2 verde banda 3 rosso banda 4 NIR banda 5 SW red banda 6 infrarosso termico banda 7 infrarosso medio
#Sequence of informatic commands for R_remote_code_sensing_first.r

install.packages('raster')

library(raster)

setwd('C:/lab/')  

p224r63_2011 <- brick('p224r63_2011_masked.grd')

plot(p224r63_2011)

bgwcp <- colorRampPalette(c('black','grey','white'))(100)

plot(p224r63_2011, col=bgwcp)

rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)

plot(p224r63_2011, col=rmpcp)
