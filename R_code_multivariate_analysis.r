#Al di sotto di questo commento studiare e organizzare la lezione del 23/04/2021

#Al di sotto di questo commento studiare e organizzare la lezione del 28/04/2021

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

##I exploit a function (brick) to import data from lab folder - external - to R - internal* -:

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

p224r63_2011res <- aggregate(p224r63_2011, fact=10)

#Risoluzione 30m x 30m x . y, il pixel 
#Fattore lineare 10 per allegerire l'immagine!

#fact= fattore di campionamento, quanto aumentare la grandezza del pixel/diminuire la risoluzione dell'immagine
#fun= funzione da utilizzare nella funzione aggregate
#resampling=ricampionamento
#p224r63_2011res <- aggregate(p224r63_2011, fact=10)
#p224r63_2011res
#Risoluzione 300m x 300m x . y, il pixel 
#par(mfrow=c(2,1))
#plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
#plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")
#Differenza tra l'immagine originale e l'immagine ricampionata
#Prncipal component ananlysis 
#Asse variabilità maggiore e asse variabilità minore per dimensione
#Qual è la funzione da adottare?
#rasterPCA
#p224r63_2011res_pca <- rasterPCA(p224r63_2011res)
#p224r63_2011res_pca
#Una mappa in uscita, un modello con informazioni 
#Come avere informazioni sul modello? Come si fa a legare mappa e/o modello a p224r63_2011res_pca?
#Funzione sommario -> objects summary
#summary(p224r63_2011res_pca$model)
#Schema originale, la banda del blu asse x mentre banda del verde asse y. La banda del blu è associata alla varianza 50% mentre la banda del blu al 50%!
#In questo schema la varianza in percentuale per la banda del blu PC1 spiega l'intera varianza del sistema essendo al 99,84%
#Per arrivare al 100%, tutte le componenti!
#99,998%, prime tre bande/componenti attarverso le prime bande!
#plot(p224r63_2011res_pca$map), prima banda tanta informazione ultima invece nulla.
#Cosa c'è a disposizione nel modello?
#$call, quale funzione è stata utilizzata? rasterPCA andando ad applicarla sull'immagine(img = p224r63_2011res)
#dev.off()
#plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="Lin")
#Nuove bande che diminuiscono la correlazione tra le variabili affinché comunque rappresentino in un numero limitato tramite bande selezionate dall'utente

#Sequence of informatic commands for R_code_multivariate_analysis.r

install.packages("raster")

install.packages("RStoolbox")

library(raster)

library(RStoolbox)

p224r63_2011 <- brick("p224r63_2011_masked.grd")

p224r63_2011

pairs(p224r63_2011)

p224r63_2011res <- aggregate(p224r63_2011, fact=10)

#p224r63_2011res <- aggregate(p224r63_2011, fact=10)
#p224r63_2011res
#par(mfrow=c(2,1))
#plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
#plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")
#p224r63_2011res_pca <- rasterPCA(p224r63_2011res)
#p224r63_2011res_pca
#plot(p224r63_2011res_pca$map)
#dev.off()
#plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="Lin")










