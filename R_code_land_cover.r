#Al di sotto commentare e organizzare la lezione del 05/05/2021
#setwd("C:/lab/") 
#Quali librerie sono necessarie? Raster, RSToolbox e ggplot2!
#library(raster)
#library(RSToolbox)
#install.packages("ggplot2")
#library(ggplot2)
#Caricare il dataset sui cui operò. Qual è la funzione da utilizzare?
#defor1 <- brick("defor1.jpg")
#plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
#ggR, plor rasterlyers in ggplot with grayscale
#ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
#Coordinate spaziali del mio oggetto
#defor2 <- brick("defor2.jpg")
#plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
#par(mfrow=c(1,2))
#plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
#plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#La funzione par non permette di organizzare i plot ggRGB!
#gridExtra for grid.arrange per organizzare i ggRGB
#install.packages("gridExtra")
#library(gridExtra)
#grid.arrange arrange multiple grobbs 
#1° plot p1 e 2° plot p2
#p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
#p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
#grid.arrange(p1, p2, nrow=2)
#Al di sotto commentare e organizzare la lezione del 05/05/2021
#library(raster)
#library(RStoolbox) # classification
# install.packages("ggplot2")
#library(ggplot2)
# install.packages("gridExtra")
#library(gridExtra)
#setwd("C:/lab/") 
#defor1 <- brick("defor1.jpg")
#defor2 <- brick("defor2.jpg")
#Classificazione?
#ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
#Quanti classi vorremmo per la classificazione?
#Una classe per la foresta Amazzonica NIR sulla componenete RED RGB, un'altra classe per l'uso del suolo come agricolo
#Unsupervised classification perchè l'inizio di questa classificazione è supervisionato non dall'utente ma dallo stesso R tramite una selezione casuale di pixel
#d1c <- unsuperClass(defor1, nClass=2)
#d1c
#RasterLayer, due valori: 1 o 2!
#Il plottaggio deve avvenire attraverso la funzione $ per legare d1c a map
#plot(d1c$map)
#Qual è la classe della Foresta Amazzonica?
#set.sed() woul you attain the same result
#d2c <- unsuperClass(defor2, nClass=2)
#d2c
#plot(d2c$map)
#Parte agricola classe 1, Foresta Amzzonica invece 2
#Il nome del fiume è classificato come parte agricola, colore associato come valori di riflettanza ai suoli per l'uso agricolo!
#d2c3 <- unsuperClass(defor2, nClass=3)
#plot(d2c3$map)
#Un'ulteriore classe è riservata all'agricolo, e non alla Foresta Amazzonica. Giallo=FA, gli altri due colori classi per pratiche agricole a cui si associazioni valori di riflettanza differenti
#Quanto abbiamo perso di foresta?
#Frequenza dei pixel in una specifica classe. Quante volte ho i pixel nella classe per la Foresta Amazzonica e per l'uso ad uso agricolo?
#Funzione freq: generate frequencies tables
#freq(d1c$map)
#     value  count
[1,]     1 306610
[2,]     2  34682
#freq(d2c$map)
#     value  count
[1,]     1 163860
[2,]     2 178866
#Qual è la proporzione per avere la percentuale?
#La somma dei pixels è s1 <-306610 + 34682, poi s1 o dc1 con informazione sul numero totale dei pixels [1] 341292
#prop1 <-freq(d1c$map)/ s1
#prop1 
#            value     count
[1,] 2.930042e-06 0.8983803 Foresta Amazzonica
[2,] 5.860085e-06 0.1016197 Suolo ad uso agricolo
#s2 <- 163860 + 178866 = [1] 342726
#prop2 <-freq(d2c$map)/ s2
#prop2
#            value     count
[1,] 2.917783e-06 0.4781079 Suolo ad uso agricolo
[2,] 5.835565e-06 0.5218921 Foresta Amazzonica
#Per la percentuale, semplice moltiplicazione * 100 da numeri ottenuti per le prop1 prop2
#Generazione di un dataframe a partire dai dati ottenuti!
#Fattori delle variabili categoriche: prima colonna con Forest and Agriculture sotto il nome Cover
#La struttura consiste in colonne per percentuale iniziale di pixel con 99 e percentuale finale di pixel 2006
#cover <- c("Forest", "Agriculture")
#percent_1992 <- c(89.83, 10.16)
#percent_2016 <- c(52.18, 47.81)
#losspercentages <- data.frame(cover, percent_1992, percent_2016)
#losspercentages
#   cover percent_1992 percent_2016
1      Forest        89.83        52.18
2 Agriculture        10.16        47.81
#Come plottare questi dati?
#ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")
#ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")
#p1 <- ggplot(losspercentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="pink")
#p2 <- ggplot(losspercentages, aes(x=cover, y=percent_2016 , color=cover)) + geom_bar(stat="identity", fill="pink")
#grid.arrange(p1, p2, nrow=1)
#
#
#
#
#

