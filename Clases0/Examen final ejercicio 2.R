#Ejercicio 2
# 30/11/2022
# Corresponde al Examen Final.


Riego_analisis<- read.csv("Datos/Analisis de varianza Anova.csv")

#Explora los datos de la muestra mediante gráficos y descriptivos. 
#¿Observamos diferencias en los valorespromedios y de variabilidad por grupos?

boxplot(Riego_analisis$Crecimiento ~ Riego_analisis$Riego)

#Aplique la función tapply y encuentre las varianzas de los cinco tratamientos. 
#¿Cuántas veces es ladiferencia entre la varainza más pequeña y la más grande?

tapply(Riego_analisis$Crecimiento, Riego_analisis$Riego, mean)
        
tapply(Riego_analisis$Crecimiento, Riego_analisis$Riego, median)

tapply(Riego_analisis$Crecimiento, Riego_analisis$Riego, sd)

tapply(Riego_analisis$Crecimiento, Riego_analisis$Riego, var)

tapply(Riego_analisis$Crecimiento, Riego_analisis$Riego, length)

#Realiza un test F (ANOVA) para comparar las medias de las 5 muestras 
#¿Cuáles serían las hipótesisnula y alternativa?

bartlett.test(Riego_analisis$Crecimiento, Riego_analisis$Riego)

shapiro.test(Riego_analisis$Crecimiento)

par.aov <- aov(Riego_analisis$Crecimiento ~ Riego_analisis$Riego)

summary(par.aov)

TukeyHSD(par.aov)

plot(TukeyHSD(par.aov))

















