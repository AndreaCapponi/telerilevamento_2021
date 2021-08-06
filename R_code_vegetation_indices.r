#Which is the title for R's developing code?

#My R code for vegetation indices 🌲

#Which folder must R use in the computer?

#In the computer R must use the folder named simply lab

#I exploit a function (setwd) for the association between R and lab folder

#Adapted syntaxis' function for Windows is: setwd("C:/name of the folder in which there is a subfolder of interest to the user/name of the subfolder which will be associated with R")

#Final syntaxis' function for Windows is: setwd("C:/lab/greenland")

#After the association between R and lab folder, how I import data from lab folder to R?

#Identically to the R_remote_code_sensing_first.r, I still exploit a function to import data from lab folder - external - to R - internal¹ - and this will be brick and not raster because our data does not represent raster layer objects but multi-layer raster objects²³!

#Syntaxis' function for Windows is: renowned object name <- brick("original object name")

#Previous function is based on install.packages("raster"): I indicate to R trough require function to upload them as require(raster) where syntaxis doesn't need inverted commas (“ ”)¹ 

#What is the difference between the library function and the require function in loading a user-requested packages into R?

#The library function, if the requested package does not exist, by default returns an error message: there is no package called (name of the package requested by the user to load in R) while the require function is designed to be used inside functions as it gives a warning message and returns a logical value say, FALSE if the requested package is not found and TRUE if the package is loaded

#Loading required packages: sp is successful being classes and methods' database provider for spatial data 

#Important: the brick function creates a RasterBrick object that is a multi-layer raster object typically from a multi-layer (band) file. Instead the raster function creates a RasterLayer object from scratch, a file, an Extent object, a matrix, an 'image' object, or from a Raster *, Spatial *, im (spatstat) asc, kasc (adehabitat *), grf (geoR) or kde object!

#defor1.jpg¹ and defor2.jpg² are imported in R with brick function according to Windows' syntaxis in which: renowned object name = defor1, defor2 and original object name = defor1.jpg, defor2.jpg

#Final syntaxis' function in Windows is: defor1 <- brick("defor1.jpg") and defor2 <- brick("defor2.jpg")           

#The graphical visualization of both defor1 and defor2 in false colors, being Terra (EOS AM-1) equipped with true colour, thermal and multispectral sensors in a complex acquisition system, will be obtained from the visible spectrum to which I associate B1_sre:NIR, B2_sre:red, B3_sre:grenn spectral bands of the initial object

#This graphical visualization in true colors is therefore in RGB and independent from user's selection of a palette of colors through colorRampPalette function because the three levels of interest selected by the user herself/himself from B1_sre to B3_sre are combined such that they represent exclusively the red⁵, green⁶ and blue⁷ channel in true colour sensors of LANDSAT satellite         

#Syntax's function for Windows is: plotRGB(renowned object name, r= number of selected spectral band which will be graphically visualized through red channel, g= number of selected spectral band which will be graphically visualized through green channel, b= number of selected spectral band which will be graphically visualized through blue channel,type of stretch for reflectance's values in order that their graphical visualization is optimal ='Lin if the stretch has to normalize reflectance's values between 0 e 1 (ρ=Φr/Φ0)' or 'hist if the stretch has to divides the reflectance's values into equally sized ranges from the lowest to the highest value') where the number of selected spectral band is to be indicated being a integer function!         

#With the function (par) through there is the possibility of combining multiple object's level of ''interest'' into one graphical visualization of their called multiframe

#Syntaxis' function for Windows is:par(multiframe, a graphical visualization of multiple object's level of ''interest'' organized by r̲o̲w̲s or c̲o̲l̲umns at the user's discretion = array⁴(number of rows or columns required, number of columns or rows required))

#Final syntaxis' function in Windows is: par(mfrow=c(2,1)) which has a functional significance if and only followed by plotRGB(defor1, r=1, g=2, b=3, stretch="lin") and plotRGB(defor2, r=1, g=2, b=3, stretch="lin")    

#The study by remote sensing of deforestation in the dry tropical forests of Mato Grosso (NT0140) is based on vegetation indices (VIs)

#What is a vegetation index (VI)?

#A vegetation index (VI) is a measure of vegetation properties calculated by the amount of solar radiation reflected in the optical spectrum

#The spectral signature of healthy vegetation depends on the higher reflectance values of 0,7 to 1,1 µm in the near infrared (NIR) region than in the visible region due to the cellular structure of the leaves - in particular the spongy mesophyll - where almost all of the light is absorbed by photosynthetic pigments. Chlorophyll intensely absorbs energy in the blue and red wavelengths from 0,4 a 0,7 µm, reflecting in the green wavelength instead. Finally, the reflectance in the short wave infrared (SWIR) wavelengths is related to the water content of the vegetation with absorption bands around 1.45, 1.95 and 2.50 µm. Outside of these absorption bands, leaf reflectance generally increases as the water content in the leaf decreases!

#DVI (D͟ifference V͟egetation I͟ndex) is the simplest vegetation index calculated as the difference between the near-infrared and red values: DVI = NIR - R

#The ASTER sensor of the Terra satellite (EOS AM-1) has 14 channels for wavelength values in the visible, NIR, SWIR and LWIR. Through the bands B1, B2, B3N and B3B belonging to the visible and NIR spectrum - because their wavelengths are between 0.520 µm and 0.860 µm - it is possible to obtain the reflectance values necessary for the calculation of the DVI index in dry tropical forests del Mato Grosso (NT0140)

#How to progress to the name with the previous bands B1, B2, B3N and B3B are identified within the object of interest defor1?

#The name/s attributed to the spectral band/s is to be found in the summary of its informations under the 𝘯𝘢𝘮𝘦𝘴 category

#How to visualize informations of defor1 in R? 

#In R, visualizing informations of an object, name of it followed by Enter as physical command by keyboard

#Syntaxis' function for Windows is: object name ↵ Enter

#Final syntaxis' function in Windows is: defor1 ↵ Enter

#The relatively defor1 information is contained within the table:

   class      : RasterBrick 
dimensions : 478, 714, 341292, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor1.jpg
names      : defor1.1, defor1.2, defor1.3 
min values :        0,        0,        0 
max values :      255,      255,      255 

#The satellite bands of interest in defor1 to me are defor1.1 and defor1.2 as red (R) band B1 and near-infrared (NIR) band B2 respectively

#If the user requires R's function plot(defor1) it will graphically display the reflectance values for the previous spectral bands?

#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my defor1's levels of "interest"² are two set of data which will be graphically visualized in their functional whole being as the spectral bands defor1.1² and defor1.2²?

#Final syntaxis' function in Windows for red (R) band B1 is: defor1$defor1.1

#In R, visualizing informations of defor1$defor1.1, name of it followed by Enter as physical command by keyboard ↵:

defor1$defor1.1

#The relatively defor1$defor1.1 information is contained within the table:

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 478, 714, 341292  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor1.jpg 
names      : defor1.1 
values     : 0, 255  (min, max)

#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: defor1$defor1.2

#In R, visualizing informations of defor1$defor1.2, name of it followed by Enter as physical command by keyboard ↵:

defor1$defor1.2

#The relatively defor1$defor1.2 information is contained within the table:

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 478, 714, 341292  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 714, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor1.jpg 
names      : defor1.2 
values     : 0, 255  (min, max)

#With plot(defor1$defor1.1) the user graphically will visualize the spectral band B1_sre:red stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor1$defor1.1)

#With plot(defor1$defor1.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor1$defor1.2)

#For each defor1 pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!

#The calculation of the DVI index is according to the formula a difference between defor1 $ defor1.1 and defor1 $ 1.2 to represent for each pixel - which constitutes the original image defor1 - the reflectance value as the difference between those associated with the NIR and R bands!

dvi1 <- defor1 $ defor1.1 - defor1 $ defor1.2

#How to graphically visualize the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object defor1? 

#I exploit a function (plot) to obtain visually the vegetation's state of health

#Syntaxis' function for Windows is: plot(object)

#In R function plot (dvi1) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor1.1 to B2/defor1.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#with what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

#plot(dvi1) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(dvi1, col = dbyrb)

#plot(dvi1) must be reformulated by incorporating also the main argument to contextualize the graphical visualization with the title of DVI at time 1:

plot(dvi1, col = dbyrb, main = "DVI at time 1")

#The plot of dvi1 shows the state of health of the vegetation of the dry forests of Mato Grosso through reflectance values measured by the ASTER sensor of the Earth satellite (EOS AM-1) where the more the green is intense, the more the trees of the aforementioned forest are in physiologically and ecologically optimal conditions

#The iterative cycle of functions, which has the purpose of graphically displaying the state of health of the vegetation of the dry forests of Mato Grosso through reflectance values measured by the ASTER sensor of the Earth satellite, is to be run in R also for defor2!

#How to progress to the name with the previous bands B1, B2, B3N and B3B are identified within the object of interest defor2?

#The name/s attributed to the spectral band/s is to be found in the summary of its informations under the 𝘯𝘢𝘮𝘦𝘴 category

#How to visualize informations of defor2 in R? 

#In R, visualizing informations of an object, name of it followed by Enter as physical command by keyboard

#Syntaxis' function for Windows is: object name ↵ Enter

#Final syntaxis' function in Windows is: defor2 ↵ Enter

#The relatively defor1 information is contained within the table:

class      : RasterBrick 
dimensions : 478, 717, 342726, 3  (nrow, ncol, ncell, nlayers)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor2.jpg 
names      : defor2.1, defor2.2, defor2.3 
min values :        0,        0,        0 
max values :      255,      255,      255

#The satellite bands of interest in defor1 to me are defor2.1 and defor2.2 as red (R) band B1 and near-infrared (NIR) band B2 respectively

#If the user requires R's function plot(defor1) it will graphically display the reflectance values for the previous spectral bands?

#I exploit a function ($) to extract, from the initial (plot) of an object represented by a matrix of data, a set of them that will allow the user to visualize graphically the level of ''interest''

#Initial syntaxis' function for Windows: plot(object name$name of the object's level in which the user is interested for graphical visualization)

#What will be the final syntaxis' function in Windows if my defor1's levels of "interest"² are two set of data which will be graphically visualized in their functional whole being as the spectral bands defor1.1² and defor1.2²?

#Final syntaxis' function in Windows for red (R) band B1 is: defor2$defor2.1

#In R, visualizing informations of defor1$defor1.1, name of it followed by Enter as physical command by keyboard ↵:

defor2$defor2.1

#The relatively defor2$defor2.1 information is contained within the table:

class      : RasterLayer 
band       : 1  (of  3  bands)
dimensions : 478, 717, 342726  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor2.jpg 
names      : defor2.1 
values     : 0, 255  (min, max)

#Final syntaxis' function in Windows for near-infrared (NIR) band B2 is: defor2$defor2.2

#In R, visualizing informations of defor2$defor2.2, name of it followed by Enter as physical command by keyboard ↵:

defor2$defor2.2

#The relatively defor1$defor1.2 information is contained within the table:

class      : RasterLayer 
band       : 2  (of  3  bands)
dimensions : 478, 717, 342726  (nrow, ncol, ncell)
resolution : 1, 1  (x, y)
extent     : 0, 717, 0, 478  (xmin, xmax, ymin, ymax)
crs        : NA 
source     : defor2.jpg 
names      : defor2.2 
values     : 0, 255  (min, max)

#With plot(defor1$defor1.1) the user graphically will visualize the spectral band B1_sre:red stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor2$defor2.1)

#With plot(defor1$defor1.2) the user graphically will visualize the spectral band B2_sre:near-infrared stand-alone² in its reflectance's values which colorscale is ax expected by default in R itself

plot(defor2$defor2.2)

#For each defor1 pixel I am considering the value in the NIR band and the value in the R band in difference. From this operation we will obtain a map formed by pixels in difference with respect to the previous values!

#The calculation of the DVI index is according to the formula a difference between defor2$defor2.1 and defor2$2.2 to represent for each pixel - which constitutes the original image defor1 - the reflectance value as the difference between those associated with the NIR and R bands!

dvi2 <- defor2$defor2.1 - defor2$defor2.2

#How to graphically visualize the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object defor1? 

#I exploit a function (plot) to obtain visually the vegetation's state of health

#Syntaxis' function for Windows is: plot(object)

#In R function plot (dvi2) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#with what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

#plot(dvi2) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(dvi2, col = dbyrb)

#plot(dvi2) must be reformulated by incorporating also the main argument to contextualize the graphical visualization with the title of DVI at time 2:

plot(dvi2, col = dbyrb, main = "DVI at time 1")

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:

par(mfcol=c(1,2)) o par(mfrow=c(2,1))

plot(dvi1, col=dbyrb, main="DVI at time 1")

plot(dvi2, col=dbyrb, main="DVI at time 2")

#The plot of dvi1 and dvi2 through the par () function shows the evolution in the state of health of the vegetation of the dry forests of Mato Grosso according to the interpretation given to the 173rd code string

#This evolution in the state of health of the vegetation of the dry forests of Mato Grosso can be graphically displayed in the time difference between dvi1 and dv12 using the plot () function:

difdvi <- dvi1 - dvi2

#How to graphically visualize evolution in the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object difdvi? 

#I exploit a function (plot) to obtain visually the evolution in vegetation's state of health

#Syntaxis' function for Windows is: plot(difdvi)

#In R function plot (dvi2) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#With what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

bwrcp <- colorRampPalette(c('blue','white','red'))(100) 

#plot(dvi2) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(difdvi, col=bwrcp)

#NDVI (N͟ormalized D͟ifference V͟egetation I͟ndex) is another vegetation index calculated as the ratio between the difference (-) and the sum (+) of the near-infrared and red values respectively to the numerator and denominators: #Attention: some software works sequentially without performing a calculation according to a mathematical logic. Hint, round, square and curly brackets!

#NDVI values range from -1 to 1

#The application of the formula for the calculation of NDVI in defor1 strictly depends on the values in the bands defor1$defor1.1 for the near-infrared (NIR) and defor1$1.2 for the red (RED):

ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)

#The above formula can be simplified by having described in the 141st string of code the difference between the values of defor1 $ defor1.1 and defor1 $ defor1.2 as dvi1 index:

ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)

#Attention: some software works sequentially without performing a calculation according to a mathematical logic. Hint, round, square and curly brackets!

#plot(ndvi1) must be reformulated by incorporating the previous colors palette of colors dbyrb: plot(ndvi1, col=dbyrb) will display graphically reflectance's values in a darkblue, yellow, red and black colour scale:

plot(ndvi1, col=dbyrb)

#Also the application of the formula for the calculation of NDVI in defor2 strictly depends on the values in the bands defor1$defor1.1 for the near-infrared (NIR) and defor1$1.2 for the red (RED):

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)

#The above formula can be simplified according to the 259thcode string as index dvi2 <- defor2 $ defor2.1 - defor2 $ defor2.2:

ndvi2 <- dvi2 / (defor2$defor2.1 + defor2$defor2.2)

#plot(ndvi2) must be reformulated by incorporating the previous colors palette of colors dbyrb: plot(ndvi1, col=dbyrb) will display graphically reflectance's values in a darkblue, yellow, red and black colour scale:

plot(ndvi2, col=cl)

#With the function par() there is the possibility of combining multiple object's level of "interest" into one graphical visualization of their called multiframe:

par(mfcol=c(1,2))

plot(ndvi1, col=cl, main="NDVI at time 1")

plot(ndvi2, col=cl, main="NDVI at time 2 ")

#In addition to the DVI and NDVI vegetational indices there are other spectral indices for which a preview is available through the spectralIndices () function applicable to both defor1 and defor2:

vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)

vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)

#spectralIndices() function calculates all indices in one go in C++, which is more efficient than calculating each index separately. By default all indices which can be calculated given the specified indices will be calculated. If you don't want all indices, use the indices argument to specify exactly which indices are to be calculated!

#The following table is for reference for the user should he choose the analysis to be conducted on a satellite image having the names of the main indices, a brief description, the creator and the year of publication, the required bands and the formula to be to apply:

𝙄𝙣𝙙𝙚𝙭 	              𝘿𝙚𝙨𝙘𝙧𝙞𝙥𝙩𝙞𝙤𝙣                	               𝙎𝙤𝙪𝙧𝙘𝙚	               𝘽𝙖𝙣𝙙𝙨	                                  𝙁𝙤𝙧𝙢𝙪𝙡𝙖

CLG	       Green-band Chlorophyll Index	                     Gitelson2003	          redEdge3, green	                  \(redEdge3/green - 1\)
CLRE	       Red-edge-band Chlorophyll Index	                  Gitelson2003	          redEdge3, redEdge1	               \(redEdge3/redEdge1 - 1\)
CTVI	       Corrected Transformed Vegetation Index	         Perry1984	             red, nir	                        \((NDVI + 0.5)/sqrt(abs(NDVI + 0.5))\)
DVI	       Difference Vegetation Index	                     Richardson1977	          red, nir	                        \(s * nir - red\)
EVI	       Enhanced Vegetation Index	                        Huete1999	             red, nir, blue	                  \(G * ((nir - red)/(nir + C1 * red - C2 * blue + L_evi))\)
EVI2	       Two-band Enhanced Vegetation Index	               Jiang 2008	             red, nir	                        \(G * (nir - red)/(nir + 2.4 * red + 1)\)
GEMI	       Global Environmental Monitoring Index	            Pinty1992	             red, nir	                        \((((nir^2 - red^2) * 2 + (nir * 1.5) + (red * 0.5))/(nir + red + 0.5)) * (1 - ((((nir^2 - red^2) * 2 + (nir * 1.5) + (red * 0.5))/(nir + red + 0.5)) * 0.25)) - ((red - 0.125)/(1 - red))\)
GNDVI	       Green Normalised Difference Vegetation Index	   Gitelson1998	          green, nir	                        \((nir - green)/(nir + green)\)
MCARI	       Modified Chlorophyll Absorption Ratio Index	      Daughtery2000	          green, red, redEdge1	            \(((redEdge1 - red) - (redEdge1 - green)) * (redEdge1/red)\)
MNDWI	       Modified Normalised Difference Water Index	      Xu2006	                green, swir2	                     \((green - swir2)/(green + swir2)\)
MSAVI	       Modified Soil Adjusted Vegetation Index	         Qi1994	                red, nir	                        \(nir + 0.5 - (0.5 * sqrt((2 * nir + 1)^2 - 8 * (nir - (2 * red))))\)
MSAVI2       Modified Soil Adjusted Vegetation Index 2	      Qi1994	                red, nir	                        \((2 * (nir + 1) - sqrt((2 * nir + 1)^2 - 8 * (nir - red)))/2\)
MTCIMERIS    Terrestrial Chlorophyll Index	                  DashAndCurran2004	       red, redEdge1, redEdge2	         \((redEdge2 - redEdge1)/(redEdge1 - red)\)
NBRI	       Normalised Burn Ratio Index	                     Garcia1991	             nir, swir3	                        \((nir - swir3)/(nir + swir3)\)
NDREI1	    Normalised Difference Red Edge Index 1	         GitelsonAndMerzlyak1994  redEdge2, redEdge1	               \((redEdge2 - redEdge1)/(redEdge2 + redEdge1)\)
NDREI2	    Normalised Difference Red Edge Index 2	         Barnes2000	             redEdge3, redEdge1	               \((redEdge3 - redEdge1)/(redEdge3 + redEdge1)\)
NDVI	       Normalised Difference Vegetation Index	         Rouse1974	             red, nir	                        \((nir - red)/(nir + red)\)
NDVIC	       Corrected Normalised Difference Vegetation Index	Nemani1993	             red, nir, swir2	                  \((nir - red)/(nir + red) * (1 - ((swir2 - swir2ccc)/(swir2coc - swir2ccc)))\)
NDWI	       Normalised Difference Water Index	               McFeeters1996	          green, nir	                        \((green - nir)/(green + nir)\)
NDWI2	       Normalised Difference Water Index	               Gao1996	                nir, swir2	                        \((nir - swir2)/(nir + swir2)\)
NRVI	       Normalised Ratio Vegetation Index	               Baret1991	             red, nir	                        \((red/nir - 1)/(red/nir + 1)\)
REIP	       Red Edge Inflection Point	                        GuyotAndBarnet1988	    red, redEdge1, redEdge2, redEdge3	\(0.705 + 0.35 * ((red + redEdge3)/(2 - redEdge1))/(redEdge2 - redEdge1)\)
RVI	       Ratio Vegetation Index		                                                 red, nir	                        \(red/nir\)
SATVI	       Soil Adjusted Total Vegetation Index	             Marsett2006	          red, swir2, swir3	               \((swir2 - red)/(swir2 + red + L) * (1 + L) - (swir3/2)\)
SAVI	       Soil Adjusted Vegetation Index	                   Huete1988	             red, nir	                        \((nir - red) * (1 + L)/(nir + red + L)\)
SLAVI	       Specific Leaf Area Vegetation Index	             Lymburger2000	          red, nir, swir2	                  \(nir/(red + swir2)\)
SR	          Simple Ratio Vegetation Index	                   Birth1968	             red, nir	                        \(nir/red\)
TTVI	       Thiam's Transformed Vegetation Index	             Thiam1997	             red, nir	                        \(sqrt(abs((nir - red)/(nir + red) + 0.5))\)
TVI	       Transformed Vegetation Index	                      Deering1975	          red, nir	                        \(sqrt((nir - red)/(nir + red) + 0.5)\)

#plot(vi1) e plot(vi2) are reformulated by incorporating the previous colors palette of colors dbyrb: plot(ndvi1, col=dbyrb) will display graphically reflectance's values in a darkblue, yellow, red and black colour scale:

plot(vi1, col=cl)

plot(vi2, col=cl)

#The evolution in the state of health of the vegetation of the dry forests of Mato Grosso can be graphically displayed in the time difference between ndvi1 and ndvi2 using the plot () function:

difndvi <- dvi1 - dvi2

#How to graphically visualize evolution in the state of health of the vegetation of the dry forests of Mato Grosso from raster multi-layer raster object difndvi? 

#I exploit a function (plot) to obtain visually the evolution in vegetation's state of health

#Syntaxis' function for Windows is: plot(difndvi)

#In R function plot plot(difndvi) lead me to a window with the state of health of the vegetation of the dry forests of Mato Grosso through the concept of reflectance

#Unsatisfactory colors may be changed to foster a clear interpretation of reflectance's values from B1/defor2.1 to B2/defor2.2 representing each spectral bands

#I exploit a function (colorRampPalette) to create a new palette of colors each one of them is indexed: numbered pixel as virtual box matches numbered color as bit depth

#Syntaxis' function for Windows is: name of new palette of colors <- colorRampPalette(array('first color','second color',third color','last color')) (number of depth levels for selected colors)

#A further consideration for upper syntaxis' function: array is indicated by c letter and represents the belonging of new palette's colors to a single object whereas number of depth levels for selected colors is a value freely chosen by the user

#With what has been described so far, I create a futher new palette of colors calleddbyrb in which first, second, third and last color will be darkblue, yellow, red and black respectively with number's value of depth levels taken to 100!

#Final syntaxis' function in Windows is: dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

bwrcp <- colorRampPalette(c('blue','white','red'))(100) 

#plot(dvi2) must be reformulated by incorporating new palette of colors vcp: plot (dvi1, col = dbyrb) will display graphically reflectance's values in a black, white, red, magenta and green colour scale:

plot(ndifdvi, col=bwrcp)

# The last vegetation index that I consider besides those applied to the dry forests of Mato Grosso in Brazil is for the vigor of the vegetation cover on a global scale (worldwide NDVI)

#copNDVI function () creates a RasterLayer (EPSG: 4326) of the global average NDVI value per pixel for the 21st of June over the period 1999-2017 with an overview of 5 KM

# Being a worldwide NDVI, the lack of a satellite image such as defor1 / defor2 is not limiting for the user. The plot () function must be applied directly to copNDVI:

plot (copNDVI)

#In plot (copNDVI), in addition to vegetation cover, I can distinguish the main oceans, seas and other hydrographic basins. Since this analysis is on the vegetational vigor on a global scale, how is it possible not to visualize the water?

#The values that identify water (253, 254 and 255) in copNDVI are to be transformed into NA's through the cbind argument of the reclassify () function:

copNDVI <- reclassify (copNDVI, cbind (253: 255, NA))

#With the previous code string, in the plot (copNDVI) and in the future levelplot (copNDVI) the color of the catchment areas will be transparent so as not to impact on the analysis I am carrying out in R_code_vegetation_indices

#I exploit a function (levelplot) to draw level plots and contour plots

levelplot (copNDVI)

#Important: the above function is operative if and only if the user with the library function loads the previously installed rasterVis package

#Through levelplot (copNDVI) it is possible to observe the "breath" of the Earth from 1997 to 2020. The highest values ​​in the graph are observable in correspondence of the forests-lungs such as the Amazon!

#Sequence of informatic commands for R_code_vegetation_indices.r

install.packages("raster")

install.packages("RStoolbox")

install.packages("rasterVis")

install.packages("rasterdiv")

library(raster) / require(raster)

library(RStoolbox)

library(rasterVis)

library(rasterdiv)

setwd("C:/lab/")

defor1 <- brick("defor1.jpg")

defor2 <- brick("defor2.jpg")

par(mfrow=c(2,1))

plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

defor1

defor1$defor1.1

defor1$defor1.2

plot(defor1$defor1.1)

plot(defor1$defor1.2)

dvi1 <- defor1$defor1.1 - defor1$defor1.2

plot(dvi1)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi1, col= dbyrb)

plot(dvi1, col= dbyrb, main="DVI at time 1")

defor2

defor2$defor2.1

defor2$defor2.2

plot(defor2$defor2.1)

plot(defor2$defor2.2)

dvi2 <- defor2$defor2.1 - defor2$defor2.2

plot(dvi2)

dbyrb <- colorRampPalette(c('darkblue','yellow','red','black'))(100)

plot(dvi2, col=dbyrb, main="DVI at time 2")

par(mfcol=c(1,2)) / par(mfrow=c(2,1))

plot(dvi1, col=dbyrb, main="DVI at time 1")

plot(dvi2, col=dbyrb, main="DVI at time 2")

difdvi <- dvi1 - dvi2

dev.off()

bwrcp <- colorRampPalette(c('blue','white','red'))(100) 

plot(difdvi, col=bwrcp)

ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)

plot(ndvi1, col=dbyrb)

ndvi1 <- dvi1 / (defor1$defor1.1 + defor1$defor1.2)

ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)

ndvi2 <- dvi2 / (defor2$defor2.1 + defor2$defor2.2)

plot(ndvi2, col=dbyrb)

par(mfcol=c(1,2))

plot(ndvi1, col=dbyrb, main="NDVI at time 1")

plot(ndvi2, col=dbyrb, main="NDVI at time 2 ")

library(RStoolbox)

vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)

plot(vi1, col=dbyrb)

vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)

plot(vi2, col=dbyrb)

difndvi <- ndvi1 - ndvi2

plot(difndvi, col=dbyrb)

plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

levelplot(copNDVI)
