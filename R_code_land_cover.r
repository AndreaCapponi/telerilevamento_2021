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
#
#
