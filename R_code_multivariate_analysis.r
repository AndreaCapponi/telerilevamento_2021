#Al di sotto di questo commento studiare e organizzare la lezione del 23/04/2021

#Al di sotto di questo commento studiare e organizzare la lezione del 28/04/2021
#library(raster)
#library(RStoolbox)
#setwd("C:/lab/") # Windows
#p224r63_2011 <- brick("p224r63_2011_masked.grd")
#p224r63_2011
#pairs(p224r63_2011)
#PCA analisi impattante, tempo esagerato per il ricollocamento dei pixels nelle nuove bande
#Soluzione: ricampionamwento
#Aggregate come funzione per aggregare i pixel per media andando a ridurre la risoluzione (peso)
#Risoluzione 30m x 30m x . y, il pixel 
#Fattore lineare 10 per allegerire l'immagine!
#4447533*7
#[1] 31132731 numero di pixel totali per 7 bande!
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





