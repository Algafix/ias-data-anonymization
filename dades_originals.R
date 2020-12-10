library(sdcMicro)

dades <- read.csv(file="data/salaris.csv", header=TRUE, sep=",",
                  colClasses=c("CP"="character"))

# General data info
colnames(dades)
head(dades)
summary(dades)

dades[1:10, 'Edat']

# mean and sd
print(paste("Atribut 'Edat': mean value =", mean(dades[, 'Edat']), "and SD =",
            sd(dades[, 'Edat']), sep=" "))

# Data Visualization
plot(sort(dades[, 'Edat']), type="p", col="red", xlab="Registres", ylab="Valor", main="Edat")






