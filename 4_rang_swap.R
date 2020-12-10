library(sdcMicro)

dades <- read.csv(file="data/salaris.csv", header=TRUE, sep=",",
                  colClasses=c("CP"="character"))

# Remove unique identificators
dadesNoIden <- subset( dades, select = -c( DNI, SS ))
dadesNoIden$CP <- as.integer(dadesNoIden$CP)
dadesNoIden$Edat <- as.numeric(dadesNoIden$Edat)

# Apply rank swapping to a column. First sorts the values and the interchange
# the values in a certain rank (TopPercent and BottomPercent)

dades.rs <- dadesNoIden
dades.rs <- rankSwap(dades , variables=c("Edat"), TopPercent =10,
                     BottomPercent =10)

plot(cbind(dades$Edat, dades.rs$Edat),
     ylim=c(min(dades$Edat),max(dades$Edat)),
     xlim=c(min(dades$Edat),max(dades$Edat)),
     xlab="Original", ylab="Masked", main="Rank Swap - Edat (P=0.10)")
abline(a=0, b=1, col="red")

