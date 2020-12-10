library(sdcMicro)

dades <- read.csv(file="data/salaris.csv", header=TRUE, sep=",",
                  colClasses=c("CP"="character"))

# Remove unique identificators
dadesNoIden <- subset( dades, select = -c( DNI, SS ))
dadesNoIden$CP <- as.integer(dadesNoIden$CP)
dadesNoIden$Edat <- as.numeric(dadesNoIden$Edat)

# Add additive noise to the Edat column.
#     noise argument indicate the relative % of noise added
#     method additive takes in accound the size and sd of the sample
#     method correlated consevate the covariance (2 variables or more)
#     method outdect only add noise to the outliers

dades.an = dadesNoIden
dades.an$Edat <- addNoise(dadesNoIden, variables = c("Edat"), noise = 20, 
                          method = "additive")$xm

plot(cbind(dades$Edat, dades.an$Edat),
     ylim=c(min(dades$Edat),max(dades$Edat)),
     xlim=c(min(dades$Edat),max(dades$Edat)),
     xlab="Original", ylab="Masked", main="Additive Noise - Edat (P=0.20)")
abline(a=0, b=1, col="red")
