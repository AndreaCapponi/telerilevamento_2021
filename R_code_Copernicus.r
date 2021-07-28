#What is Copernicus? 
#Copernicus is the European Union’s Earth Observation Programme, which monitors our planet and its environment for the ultimate benefit of the citizens of Europe. It delivers data, information and services based on satellite Earth Observation data and insitu (non-space) data. The Programmeis funded, coordinated and managedby the European Commission in cooperation with partners such as ESA and EUMETSAT
#What is the official Copernicus website to connect to?
#
#
#
#
#
#
#
#
#
#

#What is the official Copernicus - European Union’s Earth Observation Programme website?
#The official Copernicus - European Union’s Earth Observation Programme website is https://www.copernicus.eu/en
#
#How to download a satellite image from the official website of the Copernicus program?
#To download a satellite image of the Copernicus program, I have to visit the website indicated in the string below ↓



#How to register a personal account on the website?
#Sign up
#Firstname, lastname, username, password, confirm password, email, confirm email, select domain, select usage, select country

#By registering in this website you are deemed to have accepted the T&C for Sentinel data use

#Register

#Vegetation state, Energy budget, Water Cycle and Cryosphere

#Vegetation State
	
VEGETATION PROPERTIES VEGETATION INDICATORS DRY MATTER PRODUCTIVITY 	
FIRE DISTURBANCE SOIL WATER INDEX 	
SURFACE SOIL MOISTURE

ROOT - TOP OF CANOPY REFLECTANCE 	
ALBEDO

LAND SURFACE TEMPERATURE

LAKE SURFACE WATER TEMPERATURE 	
LAKE WATER QUALITY WATER BODIES WATER LEVEL

CRYOSPHERE

#Collections, prodotti disponibili da scaricare in anteprima
#i, informazioni sul tema

#Help The "Catalogue search" tab allows you to define search criteria and start a search within the catalogue
#Date  Start date End Date 
# Roi coordinate geografiche della zona di interesse
#Search in progress please wait

#Visualizzaione di dati dal programma Copernicus Europe's eyes on Earth
#Iscrizione al programma Copernicus Europe's eyes on Earth tramite sito web
#Come scaricare un'immagine da un programma specifico?
#Selezione del programma di mio interesse e ricerca per filtri
#Lo scaricamento dell'immagine è accessibile se la freccia nella seconda colonna da sinistra è di colore blu!
#Se il cursore dell'immagine è al di sopra del nome del file selezionato da scaricare è visualizzabile un'anteprima; quest'ultima potrebbe non essere disponibile e visualizzabile in una scheda prima dello scaricamento nella cartella lab per Telerilevamento!
#Il formato nc richiede l'installazione di uno specifico pacchetto affinché si visualizzi l'immagine per analizzare i dati: install.packages("ncdf4")
#provo con l'URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/ncdf4_1.17.zip'
Content type 'application/zip' length 3267795 bytes (3.1 MB)
downloaded 3.1 MB

package ‘ncdf4’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\PC\AppData\Local\Temp\RtmpSKE0X0\downloaded_packages

#library(raster)
#library(ncdf4)
#setwd("C:/lab/")
#snowcover2021 <- raster("c_gls_SCE500_202104010000_CEURO_MODIS_V1.0.1.nc")
#snowcover2021
#plot(snowcover2021)
#sc21gbwcp <- colorRampPalette(c('green','brown','white'))(1000)
#plot(snowcover2021, col=sc21gbwcp)
#Perchè cambia lo sfondo nel plot(snowcover2021, col=sc21gbwcp) essendo verde come l'assenza di copertura nevosa?
#Valori NA da riclassificare per non c'è associazione con valori reali copNDVI <- raster::reclassify(copNDVI, cbind(252,255, NA), right=TRUE) selenzionandoli tramite metadata dal sito web per il programma Copernicu
#Come diminuire la risoluzione con un ricampionamento?
