library(sdcMicro)

dades <- read.csv(file="data/salaris.csv", header=TRUE, sep=",",
                  colClasses=c("CP"="character"))


# Remove unique identificators
dadesNoIden <- subset( dades, select = -c( DNI, SS ))
dadesNoIden$CP <- as.integer(dadesNoIden$CP)
dadesNoIden$Edat <- as.numeric(dadesNoIden$Edat)
head(dadesNoIden)


# Table is a frequency table with with values of the parameter. If the frequency
# is 1, then can be uniquely identified.

dadesCPFreq <- table(dades$CP)
sum(dadesCPFreq == 1)

dadesEdatFreq <- table(dades$Edat)
sum(dadesEdatFreq == 1)

a<- table(dades$Edat, dades$CP)
sum(a == 1)

#dadesCPEdatFreq <- as.data.frame(table(dades$Edat, dades$CP))
#dadesCPEdatFreq <- dadesCPEdatFreq[dadesCPEdatFreq$Freq != 0,]
#sum(dadesCPEdatFreq$Freq==1)

