#Which is the title for R's developing code?
#My R code for vegetation indices
#Which folder must R use in the computer?
#In the computer R must use the folder named simply lab
#I exploit a function (setwd) for the association between R and greenland subfolder
#Adapted syntaxis' function for Windows is: setwd("C:/name of the folder in which there is a subfolder of interest to the user/name of the subfolder which will be associated with R")
#Final syntaxis' function for Windows is: setwd("C:/lab/greenland")
#After the association between R and greenland subfolder, how I import data from greenland subfolder to R?
#In a different way from the R_remote_code_sensing_first.r, although I still exploit a function to import data from greenland subfolder - external - to R - internal¹ - this will be raster and not brick because our data does not represent a multi-layer raster object³ but raster layer² objects!
#Syntaxis' function for Windows is: renowned object name <- raster("original object name")
#Previous function is based on install.packages("raster"): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)¹ 
#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!
#Loading required packages: sp is successful being classes and methods' database provider for spatial data 
#I exploit  a function (brick) to import data from lab folder - external - to R - internal* -
#Syntaxis' function for Windows is: renowned object name <- brick('original object name')
#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)* 
#Loading required packages: sp is successful being classes and methods' database provider for spatial data 
#p224r63_2011_masked.grd is imported in R with brick function according to Windows' syntaxis in which: renowned object name = p224r63_2011 and original object name = p224r63_2011_masked.grd
#Final syntaxis' function in Windows is: p224r63_2011 <- brick('p224r63_2011_masked.grd')

#library(raster)/require(raster)
The library() by default returns an error if the requested package does not exist.

example:
> library(xyz)
Error in library(xyz) : there is no package called ‘xyz’

The require() is designed to be used inside functions as it gives a warning message and returns a logical value say, FALSE if the requested package is not found and TRUE if the package is loaded.

example:
> require(xyz)
Loading required package: xyz
Warning message:
In library(package, lib.loc = lib.loc, character.only = TRUE, logical.return = TRUE, :
there is no package called ‘xyz’
#setwd("C:/lab/") 
           
           
#defor1 <- brick("defor1.jpg")
#defor2 <- brick("defor2.jpg")
#banda 1 = NIR, banda 2 = red e banda 3 = green
#par(mfrow=c(2,1))
#plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
#plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#Al di sotto di questo commento studiare e organizzare la lezione del 30/04/2021
#DVI = lambda NIR - lambda RED
#Valori compresi tra -255 a +255, nel caso di un'immagine a 8 bit
#Normalizazzione a NDVI
#NDVI = ?
#DVI1, come si chiamano le bande per NIR E RED?
#Digitare il nome del file originale per trovare il nome delle bande
#defor1 Enter
#defor1.1, defor1.2, defor1.3 = NIR, RED and ...
#Nome dataset e banda per legare con la funzione dollaro
#defor1$defor1.1, prima banda per NIR!
#defor1$defor1.2, seconda banda per RED!
#Per ogni pixel stiamo prendendo il valore nella banda dell'infrarosso e il valore nella banda nel rosso in differenza. In uscita una mappa formata da pixel in differenza per i valori precedenti!
#dvi1 <- defor1$defor1.1 - defor1$defor1.2
#plot(dvi1)
#Stato di salute, giallo meh verde ottimo. Cambiare colorazione per apprezzare meglio tale indice di vegetazione!
#cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
#plot(dvi1, col=cl)
#plot(dvi1, col=cl, main="DVI at time 1")
#defor2 Enter
#defor2$defor2.1, prima banda per NIR!
#defor2$defor2.2, seconda banda per RED!
#dvi2 <- defor2$defor2.1 - defor2$defor2.2
#plot(dvi2)
#cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
#plot(dvi2, col=cl, main="DVI at time 2")
#par(mfcol=c(1,2)) o par(mfrow=c(2,1))
#plot(dvi1, col=cl, main="DVI at time 1")
#plot(dvi2, col=cl, main="DVI at time 2")
#Qual è stata la differenza nella stessa zona in due lassi temporali differenti?
#difdvi <- dvi1 - dvi2
#In dvi1 - dvi2 :
#Raster objects have different extents. Result for their intersection is returned
#Nuova color palette per qualsiasi differenza e nuova legenda 
#dev.off()
#cld <- colorRampPalette(c('blue','white','red'))(100) 
#plot(difdvi, col=cld)
#Quali sono i punti nella nostra aree dove c'è stata una sofferenza della vegetazione nel tempo!
#NDVI per le due situazioni?
#Nel cambiare il numero di bit, per esempio uguale a 16, i valori varieranno da 0 65535!
#DVI della seconda immagine sarà quel valore ma le immagini non sono paragonabili avendo differente risoluzione radiometriche.
#Il massimo valore assumibile in NDVI è 1! Differenza su somma, 65535 - 0 e 65535 + 0
#Il range per i valori dell'NDVI è sempre lo stesso: -1 a +1!
#Attenzione: alcuni software lavorano in maniera sequienzale senza effettuare un calcolo secondo una logica matematica. Suggerimento, parentesi tonde, quadre e graffe!
#(NIR - RED) / (NIR + RED)
#ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
#plot(ndvi1, col=cl)
#Una mia collega ha suggerito semplicemente di sostituire (defor1$defor1.1 - defor1$defor1.2) con dvi1 perchè già è stato calcolato. Una sintassi accettabile e funzionale
#ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)
#ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
#plot(ndvi2, col=cl)
#par(mfcol=c(1,2))
#plot(ndvi1, col=cl, main="NDVI at time 1")
#plot(ndvi2, col=cl, main="NDVI at time 2 ")
#RSToolbox Spectral Indices
#library(RStoolbox)
#vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)
#plot(vi1, col=cl)
#vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
#plot(vi2, col=cl)
#Firma spettrale, RED NIR valori che oscillano per stato di salute della vegetazione up and down, malata down and up sana
#difndvi <- ndvi1 - ndvi2
#plot(difndvi, col=cl)
#Risultato corretto?
##Al di sotto di questo commento studiare e organizzare la lezione del 05/05/2021
#Indice di vegetazione su scala globale (worldwide NDVI)
#Il pacchetto da installare è rasterdiv (raster diversity)
#La sintassi per l'installazione è: install.packages("rasterdiv")
#Per caricare tale pacchetto la sintassi su cui basarsi è: library(rasterdiv)
#Come effettuare il plot di copNDVI?
#La sintassi è semplicemente: plot(copNDVI)
#Come eliminare l'acqua?
#I valori che identificano l'acqua (253, 254 e 255) sono da trasformare in non valori NA's attraverso l'argometo cbind della funzione reclassify
#La sintassi definitiva è: copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
#I due punti definiscono il range di valori da trasformare. Il risultato ottenuto tramite plot(copNDVI) è in sfondo bianco e non più blu!
#library(rasterVis)
#levelplot(copNDVI)
#Come la Terra ha respirato dal 1997 al 2020. I valori più alti sono osservabili in corrispondenza delle foreste come l'Amazzonica (i valori medi tra pixels riga/colonna hanno bit di informazione elevati in opposizione a quelli rappresentanti i pixels riga/colonna per i deserti alla latitudine 23,7 Tropico del Cancro)


#Sequence of informatic commands for R_code_vegetation_indices.r

library(raster) / require(raster)

setwd("C:/lab/")

defor1 <- brick("defor1.jpg")

defor2 <- brick("defor2.jpg")

par(mfrow=c(2,1))

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

defor1

defor1$defor1.1

defor1$defor1.2

dvi1 <- defor1$defor1.1 - defor1$defor1.2

plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi1, col=cl)

plot(dvi1, col=cl, main="DVI at time 1")

defor2

defor2$defor2.1

defor2$defor2.2

dvi2 <- defor2$defor2.1 - defor2$defor2.2

plot(dvi2)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi2, col=cl, main="DVI at time 2")

par(mfcol=c(1,2)) / par(mfrow=c(2,1))

plot(dvi1, col=cl, main="DVI at time 1")

plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- dvi1 - dvi2

dev.off()

cld <- colorRampPalette(c('blue','white','red'))(100) 

plot(difdvi, col=cld)

ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)

plot(ndvi1, col=cl)

ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)

plot(ndvi2, col=cl)

par(mfcol=c(1,2))

plot(ndvi1, col=cl, main="NDVI at time 1")

plot(ndvi2, col=cl, main="NDVI at time 2 ")

library(RStoolbox)

vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)

plot(vi1, col=cl)

vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)

plot(vi2, col=cl)

difndvi <- ndvi1 - ndvi2

plot(difndvi, col=cl)

install.packages("rasterdiv")

library(rasterdiv)

plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

library(rasterVis)

levelplot(copNDVI)
