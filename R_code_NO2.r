# 1. Set working directory EN
#Which is the title for R's developing code?
#My R code for a time series
#Which folder must R use in the computer for this new code?
#In the computer R must use the subfolder named greenland within the "mother" folder simply called lab
#I exploit a function (setwd) for the association between R and greenland subfolder
#Adapted syntaxis' function for Windows is: setwd("C:/name of the folder in which there is a subfolder of interest to the user/name of the subfolder which will be associated with R")
#Final syntaxis' function for Windows is: setwd("C:/lab/greenland")

library(raster)

library(RStoolbox)

setwd("C:/lab/EN/")

# 2. Import the first image (single band)

EN01 <- raster("EN_0001.png")

# 3. Plot the first imported image with your favorite colour RampPalette

blbprcp <- colorRampPalette(c("blue","light blue","pink","red"))(100)

plot(EN01, col=blbprcp)

# 4. Import the last image (13th) and plot it with the previous colour RampPalette

EN13 <- raster("EN_0013.png")

blbprcp <- colorRampPalette(c("blue","light blue","pink","red"))(100)

plot(EN13, col=blbprcp)

# 5. Make the difference between the two images and plot it

difEN <- EN13 - EN01 / difEN <- EN01 - EN01

plot(difEN, col=blbprcp)

# 6. Plot the previous images all together

par(mfrow=c(1,3))

plot(EN01, col=blbprcp)

plot(EN13, col=blbprcp)

plot(difEN, col=blbprcp)

#It's possibile an addition with the main title (main= NO2 January or NO2 March and NO2 difference)!

# 7. Import the whole set

ENsubfolderlist <- list.files(pattern="EN_")

ENsubfolderlist

ENimportedr <- lapply(ENsubfolderlist,raster)

ENimportedr

ENfinalset <- stack(ENimportedr)

plot(ENfinalset)

# 8. Repete the plot of 1 and 13 images using the stack

dev.off

par(mfrow=c(2,1))

plot(ENsubfolderlist$EN_001)

plot(ENsubfolderlist$EN_013)

# 9. Compute a PCA over the 13 images

ENPCA <- rasterPCA(ENfinalset)

summary(ENPCA$model)

dev.off

plotRGB(ENPCA$map, r=1, g=2, b=3, strech="lin")

# 10. Compute the local variability of the first component

PC1sd <- focal(ENPCA$map$PC1, w=matrix(1/9 [...]



