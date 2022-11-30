#Ejercicio 1
#30/11/2022
#Examen Final.
#Alumno: Alejandro Zapata

Suelo_Analisis<- read.csv("Datos/Analisis de Varianza 3.csv")

# Explora los datos de la muestra mediante gráficos y descriptivos. 
#¿Observamos diferencias en los valores promedios y de variabilidad por grupos?
boxplot(Suelo_Analisis$Nematodo ~ Suelo_Analisis$Suelo,
        xlab = "Tipo de suelo",
        ylab = "Numero de nematodos",
        col = "Green")
#Aplique la función tapply y encuentre las varianzas de los cinco tratamientos. 
#¿Cuántas veces es ladiferencia entre la varainza más pequeña y la más grande?
tapply(Suelo_Analisis$Nematodo, Suelo_Analisis$Suelo, mean)
tapply(Suelo_Analisis$Nematodo, Suelo_Analisis$Suelo, median)
tapply(Suelo_Analisis$Nematodo, Suelo_Analisis$Suelo, sd)
tapply(Suelo_Analisis$Nematodo, Suelo_Analisis$Suelo, var)
tapply(Suelo_Analisis$Nematodo, Suelo_Analisis$Suelo, length)
#Realiza un test F (ANOVA) para comparar las medias de las 5 muestras 
#¿Cuáles serían las hipótesis
bartlett.test(Suelo_Analisis$Nematodo, Suelo_Analisis$Suelo)
shapiro.test(Suelo_Analisis$Nematodo)
par.aov <- aov(Suelo_Analisis$Nematodo ~ Suelo_Analisis$Suelo)
summary(par.aov)
TukeyHSD(par.aov)
plot(TukeyHSD(par.aov))