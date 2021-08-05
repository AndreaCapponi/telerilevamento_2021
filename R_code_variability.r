#Al di sotto commentare e organizzare la lezione del 19/05/2021

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

#How to calculate variance in sentinel?
##How to calculate variance in sentinel?
#The calculation of the variance is to be carried out exclusively on a band selected by the user through the moving window method
#The moving window method depends on the value of the standard deviation calculated on the values of a grid whose size is 3 x 3 pixels, attributing the final to the central
#The new map obtained externally has non-values while internally the values for the standard deviations to which to attribute different "colors"
#How to compact my three bands into one to apply the moving window method?
#With sentinel the names of the three bands of my interest are identified (the last sentinel.4 is created as an automatically empty slot) and I give them a synthetic and immediate name
#The calculation of the variance is to be carried out exclusively on a band selected by the user through the moving window method
#The moving window method depends on the value of the standard deviation calculated on the values of a grid whose size is 3 x 3 pixels, attributing the final to the central
#The new map obtained externally has non-values while internally the values for the standard deviations to which to attribute different "colors"
#How to compact my three bands into one to apply the moving window method?
#With sentinel the names of the three bands of my interest are identified (the last sentinel.4 is created as an automatically empty slot) and I give them a synthetic and immediate name

#Come effettuare il calcolo della varianza?
#Il calcolo della varianza è da effettuarsi esclusivamente su una banda selezionata dall'utente attraverso il metodo della moving window
#Il metodo della moving window dipende dal valore della deviazione standard calcolata sui valori di una griglia la cui grandezza è di 3 x 3 pixels attribuendo il finale al centrale
#La nuova mappa ottenuta ha esternamente dei non valori mentre internamente i valori per le deviazioni standard a cui attribuire "colorazioni" differenti
#Come compattare le mie tre bande in un'unica per applicare il metodo della moving window?
#Con sentinel si identificano i nomi delle tre bande di mio interesse (l'ultima sentinel.4 è creata come slot vuoto auotmaticamente) e do loro un nome sintetico e immediato

nir <- sentinel$sentinel.1

red <- sentinel$sentinel.2

#Io sfrutto l'indice di vegetazione NDVI (R_code_vegetation_indices.R) per compattare secondo la formula ndvi <- (nir-red) / (nir+red) ed effettuo il plot

plot(ndvi)

#Per una migliore interpretazione dell'immagine ottenuta, perchè non creare un'altra palette di colori che la facilitino?

cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) 

plot(ndvi,col=cl)

#Calcolare la variabilità dell'immagine è ora possibile andando a calcolare la deviazione standard con il metodo della moving window attraverso la funzione focal
#focal: Focal values -> Calculate focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function.

ndvisd3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

#La moving window è quadrata per evitare l'anisotropia andando a compromettere il calcolo dei valori per assi X e Y che distorcerebbero l'interpretazione dei dati

plot(ndvisd3)

#La colorRampPalette non facilita l'interpretazione dei dati nel grafico recentemente ottenuto

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd3, col=clsd)

#La media invece quali informazioni da rispetto a quello che abbiamo visualizzato finora?

ndvimean3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(ndvimean3)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvimean3, col=clsd)
     
par(mfrow=c(1,2))

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(ndvimean3, col=clsd)

plot(ndvisd3, col=clsd)

#A questo punto è possibile cambiare la grandezza della finestra a mio piacimento. Attenzione il numero dei pixels deve essere dispari per avere ogni qualvolta un pixel centrale singolo per calcolare il valore della deviazione standard

ndvimsd7 <- focal(ndvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)

plot(ndvisd7)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd7, col=clsd)

#La risoluzione dell'immagine originale non viene modificata, è il calcolo che l'utente effettua è responsabile di variazioni nella visualizzazione grafica della variabilità (da valori minimi per un'indagine locale a valori espansivi per un'indagine globale)

ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 

plot(ndvisd5, col=clsd)

#E' possibile sfruttare anche un'analisi multivariata andando a considerare esclusivamente la componente PC1 sulla quale far scorrere la moving window ottenendone una mappa per la variabilità secondo valori della deviazione standard

#La funzione a cui mi appoggio è rasterPCA che è contenuto nel pacchetto RSToolbox che abbiamo già richiamato all'inizio del codice

sentinelpca <- rasterPCA(sentinel)

plot(sentinelpca$map)

#Attenzione! E' da legare la mappa successivamente all'analisi sennò Error in xy.coords(x, y, xlabel, ylabel, log) : 
  'x' is a list, but does not have components 'x' and 'y'

sentinelpca

#Quanta variabilità iniziale spiegano le singole componenti?

#summary(sentinelpca$map)

#Il PC1 spiega il 67,368% dell'informazione contenuta nell'immagine originale!

#Su quale banda vogliamo agire?

#Com'è fatta la sua mappa?

#La prima componente si chiama PC1. Come usare eslusivamente la prima componente?

PC1 <-sentinelpca$map$PC1

#Qualsiasi funzione in R è da rinominare in oggetti che sono maggiormente gestibili rispetto a stringhe di codice

PC1sd5 <- focal(PC1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(PC1sd5, col=clsd)

PC1sd13 <- focal(PC1, w=matrix(1/169, nrow=13, ncol=13), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(PC1sd13, col=clsd)

#Forte variabilità geo-morfologica imputabile alla presenza di creste, crepacci, ...

#La vegetazione rappresentata dal colore blu è omogenea e va a rappresentare una o più praterie mentre l'aumento di variabilità è osservabile nella transazione tra praterie e rocce

#La funzione source richiama un pezzo di codice che si è creato

#source: Read R Code from a File, a Connection or Expressions

#source causes R to accept its input from the named file or URL or connection or expressions directly. Input is read and parsed from that file until the end of the file is reached, then the parsed expressions are evaluated sequentially in the chosen environment.

#Nella cartella lab io ho source_test_lezione.rFile

source("source_test_lezione.r")

#Error in eval(ei, envir) : oggetto "sentpca" non trovato

#La mia pca si chiama sentinelpca, è da modificare il file che il professore ha caricato su Virtuale

#library(viridis) for ggplot2 coloring

source("source_ggplot.r")

#La correzione dei nomi fa agire la funzione indipendentemente dal creatore di questa stringa di codice!

#Inizialmente si deve creare una finestra all'interno della funzione ggplot come ggplot() (creazione di un'area di lavoro completamente vuota)

#L'aggiunta di elementi in ggplot2 avviene per blocchi, quindi dopo ggplot() segue la somma come operazione +

#Poi è da definirsi la geometria dipendentemente dal grafico che voglio creare tramite questa funzione. Essendo pixels io sfrutto la funzione è geom_raster()

#La sintassi della funzione finora è ggplot() +
geom_raster(PC1sd5, ...)

#L'estetiche sono definite attraverso il 

#La sintassi aggiornata è:ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))

#Questo è il metodo migliore per indentificare a livello geografico delle discontinuita, in ambito geologico qualsiasi variabilità mentre in ecologia l'ecotonia
#Qual è il punto con la maggiore variabilità? Maggiore variabilità geo-morfologica in alto a sinistra

#https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html

# The package contains eight color scales: “viridis”, the primary choice, and five alternatives with similar properties - “magma”, “plasma”, “inferno”, “civids”, “mako”, and “rocket” -, and a rainbow color map - “turbo”

#Come si chiama la funzione per creare le legende per ciascun grafico in ggplot?

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))

#Come aggiungere la legenda di default per il pacchetto viridis?

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()

#Come aggiungere un titolo? L'argomento non è più main ma ggtitle

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis()+ggtitle("Standard deviation of PC1 by viridis colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="magma")+ggtitle("Standard deviation of PC1 by magma colour scale")

#scale_fill_viridis, search on Google because is an option for another legend

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="inferno")+ggtitle("Standard deviation of PC1 by inferno colour scale")

ggplot() +
geom_raster(PC1sd5, mapping = aes( x = x, y = y, fill = layer))+
scale_fill_viridis(option="turbo")+ggtitle("Standard deviation of PC1 by turbo colour scale")

#Tre mappe disponibili: viridis, magma e turbo a cui associo loro dei nomi per creare successivamente un grid arrange

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

#La variabilità è studiabile attraverso la funzione focal

#E' possibile esportare stringhe di codice per proseguire nella creazione o nello studio attraverso la funzione source

#Con ggplot2 è possibile andare a graficare la variabilità citata precedentemente

#Sequence of informatic commands for R_code_variability.r

install.packages("raster")

install.packages("RStoolbox")

library(raster)

library(RStoolbox)

setwd("C:/lab/")

sentinel <- brick("sentinel.png")

plotRGB(sentinel)

nir <- sentinel$sentinel.1

red <- sentinel$sentinel.2

plot(ndvi)

cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) 

plot(ndvi,col=cl)

ndvisd3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)

plot(ndvisd3)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd3, col=clsd)

ndvimean3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(ndvimean3)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvimean3, col=clsd)
     
par(mfrow=c(1,2))

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(ndvimean3, col=clsd)

plot(ndvisd3, col=clsd)

ndvimean3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)

plot(ndvimean3)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvimean3, col=clsd)
     
par(mfrow=c(1,2))

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(ndvimean3, col=clsd)

plot(ndvisd3, col=clsd)

ndvimsd7 <- focal(ndvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)

plot(ndvisd7)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 

plot(ndvisd7, col=clsd)

ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 

plot(ndvisd5, col=clsd)

sentinelpca <- rasterPCA(sentinel)

plot(sentinelpca$map)

sentinelpca

PC1 <-sentinelpca$map$PC1

PC1sd5 <- focal(PC1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(PC1sd5, col=clsd)

PC1sd13 <- focal(PC1, w=matrix(1/169, nrow=13, ncol=13), fun=sd)

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)

plot(PC1sd13, col=clsd)

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

