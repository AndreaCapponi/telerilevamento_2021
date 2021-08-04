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








#From the 𝘯𝘢𝘮𝘦𝘴 category in the summary of defor1 information 
#If the user requires R's function plot(defor1) it will graphically display the reflectance values for the previous spectral bands?
#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''
#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)
#What will be the final syntaxis' function in Windows if my defor1's levels of "interest"² are two set of data which will be graphically visualized in their functional whole being as the spectral bands defor1.1² and defor1.2²?
#Final syntaxis' function in Windows for red (R) band B1 is: defor1$defor1.1
#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: defor1$defor1.2
#With plot(defor1$defor1.1) the user graphically will visualize the spectral band B1_sre:red stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself
#With plot(defor1$defor1.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself
#plot(defor1$defor1.1)
#plot(defor1$defor1.2)
#For each defor1 pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!
#dvi1 <- defor1 $ defor1.1 - defor1 $ defor1.2

#If the user requires adapted R's function plot(p224r63_2011, col=rmpcp) will display graphically reflectance's values for one of the previous spectral bands (B1:blue, B2:green, B3:red, B4:near-infrared, B5:mid-infrared, B6:far-infrared or B7:other mid-infrared)? 
#I exploit a function ($) to extract, from the initial (plot)¹ of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''
#Initial syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization)
#What will be the final syntaxis' function in Windows if my defor1's level of ''interest''² is the set of data which will be graphically visualized in their functional whole being as the spectral bands defor1.1 and defor1.2?

#With plot(p224r63_2011$B1_sre) the user graphically will visualize the spectral band B1_sre:blue stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself





#How to graphically visualize the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object defor1? 
#I exploit a function (plot) to obtain visually the vegetation's state of health
#Syntaxis' function for Windows is: plot(object)
#In R function plot (dvi1) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance
#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor1.1 to B2/defor1.2 representing each spectral bands
#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth
#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)
#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user
#If I want the aforementioned new palette of colors - which is given the name of bgwcp - represents a greyscale, first and last color will be black and white (B/W) respectively whereas second, third, etc. colors will be greys of which the number of depth levels vary from 4 to 256
#Final syntaxis' function in Windows is: cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
#plot(dvi) must be reformulated by incorporating new palette of colors bgwcp: plot(p224r63_2011, col=bgwcp) will display graphically reflectance's values for each spectral bands in a greyscale
#with what has been described so far, I create a futher new palette of colors called rmpcp in which first, second and last color will be red, magenta and pink respectively with number's value of depth levels taken to the extreme being 1000!
#Final syntaxis' function in Windows is: rmpcp <- colorRampPalette(c('red','magenta','pink'))(1000)
#cl <- colorRampPalette (c ('dark blue', 'yellow', 'red', 'black')) (100)
#plot (dvi1, col = cl)
#plot (dvi1, col = cl, main = "DVI at time 1")
#The calculation of the DVI index is according to the formula a difference between defor1 $ defor1.1 and defor1 $ 1.2 to represent for each pixel - which constitutes the original image defor1 - the reflectance value as the difference between those associated with the NIR and R bands!
#The plot of dvi1 shows the state of health of the vegetation of the dry forests of Mato Grosso through reflectance values measured by the ASTER sensor of the Earth satellite (EOS AM-1) where the more the green is intense, the more the trees of the aforementioned forest are in physiologically and ecologically optimal conditions

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
#Normalizazzione a NDVI
#NDVI (N͟ormalized D͟ifference V͟egetation I͟ndex) is another vegetation index calculated as the ratio between the difference (-) and the sum (+) of the near-infrared and red values respectively to the numerator and denominators: NDVI = (NIR – R)/(NIR + R)
– Ranges from -1 to 1
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
#spectralIndices: Spectral Indices
#Calculate a suite of multispectral indices such as NDVI, SAVI etc. in an efficient way.
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

plot(defor1$defor1.1)

plot(defor1$defor1.2)

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
