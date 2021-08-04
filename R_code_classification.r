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

##In R, to visualize information of SO, name of it followed by Enter ↵ as physical command by keyboard:

SO

#plotRGB() is a Red-Green-Blue plot based on three layers (in a RasterBrick or RasterStack) combined such that they represent the red, green and blue channel. Through plotRGB () it is possible to graphically visualize SO in the colors of the visible spectrum before its download from the ESA website https://www.esa.int/ESA_Multimedia/Sets/Solar_Orbiter_first_images/(result_type)/images:

plotRGB(SO, 1,2,3, stretch="lin")

#The classification of a satellite image depends on the reflectance values attributed to each pixel

#The values for reflectance vary in the red, green and blue (RGB) bands and two or more pixels will be "merged" to form a class if and only if they have a superimposable value

#These pixels will be placed in a multispectral region as a point cloud which, together with others in a three-dimensional reference system, define the spectrum through which the satellite image is displayed

#The above classification can be effectuated with a training set consisting of: 1) a reference satellite image and 2) the model with which there should be a classification of the pixels depending on their reflectance values or with the unsuperClass () function, where the classification of pixels depending on their reflectance values, on the other hand, occurs randomly!

#

#Unsupervised Classification / Unsupervised clustering of Raster* data using kmeans clustering

SOc <- unsuperClass(SO, nClasses=3)



#La classificazione delle immagini avviene per accorpamento di pixel con valori sovrapponibili o simili di bit per la riflettanza!
#Tre livelli energetici sul Sole che andranno classificati successivamente
#Il valore di pixel per un bosco nelle tre bande b, r e v dipende dalle stesse: assorbimento nel b, valore basso assorbimento nel r, valore basso, riflettanza nel verde, valore alto
#Un altro pixel per il bosco quali valore avrà? Identici o simili grafico tre assi per individuare punti valori per pixels
#Un pixel di acqua invece avrà valori differenti e il grafico tridimensionale (spazio multispettrale) rispecchierà la differenza nella natura dei pixel
#Classi da pixel che sono campioni dalla popolazione intera per lo spazio multispettrale
#Training set, classificazione dei pixel nell'immagine che ha campionato come di riferimento
#Distanza spazio multispettrale da nuvola punti campionati, appartenenza alla classe 
#Maximum lighhood

#Funzione unsuperClass img nome dell'immagine, nSamples numero dei pixels campionati, nClasses numero delle classi
#soc <- unsuperClass(so, nClasses=3)
#associazione classificazione con nome selezionato da me o dall'utente
#modello di classificazione da pixel random


#Ma il plot?
#Il plot di soc è costituito da più componenti, quindi si deve plottare interamente la mappa come immagine classificata
#plot(soc$map)
#per fare una classificazione sempre uguale e non variabile dipendentemente dal campionamento casuale dei pixel
#Funzione set.seed(42)
#sonew <- unsuperClass(so, nClasses=20)
#sonew
#plot(sonew$map)
#cl <- colorRampPalette(c('yellow','red','black'))(100)

#Download image from Solar Orbiter site: Solar_Orbiter_s_high-resolution_view_of_the_Sun
sun <- raster("Solar_Orbiter_s_high-resolution_view_of_the_Sun.png")
sunc <- unsuperClass(so, nClasses=3)
plot(sunc$map)

#Grand canyon ununsupervised classification
#Come eliminare le nuvole o evitare un'errata classificazione per loro colpa?
#1a soluzione, mask!
#2a soluzione, inserite nella classificazione e successivamente ammettere il ''rumore'' prodotto nei dati
#3a, altra tipologia di sensore ATTIVO (laser o radar)
# To create a colour palette:
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(sunc$map,col=cl)
# 23/04/21
# Using the brick function to import a multi-layered raster:
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, r=1, g=2, b=3, stretch="lin") #linear stretch
plotRGB(gc, r=1, g=2, b=3, stretch="hist") #histogram stretch
# We don't use the full colour spectrum because of colour blindness.
# Unsupervised classifications:
gcc2 <- unsuperClass(gc, nClasses=2)
plot(gcc2$map)
gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)


#Sequence of informatic commands for R_code_classification.r

install.packages("raster")

install.packages("RStoolbox")

library(raster)

library(RStoolbox)

setwd("C:/lab/")

SO <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(SO, 1,2,3, stretch="lin")

SOc <- unsuperClass(so, nClasses=3)

plot(SOc$map)

set.seed(42)

newSOc <- unsuperClass(SO, nClasses=20)

sonew

plot(sonew$map)

sun <- raster("Solar_Orbiter_s_high-resolution_view_of_the_Sun.png")

sunc <- unsuperClass(so, nClasses=3)

plot(sunc$map)

cl <- colorRampPalette(c('yellow','black','red'))(100)

plot(sunc$map,col=cl)

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

plotRGB(gc, r=1, g=2, b=3, stretch="lin") 

plotRGB(gc, r=1, g=2, b=3, stretch="hist") 

gcc2 <- unsuperClass(gc, nClasses=2)

plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses=4)

plot(gcc4$map)







