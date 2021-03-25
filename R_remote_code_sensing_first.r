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
#Important: any object name includes also informations about the number assigned to a sinusoid on space satellite's path (preceded by p letter) and of any parallel (preceded by letter r) that intersected it in a specific reference system: consequently the name of p224r63 object refers to the sinusoid numbered 224 on LANDSAT's path and to Earth's parallel numbered 63 that intersected the former in WGS84 reference system 
#The reference system further analyzed has been extracted from the informations of a generic object as crs in which the user through R can find in order: projection, zone, datum and units
#crs string in p224r63_2011's informations summary is for example: +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#If I want to obtain visually spectral bands in p224r63_2011?
#I exploit  a function (plot) to obtain visually spectral bands ¹
#Syntaxis' function for Windows is: plot(object)
#In R function plot(p224r63_2011) lead me to a schedule with spectral bands explained graphically through the concept of reflectance
#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1_SRE to B7_SRE representing each spectral bands
#I exploit  a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth
#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)
#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user
#If I want the aforementioned new palette of colors - which is given the name of bgwcp - represents a greyscale, first and last color will be black and white (B/W) respectively whereas second, third, etc. colors will be greys of which the number of depth levels vary from 4 to 256
#Final syntaxis' function in Windows is: bgwcp <- colorRampPalette(c('black','grey','white'))(100)
#The previous R's function plot(p224r63_2011) must be reformulated by incorporating new palette of colors bgwcp: plot(p224r63_2011, col=bgwcp) will display graphically reflectance's values for each spectral bands in a greyscale
#with what has been described so far, I create a futher new palette of colors called rmpcp in which first, second and last color will be red, magenta and pink respectively with number's value of depth levels taken to the extreme being 1000!
#Final syntaxis' function in Windows is: rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)
#If in the final syntaxis' function for Windows systems is included a color (first, second, ..., last) freely selected by the user but unobtainable through an additive color model which is RGB (color gamut is created from red, green and blue as primary colors) therefore will be displayed the underlying string ↓
##Error in col2rgb(colors, alpha = alpha) : invalid color name 'fuchsia' rmpcp <- colorRampPalette(c('red','magenta','fuchsia','pink'))(1000) where fuchsia in RGB's color gamut doesn't exist being unobtainable through the addition of primary colors!
#Adapted R's function plot(p224r63_2011, col=rmpcp) will display graphically reflectance's values for each spectral bands in a colorscale invented starting from scratch by the user
#If the user requires adapted R's function plot(p224r63_2011, col=rmpcp) will display graphically reflectance's values for one of the previous spectral bands (B1: blue, B2: green, B3: red, B4:near-infrared, B5:mid-infrared, B6: far-infrared or B7: other mid-infrared)? 
#I exploit a function dev.off() to end a graphical display depending on the R's (plot) function and if it is syntactically correct, the user will see this message appears: null device 1
#Error in dev.off() : cannot shut down the device 1 (dispositivo null) message appears exclusively when the user has closed manually graphical display's window clicking on the x at the top right
#I exploit a function ($) to extract, from the initial (plot)¹ of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''
#Syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization)
#Final syntaxis' function in Windows is: plot(p224r63_2011$B1_sre) if for example the only spectral band in p224r63_2011 I would graphically visualize is B1: blue!
#

#Al di sotto di questo commento tradurre e organizzare la lezione del 19/03/2021
#p224r63? path 224, sinusoide landsat righe ro, come paralleli quindi r 63 csr sistema di riferimento coordinate punti punto centrale immagine landsat stessa immagine nel tempo per monitoraggio area
#crs: zone=fuso coordinates x min x max y min ymax datum wgs 84 proiezione utm unità di misura su carta in metri da gradi coordinate dell'immagine raster brick + uniti tra di loro 4447533 pixels per banda risoluzione 30x30 metri bande specifiche banda1 blu banda 2 verde banda 3 rosso banda 4 NIR banda 5 SW red banda 6 infrarosso termico banda 7 infrarosso medio

#Al di sotto di questo commento tradurre e organizzare la lezione del 24/03/2021
#sp gestione dati all'interno del nostro software, classes and methods for spatial data 
#centro foresta amazzonica p224r63r

# plot band 1 with a predefined colut ramp palette
#> rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)
#plot(p224r63_2011$B1_sre, col=rmpcp)
#plot singole bande tramite la funzione par
#grafico con due plot per bande B1 e B2, questo è un multiframe MF
#1 riga, 2 colonne: par(mfrow =c(1,2)) grafico interno, row prima numero righe, col prima numero colonne
#Bande successive tramite plot si sovrappongono nel grafico quindi è funzionale creare un multiframe con le bande di mio interesse andando a descrivere come R organizzerà le immagini in un grafico R
# par(mfrow=c(1,2))
# plot(p224r63_2011$B1_sre)
# plot(p224r63_2011$B2_sre)
# par(mfcol=c(1,2))
# plot(p224r63_2011$B1_sre)
# plot(p224r63_2011$B2_sre)
#plot the first four bands of landsat
#par(mfrow=c(4,1))
#plot(p224r63_2011$B1_sre)
#plot(p224r63_2011$B2_sre)
#plot(p224r63_2011$B3_sre)
#plot(p224r63_2011$B4_sre)
#Come cambiare la configurazione per la visualizzazione?
#Quadrato 2 x 2 
#par(mfrow=c(2,2))
#plot(p224r63_2011$B1_sre)
#plot(p224r63_2011$B2_sre)
#plot(p224r63_2011$B3_sre)
#plot(p224r63_2011$B4_sre)
#Quadrato 2 x 2 con color palette per ciascuna banda
#par(mfrow=c(2,2)) 
#clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
#plot(p224r63_2011$B1_sre, col=clb)
#clg <- colorRampPalette(c("dark green","green","light green")) (100)
#plot(p224r63_2011$B2_sre, col=clg)
#clg <- colorRampPalette(c("dark green","green","light green")) (100)
#plot(p224r63_2011$B2_sre, col=clg)
#clnir <- colorRampPalette(c("red","orange","yellow")) (100)
#plot(p224r63_2011$B4_sre, col=clnir)
#sempre prima multiframe per la collocazione delle bande corrette nel colore per i valori della riflettanza
#é importatntissimo che sia l'utente a scegliere il plottaggio delle immagini in telerilevamento! 


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
