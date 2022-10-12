# Examen
# Analisis de varianza


Analisis_Suelo<- read.csv("Datos/Analisis de varianza.csv", header = T)


# Observamos diferencias en los valores promedios y de variabilidad por grupos?

# Asi es, debido a que en la consaola corresponden numeros del promedio y hay diferencias en variablididad,

boxplot(Analisis_Suelo$Nematodos ~ Analisis_Suelo$Suelo,
        xlab = "Suelo Tipo",
        ylab = "Nematados numero",
        col = "Gold")


# Cuántas veces es la diferencia entre la varainza más pequeña y la más grande?

# Si, es 6 veces mayor, ya que en el apartado de S1, da resultado de 571.7 y en el S5, corresponde a,
# 90.8

tapply(Analisis_Suelo$Nematodos, Analisis_Suelo$Suelo, mean)

tapply(Analisis_Suelo$Nematodos, Analisis_Suelo$Suelo, median)

tapply(Analisis_Suelo$Nematodos, Analisis_Suelo$Suelo, sd)

tapply(Analisis_Suelo$Nematodos, Analisis_Suelo$Suelo, var)

tapply(Analisis_Suelo$Nematodos, Analisis_Suelo$Suelo, length)


bartlett.test(Analisis_Suelo$Nematodos, Analisis_Suelo$Suelo)


shapiro.test(Analisis_Suelo$Nematodos)

par.aov <- aov(Analisis_Suelo$Nematodos ~ Analisis_Suelo$Suelo)

summary(par.aov)

# Cuáles serían las hipótesisnula y alternativa?
#H0 = Las varianzas son homogeneas
#H1 = Las varianzas no son homogenas

#Describe los resultados obtenidos indicando cuál es el valor del estadístico de contraste (F),
#los gradosde libertad del factor, los grados de libertad residuales y el valor de P.

# Valor estadistico de F = 0.000207

# Grados de Libertad = 4

# Grados de libertad residuales = 20

# Valor de P = 9.287


TukeyHSD(par.aov)

# Si existen diferencias significativas, 
# realiza una prueba de Tukey e indica donde existen diferencias significativas.

# Si existen en S4-S1 Y S4-S2

plot(TukeyHSD(par.aov))


#¿cuál sería tu conclusión en el contexto del problema?

# Como se menciona en el histograma existe un %95 de nivel de confidecialidad























