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

Stack insieme di dati, come importarli in blocco su R sottoforma di raster?
Io devo importare gli strati in numero di 4 che rappresentano la stima della temperatura Copernicus per la Groenlandia 
lst land surface temperature
La funzione per caricare singoli dati non si chiama più brick ma raster. Nel pacchetto omonimo c una funzione con lo stesso nome create a rasterlayer object
Si esce da R con la funzione raster e lo si porta in R con le solite virgolette: lst_2000 <- raster('lst_2000.tif')
Ciclo iterativo di funzioni, in futuro!
plot(lst_2000), orribile schema di colori dal bianco al verde
lst_2005 <- raster('lst_2005.tif')
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

