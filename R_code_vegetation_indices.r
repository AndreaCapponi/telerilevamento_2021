#Al di sotto di questo commento studiare e organizzare la lezione del 28/04/2021
#library(raster)/require(raster)
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
#
#
#
#
#
#
#
