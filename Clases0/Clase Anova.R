#05/10/2022
# Nuevo tema
# Anova

library(repmis)

paraje <- source_data("https://www.dropbox.com/s/fbrwxypacjgeayj/Datos_Rascon_Anova.csv?dl=1")

tapply(paraje$DAP, paraje$Paraje, mean)

tapply(paraje$DAP, paraje$Paraje, median)

tapply(paraje$DAP, paraje$Paraje, sd)

tapply(paraje$DAP, paraje$Paraje, var)

tapply(paraje$DAP, paraje$Paraje, length)

boxplot(paraje$DAP ~ paraje$Paraje,
        xlab = "Paraje",
        ylab = "DAP (cm)",
        col = "purple")

# Homogeneidad de varianzas barlett.test


bartlett.test(paraje$DAP, paraje$Paraje)
# H0 = las varianzas son homogeneas
# H1 = las varianzas no son homogeneas

# Normalidad de la variable DAP

shapiro.test(paraje$DAP)
hist(paraje$DAP)

library(dplyr)

Chinatu <- paraje %>%
  filter(Paraje == "Chinatu")

Trinidad <- paraje %>%
  filter(paraje == "Trinidad")

shapiro.test(chinatu$DAP)
shapiro.test(trinidad$DAP)



par.aov <- aov(paraje$DAP ~ paraje$Paraje)
summary(par.aov)


par.aov <- aov(paraje$DAP ~ paraje$Paraje)

# Como la prueba de Anova me dice que hay diferencias 
# significativas, entonces procedo con la prueba de Tukey.
# la prueba de Tukey identificara donde estan las diferencias


TukeyHSD(par.aov)

plot(TukeyHSD(par.aov))

















