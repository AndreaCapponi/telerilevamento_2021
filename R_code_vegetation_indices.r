#Which is the title for R's developing code?
#My R code for vegetation indices
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
#Final syntaxis' function in Windows is: par(mfrow=c(2,1)) which has a functional significance if and only followed by plotRGB(defor1, r=1, g=2, b=3, stretch="lin") and plotplotRGB(defor2, r=1, g=2, b=3, stretch="lin")    

#Qual è il nome delle bande per le bande multispettralli del vicino all'infrarosso, rosso e verde?

#Al di sotto di questo commento studiare e organizzare la lezione del 30/04/2021
#DVI (D͟ifference V͟egetation I͟ndex) is the simplest vegetation index calculated as the difference between the near-infrared and red values: DVI = NIR - R
#Valori compresi tra -255 a +255, nel caso di un'immagine a 8 bit
#Normalizazzione a NDVI
#NDVI (N͟ormalized D͟ifference V͟egetation I͟ndex) is another vegetation index calculated as the ratio between the difference (-) and the sum (+) of the near-infrared and red values respectively to the numerator and denominators: NDVI = (NIR – R)/(NIR + R)
– Ranges from -1 to 1

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
