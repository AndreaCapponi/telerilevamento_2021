#Which is the title for R's developing code?
#My R code for a time series
#Which folder must R use in the computer for this new code?
#In the computer R must use the subfolder named greenland within the "mother" folder simply called lab
#I exploit a function (setwd) for the association between R and greenland subfolder
#Adapted syntaxis' function for Windows is: setwd(''C:/name of the folder in which there is a subfolder of interest to the user/name of the subfolder which will be associated with R'')
#Final syntaxis' function for Windows is: setwd(''C:/lab/greenland'')
#After the association between R and greenland subfolder, how I import data from greenland subfolder to R?
#In a different way from the R_remote_code_sensing_first.r, although I still exploit a function to import data from greenland subfolder - external - to R - internal¹ - this will be raster and not brick because our data does not represent a multi-layer raster object³ but raster layer² objects!
#Syntaxis' function for Windows is: renowned object name <- raster('original object name')
#Previous function is based on install.packages('raster'): I indicate to R trough library function to upload them as library(raster) where syntaxis doesn't need inverted commas (“ ”)¹ 
#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!
#Loading required packages: sp is successful being classes and methods' database provider for spatial data 
#For the operation of this code, it is recommended by the professor to install also install.packages('RStoolbox') and install.packages('rasterVis') in order to have tools and visualization methods for remote sensing data analysis
#Through install.packages('RStoolbox') the user have a diversied toolbox for remote sensing image processing and analysis as calculating spectral indices, principal component transformation, unsupervised and supervised classification or fractional cover analyses
#Upload message successful: trying URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/RStoolbox_0.2.6.zip' Content type 'application/zip' length 2170101 bytes (2.1 MB)downloaded 2.1 MBpackage ‘RStoolbox’ successfully unpacked and MD5 sums checkedThe downloaded binary packages are inC:\Users\PC\AppData\Local\Temp\RtmpEx7d3z\downloaded_packages
#Through install.packages(rasterVis') the user have methods to apply for an enhanced visualization and interaction with raster data. It implements visualization methods for quantitative data and categorical data, both for univariate and multivariate rasters. It also provides methods to display spatiotemporal rasters, and vector fields
#Upload message successful: trying URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/rasterVis_0.50.1.zip'Content type 'application/zip' length 216951 bytes (211 KB)downloaded 211 KBpackage ‘rasterVis’ successfully unpacked and MD5 sums checkedThe downloaded binary packages are inC:\Users\PC\AppData\Local\Temp\RtmpSKE0X0\downloaded_packages
#lst_2000.tif, lst_2005.tif, lst_2010.tif and lst_2015.tif are imported in R with raster function according to Windows' syntaxis in which: renowned object name = lst_2000,lst_2005, lst_2010 and lst_2015 and original object name = lst_2000.tif, lst_2005.tif, lst_2010.tif and lst_2015.tif
#Final syntaxis' function in Windows is: lst_2000 <- raster('lst_2000.tif'),lst_2000 <- raster('lst_2005.tif'), lst_2010 <- raster('lst_2010.tif') and lst_2015 <- raster('lst_2015.tif')
#How to graphically visualize the Earth's surface temperature in Greenland from raster layer objects lst_2000, lst_2005, lst_2010 and lst_2015 (lst, acronym for land surface temperature)?
#I exploit a function (plot) to obtain visually land surface temperature
#Syntaxis' function for Windows is: plot(object)
#In R function plot(lst_2000), plot(lst_2005), plot(lst_2010) and plot(last_2015) lead me to a window with land surface temperature of Greenland explainable graphically through the concept of reflectance
#With the function (par) there is the possibility of combining in this case multiple levels of "interest" belonging to different objects² in their series into one graphical visualization of their called multiframe
#Syntaxis' function for Windows is: par(multiframe, a graphical visualization of multiple levels of "interest" belonging to different objects² in their series organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array(number of rows or columns required, number of columns or rows required))
#Final syntaxis' function in Windows is: par(mfrow=c(2,2)) followed by plot(lst_2000), plot(lst_2010), plot(lst_2010) and plot(lst_2015)
#The plot and par functions applied individually by the user to each raster layer object are a slow and inefficient iterative cycle! 
#What if I import the four rasters lst_2000, lst_2010, lst_2010 and lst_2015 at the same time in R via the raster function by selecting them from a list in the greenland subfolder? Subsequently, by representing each raster² the Earth's surface temperature for Greenland in different years (2000, 2005, 2010 and 2015), I would join the latter as levels of a single object³, the plot of which will clarify graphically the trend of the previous temperature in a time series analysis
#Initially I exploit a function (rlist) through which I create a list of data, files or objects based on the matching of their names with a key regular expression selected by the user
#Syntaxis' function for Windows is: name of the list of objects selected by the user <- list.files(pattern="a key regular expression in each name of previous objects of which the user is creating a list") 
#Since the number of my objects is limited, I could have the tif format as a pattern in the rlist function. This user choice is not recommended because the tif format is common and widespread so my choice will be the lst pattern indicating in each raster what represents in particular (land surface temperature)
#Final syntaxis' function in Windows is: greenlandsubfolderlist <- list.files(pattern="lst")
#After the creation of the list greenlandsubfolderlist consisting of lst_2000, lst_2005, lst_2010 and lst_2015, how to import it by applying the raster function globally?
#I exploit a function (lapply) which apply a selected function by the user in R over a list
#Syntaxis' function for Windows is: name of the list of objects on which is applied the function selected by the user <- lapply(original name of the list of objects on which will be applied the function selected by the user, selected function by the user)
#Final syntaxis' function in Windows is: greenlandimportedr <- lapply(greenlandsubfolderlist,raster)
#The display of the information of lst_2000, lst_2005, lst_2010 and lst_2015 is done simply by pressing ↵ Enter after I have digitized greenlandimportedr where the rasters are listed with numbers between square brackets from [1] to [4]
#The last operation will be to merge the raster layer objects lst_2000, lst_2005, lst_2010 and lst_2015 - contained in the greenlandimportedr list imported into R - into a multi-layer raster object whose name I have chosen will be TCSG through a new function called stack 
#I exploit the (stack) function that stack or unstack vectors from a data frame or list generated by the user beforehand
#Syntaxis' function for Windows is: name of the future multi-layer raster object <- stack(name of the list of objects on which the function selected by the user is applied to import them into R)
#Final syntaxis' function in Windows is: TCSG <- stack(greenlandimportedr)
#Without exploiting the plot function singularly on each raster layer object and organizing the same raster layer objects in a prearrenged multiframe through the par function, the iterative cycle of the rlist, lapply and stack functions guarantees to any user the exploitation of plot function directly on the multilevel raster object as the one created in the 42nd string of this code!
#Final syntaxis' function in Windows is: plot(TCSG)
#The graphical visualization of the increase in the surface temperature of the Earth in Greenland is obtained through a more detailed plot in RGB: I associate the levels of "interest" in TCSG multilayer raster object - which initially were a series of raster layer objects stand alone - to the channels of the red, green and blue for the multispectral sensors the LANDSAT satellite is equipped with
#Syntax's function for Windows is: plotRGB(renowned object name, r= number of selected spectral band which will be graphically visualized through red channel, g= number of selected spectral band which will be graphically visualized through green channel, b= number of selected spectral band which will be graphically visualized through blue channel,type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!
#Final syntaxis' function in Windows is: plotRGB(TCSG, 1, 2, 3, stretch="Lin"), plotRGB(TCSG, 2, 3, 4, stretch="Lin") and plotRGB(TCSG, 4, 3, 2, stretch="Lin") where r, g and b could be implied!

#For a graphical visualization of the melting ice in Greenland depending on the Earth's surface temperature, it is possible to exploit another plot function that for the TCSG multi-layer raster object pools a legend for the reflectance values at lst_2000, lst_2005, lst_2010 and lst_2015?
#I exploit a function (levelplot) to draw level plots and contour plots
#Important: the above function is operative if and only if the user with the library function loads the previously installed rasterVis package
#Syntaxis' function for Windows is: library(add-on package the user wants to load in R)
#Final syntaxis' function in Windows is: library(rsaterVis)
#Instead the syntax for the levelplot function in Windows is: levelplot(name of the multi-layer object selected by the user)
#Final syntaxis' function in Windows is: levelplot(TCSG)
#And if I wanted to apply the levelplot function to the single TCSG layer represented by my choice among the raster layer objects lst_2000, lst_2005, lst_2010 and lst_2015?
#I exploit a function ($) to extract, from the initial (plot)¹ of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''
##Initial syntaxis' function for Windows: plot(renowned object name$name of the object's level in which the user is interested for graphical visualization)
#What will be the final syntaxis' function in Windows if my p224r63_2011's level of ''interest''² is the set of data which will be graphically visualized in their functional whole being as the spectral band B1:blue?
#Final syntaxis' function in Windows is: levelplot(TCSG$lst_2000), levelplot(TCSG$lst_2005), levelplot(TCSG$lst_2010) and levelplot(TCSG$lst_2015)
#The graphical display through the levelplot function of the level raster objects lst_2000, lst_2005, lst_2010 and lst_2015 as layers of the TCSG multilevel raster object is more detailed: the temperature trend on the earth's surface is represented by a graph - above and to the right of it - whose values are attributed by row or column as the sum of the values belonging to the nth row or column in relation to the total number of pixels. If the number of pixels is equal to 16, 2 to 16 = 65,536 will be the average values potentially attributable in the form of bits so that it can be understood even for a single pixel if in a predetermined time span there has been an imperceptible variation of that temperature!
#The graphical display of TCSG through levelplot function can be embellished by integrating the syntax of the function with the arguments to specify what is the user's need in the analysis of the temperature in Greenland. In my case I need to apply a new color palette for the correct interpretation of the reflectance values, change the name of the layers / raster objects of the layer and put a title on the graph itself
##I exploit  a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth
#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)
#Final syntaxis' function in Windows is: cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
#Implemented syntaxis' function in Windows is: levelplot(name of the multi-layer object selected by the user, col.regions= name of new palette of colors)
#Final syntaxis' function in Windows is: levelplot(TCSG, col.regions=cl)
#Implemented syntaxis' function in Windows is: levelplot(name of the multi-layer object selected by the user, col.regions= name of new palette of colors, names.attr=c("user-selected name (s) for the layer (s) of multi-layer object)
#Final syntaxis' function in Windows is: levelplot(TCSG,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#Implemented syntaxis' function in Windows is: levelplot(name of the multi-layer object selected by the user, col.regions= name of new palette of colors, main=''title of the graphical visualization", names.attr=c("user-selected name (s) for the layer (s) of multi-layer object)
#Final syntaxis' function in Windows is: levelplot(TCSG,col.regions=cl, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
#The graphic visualization of the melting of the ice depending on the surface temperature of the Earth in Greenland is obtained with the same iterative cycle of list.files, lapply and stack functions but starting from level raster objects obtained from the Nimbus 7 satellite between 1979 and 2007 through its own microwave sensor
##Initially I exploit a function (rlist) through which I create a list of data, files or objects based on the matching of their names with a key regular expression selected by the user
#Syntaxis' function for Windows is: name of the list of objects selected by the user <- list.files(pattern="a key regular expression in each name of previous objects of which the user is creating a list")
##Since the number of my objects is limited, I could have the tif format as a pattern in the rlist function. This user choice is not recommended because the tif format is common and widespread so my choice will be the lst pattern indicating in each raster what represents in particular (land surface temperature)
#Final syntaxis' function in Windows is: meltlist <- list.files(pattern="melt")
#After the creation of the list meltlist consisting of 1979annual_melt to 2007annual_melt, how to import it by applying the raster function globally?
#I exploit a function (lapply) which apply a selected function by the user in R over a list
#Syntaxis' function for Windows is: name of the list of objects on which is applied the function selected by the user <- lapply(original name of the list of objects on which will be applied the function selected by the user, selected function by the user)
#Final syntaxis' function in Windows is: melt_import <- lapply(meltlist,raster)
##The last operation will be to merge the raster layer objects from 1979annual_melt to 2007annual_melt - contained in the melt_import list imported into R - into a multi-layer raster object whose name I have chosen will be melt through a new function called stack 
#I exploit the (stack) function that stack or unstack vectors from a data frame or list generated by the user beforehand
#Syntaxis' function for Windows is: name of the future multi-layer raster object <- stack(name of the list of objects on which the function selected by the user is applied to import them into R)
#Final syntaxis' function in Windows is: melt <- stack(melt_import)
#The display of the information of melt is done simply by pressing ↵ Enter
#For a graphical visualization of the melting ice in Greenland depending on the Earth's surface temperature, it is possible to exploit levelplot function
#Syntaxis' function for Windows is: levelplot(name of the multi-layer object selected by the user)
#Final syntaxis' function in Windows is: levelplot(melt)
#

#All'interno della carta lab, io ho scaricato la cartella greenland nella quale ho quattro layer i quali andranno a rappresentare l'incremento della temperatura in Groenlandia come land surface temperature nel 2000, 2005, 2010 e 2015
Io devo importare gli strati in numero di 4 che rappresentano la stima della temperatura Copernicus per la Groenlandia 
File che registra ogni decimale di temperatura sarebbe pesantissimo. Qual è il peso delle immagini che sto utilizzando? 8,5 MB Il valore è possibile per numeri interi!
DNs digital numbers in bit per aumentare la compressione
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
#install.packages('rasterVis'), da pacchetto precedente lattice
#Carico il pacchetto richiesto: raster
#Carico il pacchetto richiesto: sp
#Carico il pacchetto richiesto: terra
#terra version 1.1.4
#Carico il pacchetto richiesto: lattice
#Carico il pacchetto richiesto: latticeExtra

#Attenzione: la cartella zip melt potrebbe inserirsi in questo ciclo iterativo di funzioni e bloccare il processo per l'analisi che si sta conducendo!

#Legenda per valore di discioglimento del ghiaccio, tanto più è elevato tanto più si sarà disciolto. Disciogliemento effettivo, tra 1979 e 2007
#Applicazione di algebra alle matrici di dati
#Matrice di dati come insieme di pixel ai quali vengono attribuiti i valori di discioglimento del ghiaccio come bit. 2007-1979, come avere la differenza nei valori utile per comprendere il discioglimento
#Legare il file originale allo strato di nostro interesse perchè non sarebbe che interpretato da R come componenete di TCSG
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)
#Tutte le zone rosse sono quelle dove dal 1979 al 2007 c'è stato un elevato discioglimento del ghiaccio come da legenda.
#melt_amount
#-87 min e 92 max tramite la brachet informativa
#levelplot(melt_amount, col.regions=clb)
#Utilizzare dati multitemporali e poter visualizzare tutti i dati insieme attraverso il levelplot e differenze dipendentemente dall'anno considerato!

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

greenlandsubfolderlist <- list.files(pattern="lst")

greenlandsubfolderlist

greenlandimportedr <- lapply(greenlandsubfolderlist,raster)

greenlandimportedr

TCSG <- stack(greenlandimportedr)

plot(TCSG)

plotRGB(TCSG, 1, 2, 3, stretch="Lin")

plotRGB(TCSG, 2, 3, 4, stretch="Lin")

plotRGB(TCSG, 4, 3, 2, stretch="Lin")

library(rasterVis)

levelplot(TCSG)

levelplot(TCSG$lst_2000)

levelplot(TCSG$lst_2005)

levelplot(TCSG$lst_2010)

levelplot(TCSG$lst_2015)

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)

levelplot(TCSG, col.regions=cl)

levelplot(TCSG,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

levelplot(TCSG,col.regions=cl, main="LST variation in time", names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

meltlist <- list.files(pattern="melt")

melt_import <- lapply(meltlist,raster)

melt <- stack(melt_import)

levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt

clb <- colorRampPalette(c("blue","white","red"))(100)

plot(melt_amount, col=clb)

dev.off()

levelplot(melt_amount, col.regions=clb)
