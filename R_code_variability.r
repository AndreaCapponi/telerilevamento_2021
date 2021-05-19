#Al di sotto commentare e organizzare la lezione del 19/05/2021
#install.packages(raster)
#install.packages(RStoolbox)
#library(raster)
#library(RStoolbox)
#setwd("C:/lab/")
#Come importare un'immagine ottenuta con il satellite Sentinel?
#NIR, RED e GREEN sono le bande che costituiscono l'immagine del Similaun
#La funzione brick mi consente di importare in R l'immagine siffatta
#sentinel <- brick("sentinel.png"), virgolette per essere all'interno della cartella lab al di fuori dello stesso R
#Inizialmente sieffettua un plot di sentinel. Quale tipologia di plot?
#plotRGB(sentinel)
#La sintassi è differente da quella standard perchè la sequenza di bande associate ai canali R, G e B è quella da me richiesta e non è necessario esplicitare gli argomenti!
#NIR 1 ,RED 2, GREEN 3 -> r=1, g=2 e b=3 per cui plotRGB(sentinel) = plotRGB(sentinel, r=1, g=2, b=3, strecht="Lin")
#plotRGB(sentinel, r=2, g=1, b=3, strecht="Lin") sfruttabile per visualizzare la copertura vegetale in verde fluorescente!
#Come effettuare il calcolo della varianza?
#Il calcolo della varianza è da effettuarsi esclusivamente su una banda selezionata dall'utente attraverso il metodo della moving window
#Il metodo della moving window dipende dal valore della deviazione standard calcolata sui valori di una griglia la cui grandezza è di 3 x 3 pixels attribuendo il finale al centrale
#La nuova mappa ottenuta ha esternamente dei non valori mentre internamente i valori per le deviazioni standard a cui attribuire "colorazioni" differenti
#Come compattare le mie tre bande in un'unica per applicare il metodo della moving window?
#Con sentinel si identificano i nomi delle tre bande di mio interesse (l'ultima sentinel.4 è creata come slot vuoto auotmaticamente) e do loro un nome sintetico e immediato
#nir <- sentinel$sentinel.1
#red <- sentinel$sentinel.2
#Io sfrutto l'indice di vegetazione NDVI (R_code_vegetation_indices.R) per compattare secondo la formula ndvi <- (nir-red) / (nir+red) ed effettuo il plot
#plot(ndvi)
#Per una migliore interpretazione dell'immagine ottenuta, perchè non creare un'altra palette di colori che la facilitino?
#cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
#plot(ndvi,col=cl)
#Calcolare la variabilità dell'immagine è ora possibile andando a calcolare la deviazione standard con il metodo della moving window attraverso la funzione focal
#focal: Focal values -> Calculate focal ("moving window") values for the neighborhood of focal cells using a matrix of weights, perhaps in combination with a function.
#ndvisd3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=sd)
#La moving window è quadrata per evitare l'anisotropia andando a compromettere il calcolo dei valori per assi X e Y che distorcerebbero l'interpretazione dei dati
#plot(ndvisd3)
#La colorRampPalette non facilita l'interpretazione dei dati nel grafico recentemente ottenuto
#clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 
#plot(ndvisd3, col=clsd)
#La media invece quali informazioni da rispetto a quello che abbiamo visualizzato finora?
#ndvimean3 <- focal(ndvi,w=matrix(1/9, nrow=3, ncol=3), fun=mean)
#plot(ndvimean3)
#clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 
#plot(ndvimean3, col=clsd)
#par(mfrow=c(1,2))
#clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
#plot(ndvimean3, col=clsd)
#plot(ndvisd3, col=clsd)
#A questo punto è possibile cambiare la grandezza della finestra a mio piacimento. Attenzione il numero dei pixels deve essere dispari per avere ogni qualvolta un pixel centrale singolo per calcolare il valore della deviazione standard
#ndvimsd7 <- focal(ndvi,w=matrix(1/49, nrow=7, ncol=7), fun=sd)
#plot(ndvisd7)
#clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) 
#plot(ndvisd7, col=clsd)
#La risoluzione dell'immagine originale non viene modificata, è il calcolo che l'utente effettua è responsabile di variazioni nella visualizzazione grafica della variabilità (da valori minimi per un'indagine locale a valori espansivi per un'indagine globale)
#ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
#clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
#plot(ndvisd5, col=clsd)
#E' possibile sfruttare anche un'analisi multivariata andando a considerare esclusivamente la componente PC1 sulla quale far scorrere la moving window ottenendone una mappa per la variabilità secondo valori della deviazione standard
#La funzione a cui mi appoggio è rasterPCA che è contenuto nel pacchetto RSToolbox che abbiamo già richiamato all'inizio del codice
#sentinelpca <- rasterPCA(sentinel)
#plot(sentinelpca$map)
#Attenzione! E' da legare la mappa successivamente all'analisi sennò Error in xy.coords(x, y, xlabel, ylabel, log) : 
  'x' is a list, but does not have components 'x' and 'y'
#sentinelpca
#Quanta variabilità iniziale spiegano le singole componenti?
#summary(sentinelpca$map)
#Il PC1 spiega il 67,368% dell'informazione contenuta nell'immagine originale!
#
#
#
#
#
#
#
#
#
