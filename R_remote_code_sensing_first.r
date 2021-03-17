#Title for R's developing code
#My first R code for remote sensing
#Which folder must R use in the computer?
#In the computer R must use the folder named simply lab
#I exploit a function (setwd) for the association between R and lab folder
#Syntaxis' function for Windows is: setwd(''C:/lab/'')
#In R function setwd(''C:/lab/'') gives an error: unexpected symbol in (''C:/lab/'')
#The correct and unexpected syntaxis' function is: setwd('C:/lab/')
#After the association between R and lab folder, how I import data from lab folder to R?
#I exploit  a function (brick) to import data from lab folder - external - to R - internal* -
#Syntaxis' function for Windows is: renowned object name <- brick('original object name')
#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need ' '* 
#Loading required packages: sp is successful
#p224r63_2011_masked.grd is imported in R with brick function according to Windows' syntaxis in which: renowned object name = p224r63_2011 and original object name = p224r63_2011_masked.grd
#Final syntaxis' function in Windows is: p224r63_2011 <- brick('p224r63_2011_masked.grd')
#How to visualize informations of p224r63_2011 in R? 
#In R, visualizing informations of an object, name of it followed by enter as physical command by keyboard
#If I want to obtain visually frequence bands in p224r63_2011?
#I exploit  a function (plot) to obtain visually spectral bands
#Syntaxis' function for Windows is: plot(object)
#In R function plot(p224r63_2011) lead me to a schedule with spectral bands explained graphically 
#Dal seguente commento, da riorganizzare e tradurre in lingua inglese
#Io voglio modificare il colore dei grafici assegnando tre colori pixels bianco, grigio e nero
#Funzione ColorRampPalette valori riflettanza per lunghezza lunga
#Qual è la sintassi di questa funzione? colorRampPalette('black','grey',light grey') colorRampPalette(c('black','grey',light grey')) 
#livelli di colore colorRampPalette(c('black','grey',light grey')) (100)
# colore palette <- colorRampPalette(c('black','grey',light grey')) (100) nome alla tabella dei colori
#plot function nuova tabella dove col primo argomento oggetto rinominato, secondo banda plot(p224r63_2011, col=cl)
#Per appartenenza alla stessa oggetto, array (vettore) c per stesso argomento (colore)
#I colori sono etichettati/indicizzati 
#Inventa nuova scala di colore
#cl <- colorRampPalette(c("red","magenta","pink")) (100)
#plot(p224r63_2011, col=cl)
#Sequence of informatic commands for R_remote_code_sensing_first.r

install.packages('raster')

library(raster)

setwd('C:/lab/')  

p224r63_2011 <- brick('p224r63_2011_masked.grd')

plot(p224r63_2011)
