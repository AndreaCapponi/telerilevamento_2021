#Code time series 
#Greenland increases of temeprature
#Data and code from Emanuela Cosma
#library
#setwd# install.packages("raster")
library(raster)
 
setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac
> install.packages("RStoolbox")
provo con l'URL 'https://cran.mirror.garr.it/CRAN/bin/windows/contrib/4.0/RStoolbox_0.2.6.zip'
Content type 'application/zip' length 2170101 bytes (2.1 MB)
downloaded 2.1 MB

package ‘RStoolbox’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\PC\AppData\Local\Temp\RtmpEx7d3z\downloaded_packages
> library(RStoolbox)
