library(sdcMicro)

dades <- read.csv(file="data/salaris.csv", header=TRUE, sep=",",
                  colClasses=c("CP"="character"))

# Remove unique identificators
dades <- subset( dades, select = -c( DNI, SS ))
dades$CP <- as.integer(dades$CP)
dades$Edat <- as.numeric(dades$Edat)

dades.an$Edat <- addNoise(dades, variables = c("Edat"), noise = 20, 
                          method = "additive")$xm

dades.rs <- rankSwap(dades , variables=c("Edat"), TopPercent =10,
                     BottomPercent =10 )

# data utility (fomulas al pdf)
dUtility(obj=dades, xm=dades.an)
dUtility(obj=dades, xm=dades.rs)


# data risk
dRisk(dades, xm=dades.an$Edat)
dRisk(dades, xm=dades.rs$Edat)
