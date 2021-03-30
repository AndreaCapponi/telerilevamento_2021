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
#Loading required packages: sp is successful being classes and methods' database provider for spatial data 
#p224r63_2011_masked.grd is imported in R with brick function according to Windows' syntaxis in which: renowned object name = p224r63_2011 and original object name = p224r63_2011_masked.grd
#Final syntaxis' function in Windows is: p224r63_2011 <- brick('p224r63_2011_masked.grd')
#How to visualize informations of p224r63_2011 in R? 
#In R, visualizing informations of an object, name of it followed by enter as physical command by keyboard
#Important: any object name includes also informations about the number assigned to a sinusoid on space satellite's path (preceded by p letter) and of any parallel (preceded by letter r) that intersected it in a specific reference system: consequently the name of p224r63 object refers to the sinusoid numbered 224 on LANDSAT's path and to Earth's parallel numbered 63 that intersected the former in WGS84 reference system 
#The reference system further analyzed has been extracted from the informations of a generic object as crs in which the user through R can find in order: projection, zone, datum and units
#crs string in p224r63_2011's informations summary is for example: +proj=utm +zone=22 +datum=WGS84 +units=m +no_defs 
#If I want to obtain visually spectral bands in p224r63_2011?
#I exploit  a function (plot) to obtain visually spectral bands¹
#Syntax's function for Windows is: plot(object)
#In R function plot(p224r63_2011) lead me to a schedule with spectral bands explained graphically through the concept of reflectance
#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1_SRE to B7_SRE representing each spectral bands
#I exploit  a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth
#Syntax's function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)
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
#Syntaxis' function for Windows:par(multiframe, a graphical visualization of multiple object's level of ''interest'' organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array⁴(number of rows or columns required, number of columns or rows required))
#How would I combine the spectral bands B1_sre:blue and B2_sre:green as my p224r63_2011's level of ''interest'' from LANDSAT in a single graphic visualization solution organizing them by one row and two columns in an understandable multiframe for which par will be R's function of choice?
#Final syntaxis' function in Windows is: par(mfrow=c(1,2)) which has a functional significance if and only followed by plot(p224r63_2011$B1_sre) and plot(p224r63_2011$B2_sre)
#par(mfrow=c(1,2)) and par(mfcol=c(1,2)) syntactically and funtionally are different because the second - compared to the first one - will combine the spectral bands B1_sre:blue and B2_sre:green as my p224r63_2011's level of ''interest'' from LANDSAT in a single graphic visualization solution organizing them by one column and two rows in the required multiframe
#Which could be the final syntaxis' function in Windows if LANDSAT spectral bands of interest to us or to researchers will be B1_sre:blue, B2_sre:green, B3_sre:red and B4_sre:near-infrared (4/7)?
#Along the lines of what was suggested to visualize in a single graphic solution the first two of them through R's par function in multiframe, the final syntaxis' function in Windows will be: par(mfrow=c(4,1)) followed by #plot(p224r63_2011$B1_sre), plot(p224r63_2011$B2_sre), plot(p224r63_2011$B3_sre) and plot(p224r63_2011$B4_sre)
#Being the previously selected spectral bands of LANDSAT in even number, the best graphical visualization of B1_sre:blue, B2_sre:green, B3_sre:red and B4_sre:near-infrared is in a two rows x two columns multiframe square generated in a new window starting from an adapted R's function: par(mfrow=c(2,2)) followed by #plot(p224r63_2011$B1_sre), plot(p224r63_2011$B2_sre), plot(p224r63_2011$B3_sre) and plot(p224r63_2011$B4_sre)
#

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

#Al di sotto di questo commento tradurre e organizzare la lezione del 26/03/2021
#Visualizzare dati attraverso un plot RGB
#Definizione di RGB
#Di 7 B, 3 per volta per colorazione naturale!
#3 2 1 associazione per bande
#Qual è la funzione? Plot ma in RGB!
#Multulayered raster object red green blue plot
#plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')
#Quali bandi associamo a ogni elemento di LANDSAT?
#Argomeno ulteriore stretch: valori per la riflettanza (energia riflessa/energia totale tra 0 e 1) affinchè non ci sia un eccessivo stiramento nelle bande di colore (tutte le sfumatura possibili) 
#Se valori per esempio compresi tra 0,1 e o,5, attraverso una funzione lineare, li riporto tra 0 e 1! (Finalità di visualizzzazione grafica)
#Error in .rasterImagePlot(object, col = col, xlab = xlab, ylab = ylab,  : l'argomento 14 si associa a più argomenti formali
#La funzione non sfrutta il nome della banda perchè si indica il punto nel quale è collocata la banda corrispondente tramite numero integer
#Invece per l'nfrarosso?
#4 3 2 R G B, la banda blu viene eliminata!
#plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')
#Visualizzazione grafica della vegetazione per l'infrarosso (elevato valore per la riflettanza banda numero 4) riflessa contrariamente al primo plot dove l'interpretazione non sarebbe stata possibile 
#Visualizzazione in falsi colori in riferimento ai nostri occhi, ai nostri ''sensori''!
#plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin'), cosa accadrà?
#Vegetazione verde per spostamento dell'infrarosso sulla componente green di RGB
#Apprezzamento di maggiori dettagli nell'immagine p224r63_2011
#Viola=suolo nudo, senza vegetazione
#plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')
#giallo=suolo nudo, componente blu per l'infrarosso
#par montando le quatrro immagini con differenti plot in RGB 2 x 2 

par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')

#Salvare immagine con tasto destro semplice
#Come si fa a salvare una immagine in PDF in lab?
#funzione pdf()
#La sintassi è: pdf('ilnomedelpdf.pdf')
#dev.off per pulizia

pdf('ilnomedelpdfnuovotentativo.pdf')
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch='Lin')
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch='Lin')
dev.off()

#Lo strecht potrebbe anche essere istagram e non solamente lineare

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist')

# Com'è la nuova visualizzazione?
#Al dettaglio. Con questa visualizzaione si apprezzano i bacini e le reti idrografiche all'interno della foresta amazzonica in esame

#par natural colors, false colors and fals colors with hist

par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch='Lin')
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='Lin')
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch='hist')

#Ma la legenda?
#I colori non sono decisi dall'utente ma dipendono dai valori della riflettanza!
#Colorist: coloring wildlife distributions in space time
#





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
