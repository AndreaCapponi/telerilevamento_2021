#Code time series 
#Greenland increases of temperature
#Data and code from Emanuela Cosma
#library
#setwd# install.packages("raster")
library(raster)
 
setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac
> install.packages("RStoolbox")
provo con l'URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/RStoolbox_0.2.6.zip'
Content type 'application/zip' length 2170101 bytes (2.1 MB)
downloaded 2.1 MB

package ‘RStoolbox’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\PC\AppData\Local\Temp\RtmpEx7d3z\downloaded_packages
> library(RStoolbox)

Useremo questi pacchetti: raster (già installato) e rasterVis. Quindi:

install.packages("rasterVis") # attenzione alla maiuscola e virgolette perché usciamo da R
The downloaded binary packages are in
        C:\Users\PC\AppData\Local\Temp\RtmpekzTGh\downloaded_packages

#Al di sotto di questo commento studiare e organizzare la lezione del 07/04/2021

#Title for R's developing code
#My R code for time series
#Which folder must R use in the computer?
#In the computer R must use the folder named simply greenland
#I exploit a function (setwd) for the association between R and greenland folder
#Syntaxis' function for Windows is: setwd(''C:/lab/greenland'')
#After the association between R and greenland folder, how I import data from lab folder to R?
#I exploit  a function (raster) to import data from lab folder - external - to R - internal* -
#Perchè la funzione raster e non brick? C'è una differenza o ci sono delle differenze?
#Syntaxis' function for Windows is: renowned object name <- raster('original object name')
#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)* 
#Loading required packages: sp is successful being classes and methods' database provider for spatial data 
#lst_2000.tif, lst_2005.tif, lst_2010.tif and lst_2015.tif are imported in R with raster function according to Windows' syntaxis in which: renowned object name = lst_2000,lst_2005, lst_2010 and lst_2015 and original object name = lst_2000.tif, lst_2005.tif, lst_2010.tif and lst_2015.tif
#Final syntaxis' function in Windows is: lst_2000 <- raster('lst_2000.tif'),lst_2000 <- raster('lst_2005.tif'), lst_2010 <- raster('lst_2010.tif') and lst_2015 <- raster('lst_2015.tif')
#If I want to obtain visually spectral bands in p224r63_2011?
#I exploit  a function (plot) to obtain visually spectral bands¹
#Syntaxis' function for Windows is: plot(object)
#In R function plot(p224r63_2011) lead me to a window with spectral bands explainable graphically through the concept of reflectance
#La funzione plot applicata singolarmente a ciascun raster è una procedura lenta e non efficiente!
#For the user $ function's relevance in R is manifest at a higher level with the function (par) through which there is the possibility of combining multiple object's level of ''interest'' into one graphical visualization of their called multiframe
#Syntaxis' function for Windows is:par(multiframe, a graphical visualization of multiple object's level of ''interest'' organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array⁴(number of rows or columns required, number of columns or rows required))
#Sintassi finale della funzione: par(mfrow=c(2,2)), plot(lst_2000), plot(lst_2010), plot(lst_2010) and plot(lst_2015)
#Esiste la possibilità di importare contemporaneamente i precedenti quattro raster?
#rlist: A Toolbox for Non-Tabular Data Manipulation.Provides a set of functions for data manipulation with list objects, including mapping, filtering, grouping, sorting, updating, searching, and other useful functions. Most functions are designed to be pipeline friendly so that data processing with lists can be chained.
#Sintassi della funzione in Windows:
#Io potrei selezionare come filtro nel pattern l'estensione tif però è talmente comune che è da privilegiare invece lst!
#Sintassi finale della funzione in Windows:
#L'utente può applicare la funzione raster a una lista come quella che io ho creato? La risposta è sì!
#lapply: Apply a Function over a List or Vector
#Sintassi della funzione in Windows:
#Sintassi finale della funzione:
#Dopo aver importato i quattro raster in R dei quali si possono visualizzare le informazioni attraverso ↵ Enter, è possibile creare un'unico oggetto dagli stessi file raster?
#stack: Stack or Unstack Vectors from a Data Frame or List
#Stacking vectors concatenates multiple vectors into a single vector along with a factor indicating where each observation originated. Unstacking reverses this operation.
#Sintassi della funzione:
#Sintassi finale della funzione:
#La funzione plot quindi può essere applicata direttamente all'oggetto che noi abbiamo creato!
#Sintassi nuova o adattata all'oggetto che si è creato come finale:
#Possibilità di un plottaggio RGB andando a selezionare l'associazione tra raster e livelli di colore
#

#All'interno della carta lab, io ho scaricato la cartella greenland nella quale ho quattro layer i quali andranno a rappresentare l'incremento della temperatura in Groenlandia come land surface temperature nel 2000, 2005, 2010 e 2015
#Se nel codice precedente è stata sfruttata la funzione brick per importare un oggetto o un layer dalla suddetta cartella, mentre ora si sfrutta la funzione raster perchè è questo il formato che si vuole
#La sintassi della funzione è identica a brick:
#Ogni layer viene importato da lab a R con l'ausilio delle virgolette, andando a costituire un ciclo iterativo di funzioni
#La sintassi finale per la prima immagine sarà:
#Lo stesso verrà fatto per le altre immagini di cui si può anche avere il plot
#E' possibile creare un multiframe tramite la funzione par per visualizzare contemporaneamente i layers
#La domanda è: come importare in una singola operazione tutti e quattro i layer?
#inizialmente si può indicare la lista di file da importare sulla base di qualcosa che hanno in comune nel nome
#lst e non tif perchè potrebbe essere l'estensione di altri file non di nostro interesse
#sintassi della funzione:
#importante: pattern
#come applicare la funzione raster alle quattro immagini che si saranno individuate con list?
#lapply
#sintassi della funzione lapply
#con la funzione lapply io ho definitivamente importato le quattro immagini sottoforma di raster numerandole da [1] a [4]
#come creare un file unico con i raster importati?
#funzione stack unisce i quattro raster in uno solo
#sintassi della funzione
#invece di eseguire 4 plot e costruire un multiframe è sufficiente il plot dell'oggetto multiraster creato
#sintassi della funzione
#sintassi finale della funzione
#Possbilità di plottaggio RGB!
#plotRGB(TGr, 1, 2, 3, stretch="Lin"), plotRGB(TGr, 2, 3, 4, stretch="Lin") and plotRGB(TGr, 4, 3, 2, stretch="Lin")

Stack insieme di dati, come importarli in blocco su R sottoforma di raster?
Io devo importare gli strati in numero di 4 che rappresentano la stima della temperatura Copernicus per la Groenlandia 
lst land surface temperature
La funzione per caricare singoli dati non si chiama più brick ma raster. Nel pacchetto omonimo c una funzione con lo stesso nome create a rasterlayer object
Si esce da R con la funzione raster e lo si porta in R con le solite virgolette: lst_2000 <- raster('lst_2000.tif')
Ciclo iterativo di funzioni, in futuro!
plot(lst_2000), orribile schema di colori dal bianco al verde
lst_2000 <- raster('lst_2005.tif')
plot(lst_2005)
lst_2010 <- raster('lst_2010.tif')
plot(lst_2010)
lst_2015 <- raster('lst_2015.tif')
plot(lst_2015)
Quanto è lento caricare questi raster uno alla volta tramite la funzione raster?
library(rgdal) da installare su Windows (?) abstraction library per tutti i file raster
File che registra ogni decimale di temperatura sarebbe pesantissimo. Qual è il peso delle immagini che sto utilizzando? 8,5 MB Il valore è possibile per numeri interi!
DNs digital numbers in bit per aumentare la compressione
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2010)
plot(lst_2010)
plot(lst_2015)
Un metodo per importare immagini insieme
lapply apply a function over a list like over 
lista di file?
list.files list the files in a directory/folder
rlist <- list.files(pattern=''''')
pattern spiega al software regular espression, only the name matching with key regular expression will considered
cos'hanno in comune i nostri file? L'estensione .tif ma anche lst che è più consono rispetto al formato 
rlist <- list.files(pattern=''lst'')
> rlist <- list.files(pattern="lst") corretto
> rlist
prendiamo la funzione lapply per applicare la funzione raster a tutta la lista degli oggetti che ho precedenteente creato
import <- lapply(rlist,raster)
import per vedere la lista di immaginicche ho caricato tramite la funzione raster
i file sono indicati come [1]
come creare un unico file con quelli importati [1][2][3][4]?
stack un blocco di file tutti insieme
stack or unstack vectors from a vector from a data frame
create a rasterstack object 
TGr <- stack(import)
plot(TGr)
plotRGB(TGr, 1, 2, 3, stretch="Lin")
blu + alto 2010
verde + alto 2005
rosso + alto 2000
Mappa abbastanza blu, ciò potrebbe significare che i valori più alti sono nel 2010
plotRGB(TGr, 2, 3, 4, stretch="Lin")
con dei valori immagini dasatellite per i valori della temperatura!
plotRGB(TGr, 4, 3, 2, stretch="Lin")

#Al di sotto di questo commento studiare e organizzare la lezione dell' 08/04/2021

#Visualitazione methods for raster data
#install.packages('rasterVis')
#library(rasterVis)
#setwd("C:/lab/greenland")
#rlist <- list.files(pattern="lst")
#rlist
#import <- lapply(rlist,raster)
#import
#TGr <- stack(import)
#TGr
#levelplot(TGr)
#levelplot(TGr$lst_2000)
#cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
#levelplot(TGr, col.regions=cl)
#levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#meltlist <- list.files(pattern="melt")
#melt_import <- lapply(meltlist,raster)
#melt <- stack(melt_import)
#melt
#levelplot(melt)
#clb <- colorRampPalette(c("blue","white","red"))(100)
#plot(melt_amount, col=clb)
#melt_amount
#levelplot(melt_amount, col.regions=clb)

#Sequence of informatic commands for R_code_time_series.r:

install.packages('raster')

install.packages('RStoolbox')

install.packages('rasterVis')

install.packages("rgdal")

library(raster)

setwd("C:/lab/greenland/")

lst_2000 <- raster('lst_2000.tif')

plot(lst_2000)

lst_2005 <- raster('lst_2005.tif')

plot(lst_2005)

lst_2010 <- raster('lst_2010.tif')

plot(lst_2010)

lst_2015 <- raster('lst_2015.tif')

plot(lst_2015)

par(mfrow=c(2,2))

plot(lst_2000)

plot(lst_2010)

plot(lst_2010)

plot(lst_2015)

rlist <- list.files(pattern="lst") 

rlist

import <- lapply(rlist,raster)

import

TGr <- stack(import)

plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="Lin")

plotRGB(TGr, 2, 3, 4, stretch="Lin")

plotRGB(TGr, 4, 3, 2, stretch="Lin")
