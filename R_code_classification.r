#La classificazione delle immagini avviene per accorpamento di pixel con valori sovrapponibili o simili di bit per la riflettanza!
#setwd("C:/lab/")
#Solar-Orbiter data da Virtuale download nella cartella lab, come importarla in R?
#La funzione da sfruttare è brick perchè è un multi-layer object
#Per la precedente funzione è necessario caricare il pacchetto raster con la funzione library
#library(raster)
#so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#Per la visualizzazione di tutti e tre i livelli si sfrutta la funzione RGB
#so ed Enter, informazioni sull'immagine importata
#plotRGB(so, 1,2,3, stretch="lin") - come da sito per il satellite, colori reali - 
#Tre livelli energetici sul Sole che andranno classificati successivamente
#Il valore di pixel per un bosco nelle tre bande b, r e v dipende dalle stesse: assorbimento nel b, valore basso assorbimento nel r, valore basso, riflettanza nel verde, valore alto
#Un altro pixel per il bosco quali valore avrà? Identici o simili grafico tre assi per individuare punti valori per pixels
#Un pixel di acqua invece avrà valori differenti e il grafico tridimensionale (spazio multispettrale) rispecchierà la differenza nella natura dei pixel
#Classi da pixel che sono campioni dalla popolazione intera per lo spazio multispettrale
#Training set, classificazione dei pixel nell'immagine che ha campionato come di riferimento
#Distanza spazio multispettrale da nuvola punti campionati, appartenenza alla classe 
#Maximum lighhood
#library(RStoolbox)
#Classificazione non supervisionata unsupervised classification
#Training set da software, noi non li creeremo
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
#
#
